import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String getCategory(
  String id,
  List<String> listNameCategories,
  List<String> listIdCategories,
) {
  print("id: " + id);

  for (var i = 0; i < listIdCategories.length; i++) {
    print("id list: " + listIdCategories[i]);
    if (id == listIdCategories[i]) {
      return listNameCategories[i];
    }
  }

  return "";
}

String getImage(String link) {
  print(link);

  return link;
}

String formatTitle(String text) {
  if (text.contains("&#8211;")) {
    text = text.replaceAll("&#8211;", "-");
  }

  return text.toUpperCase();
}

String setQueryCategory(
  int index,
  List<String> idCategories,
) {
  if (index < idCategories.length) {
    return idCategories[index];
  }
  return "";
}

String getDate(String date) {
  var temp = DateTime.parse(date);
  //return DateFormat("dd/MM/yy").format(temp);
  return DateFormat("dd").format(temp) +
      " de " +
      DateFormat("MMMM").format(temp) +
      " de " +
      DateFormat("yyyy").format(temp);
}

String formatText(String text) {
  if (text.contains(' class="wp-block-heading"')) {
    text = text.replaceAll(' class="wp-block-heading"', '');
  }

  if (text.contains('<p>')) {
    text = text.replaceAll('<p>',
        '<p style="color: #666; font-family: Poppins, sans-serif; font-size: 12px; font-style: normal; font-weight: 400; line-height: normal;">');
  }

  if (text.contains('<h1>')) {
    text = text.replaceAll('<h1>',
        '<h1 style="color: #000; font-family: Poppins, sans-serif; font-size: 16px; font-style: normal; font-weight: 700; line-height: normal;">');
  }

  if (text.contains('<h2>')) {
    text = text.replaceAll('<h2>',
        '<h2 style="color: #000; font-family: Poppins, sans-serif; font-size: 14px; font-style: normal; font-weight: 700; line-height: normal;">');
  }

  if (text.contains('<h3>')) {
    text = text.replaceAll('<h3>',
        '<h3 style="color: #000; font-family: Poppins, sans-serif; font-size: 12px; font-style: normal; font-weight: 700; line-height: normal;">');
  }

  if (text.contains('<a')) {
    text = text.replaceAll('<a',
        '<a style="color: #12378F; font-family: Poppins, sans-serif; font-size: 12px; font-style: normal; font-weight: 500; line-height: normal;"');
  }

  if (text.contains('<li>')) {
    text = text.replaceAll('<li>',
        '<li style="color: #666; font-family: Poppins, sans-serif; font-size: 12px; font-style: normal; font-weight: 500; line-height: normal;">');
  }

  return text;
}

String getNReplies(List<String> replies) {
  return replies.length.toString();
}

double calculaBeneficioBrasil(
  int nIntegrantes,
  int nCriancas1,
  int nCriancas2,
  int nCriancas3,
  double renda,
) {
  double rendaPerCapita = (renda / nIntegrantes);
  double valorBeneficio = 0;

  // piso
  if (rendaPerCapita <= 210) {
    valorBeneficio = valorBeneficio + 400;
  }

  // criancas até 3 anos
  if (nCriancas1 > 0) {
    if (nCriancas1 >= 5) {
      valorBeneficio = valorBeneficio + (5 * 130.0);
    } else {
      valorBeneficio = valorBeneficio + (nCriancas1 * 130.0);
    }
  }

  // adolescentes/criancas de 3 - 21 anos e gestantes
  if (nCriancas2 > 0) {
    if (nCriancas2 >= 5) {
      valorBeneficio = valorBeneficio + (5 * 65);
    } else {
      valorBeneficio = valorBeneficio + (nCriancas2 * 65);
    }
  }

  // extrema pobreza
  if ((valorBeneficio / nIntegrantes) <= 89) {
    valorBeneficio =
        valorBeneficio + (nIntegrantes * (89 - rendaPerCapita)) + 1;
  }

  // creche
  if (nCriancas3 > 0) {
    valorBeneficio = valorBeneficio + 200;
  }

  return valorBeneficio;
}

bool calculaRenda(
  double renda,
  int nIntegrantes,
) {
  if ((renda / nIntegrantes) <= 210) {
    return true;
  }
  return false;
}

dynamic beneficioDetallhado(
  int nCriancas1,
  int nCriancas2,
  int nCriancas3,
) {
  var json = [];

  double vlrCriancas1;
  if (nCriancas1 > 0) {
    if (nCriancas1 >= 5) {
      vlrCriancas1 = 5 * 130.0;
    } else {
      vlrCriancas1 = nCriancas1 * 130.0;
    }
    json.add({"nome": "Benefício Primeira Infância", "valor": vlrCriancas1});
  }

  double vlrCriancas2;
  if (nCriancas2 > 0) {
    if (nCriancas2 >= 5) {
      vlrCriancas2 = (5 * 65.0);
    } else {
      vlrCriancas2 = (nCriancas2 * 65.0);
    }
    json.add({"nome": "Benefício Composição Familiar", "valor": vlrCriancas2});
  }

  double vlrCriancas3 = 0;
  if (nCriancas3 > 0) {
    if (nCriancas3 > 0) {
      vlrCriancas3 = vlrCriancas3 + 200;
    }
    json.add({"nome": "Auxílio Criança Cidadã", "valor": vlrCriancas3});
  }

  return json;
}

String calendarioAuxilioBrasil(
  String nis,
  String mes,
) {
  int index = 0;
  if (mes == "Janeiro") {
    index = 0;
  } else if (mes == "Fevereiro") {
    index = 1;
  } else if (mes == "Março") {
    index = 2;
  } else if (mes == "Abril") {
    index = 3;
  } else if (mes == "Maio") {
    index = 4;
  } else if (mes == "Junho") {
    index = 5;
  } else if (mes == "Julho") {
    index = 6;
  } else if (mes == "Agosto") {
    index = 7;
  } else if (mes == "Setembro") {
    index = 8;
  } else if (mes == "Outubro") {
    index = 9;
  } else if (mes == "Novembro") {
    index = 10;
  } else if (mes == "Dezembro") {
    index = 11;
  }

  if (nis == 0.toString()) {
    List nis = [
      "31",
      "28",
      "31",
      "28",
      "31",
      "30",
      "31",
      "31",
      "29",
      "31",
      "30",
      "22"
    ];
    return nis[index] + " de " + mes + " de 2023";
  } else if (nis == 1.toString()) {
    List nis = [
      "18",
      "13",
      "20",
      "14",
      "18",
      "19",
      "18",
      "18",
      "18",
      "18",
      "17",
      "11"
    ];
    return nis[index] + " de " + mes + " de 2023";
  } else if (nis == 2.toString()) {
    List nis = [
      "19",
      "14",
      "21",
      "17",
      "19",
      "20",
      "19",
      "21",
      "19",
      "19",
      "20",
      "12"
    ];
    return nis[index] + " de " + mes + " de 2023";
  } else if (nis == 3.toString()) {
    List nis = [
      "20",
      "15",
      "22",
      "18",
      "22",
      "21",
      "20",
      "22",
      "20",
      "20",
      "21",
      "13"
    ];
    return nis[index] + " de " + mes + " de 2023";
  } else if (nis == 4.toString()) {
    List nis = [
      "23",
      "16",
      "23",
      "19",
      "23",
      "22",
      "21",
      "23",
      "21",
      "23",
      "22",
      "14"
    ];
    return nis[index] + " de " + mes + " de 2023";
  } else if (nis == 5.toString()) {
    List nis = [
      "24",
      "17",
      "24",
      "20",
      "24",
      "23",
      "24",
      "24",
      "22",
      "24",
      "23",
      "15"
    ];
    return nis[index] + " de " + mes + " de 2023";
  } else if (nis == 6.toString()) {
    List nis = [
      "25",
      "22",
      "27",
      "24",
      "25",
      "26",
      "25",
      "25",
      "25",
      "25",
      "24",
      "18"
    ];
    return nis[index] + " de " + mes + " de 2023";
  } else if (nis == 7.toString()) {
    List nis = [
      "26",
      "23",
      "28",
      "25",
      "26",
      "27",
      "26",
      "28",
      "26",
      "26",
      "27",
      "19"
    ];
    return nis[index] + " de " + mes + " de 2023";
  } else if (nis == 8.toString()) {
    List nis = [
      "27",
      "24",
      "29",
      "26",
      "29",
      "28",
      "27",
      "29",
      "27",
      "27",
      "28",
      "20"
    ];
    return nis[index] + " de " + mes + " de 2023";
  } else if (nis == 9.toString()) {
    List nis = [
      "30",
      "27",
      "30",
      "27",
      "30",
      "29",
      "28",
      "30",
      "28",
      "30",
      "29",
      "21"
    ];
    return nis[index] + " de " + mes + " de 2023";
  }

  return "";
}

String calendarioSaqueAniverFgts(String mes) {
  if (mes == "Janeiro") {
    return "A partir de 2 de Janeiro de 2023 até 31 de Março de 2023";
  } else if (mes == "Fevereiro") {
    return "A partir de 1 de Fevereiro de 2023 até 28 de Abril de 2023";
  } else if (mes == "Março") {
    return "A partir de 1 de Março de 2023 até 31 de Maio de 2023";
  } else if (mes == "Abril") {
    return "A partir de 3 de Abril de 2023 até 30 de Junho de 2023";
  } else if (mes == "Maio") {
    return "A partir de 2 de Maio de 2023 até 31 de Julho de 2023";
  } else if (mes == "Junho") {
    return "A partir de 1 de Junho de 2023 até 31 de Agosto de 2023";
  } else if (mes == "Julho") {
    return "A partir de 3 de Julho de 2023 até 29 de Setembro de 2023";
  } else if (mes == "Agosto") {
    return "A partir de 1 de Agosto de 2023 até 31 de Outubro de 2023";
  } else if (mes == "Setembro") {
    return "A partir de 1 de Setembro de 2023 até 30 de Novembro de 2023";
  } else if (mes == "Outubro") {
    return "A partir de 2 de Outubro de 2023 até 29 de Dezembro de 2023";
  } else if (mes == "Novembro") {
    return "A partir de 1 de Novembro de 2023 até 31 de Janeiro de 2024";
  } else if (mes == "Dezembro") {
    return "A partir de 1 de Dezembro de 2023 até 29 de Fevereiro de 2024";
  }

  return "";
}

double calculoSaqueAniverFgts(double saldo) {
  int parcelaFixa = 0;
  double percentual = 0;

  if (saldo <= 500) {
    parcelaFixa = 0;
    percentual = 0.5;
  } else if (saldo > 500 && saldo <= 1000) {
    parcelaFixa = 50;
    percentual = 0.4;
  } else if (saldo > 1000 && saldo <= 5000) {
    parcelaFixa = 150;
    percentual = 0.3;
  } else if (saldo > 5000 && saldo <= 10000) {
    parcelaFixa = 650;
    percentual = 0.2;
  } else if (saldo > 10000 && saldo <= 15000) {
    parcelaFixa = 1150;
    percentual = 0.15;
  } else if (saldo > 15000 && saldo <= 20000) {
    parcelaFixa = 1900;
    percentual = 0.10;
  } else if (saldo > 20000) {
    parcelaFixa = 2900;
    percentual = 0.05;
  }

  saldo = (saldo * percentual) + parcelaFixa;

  return saldo;
}

bool containsLinks(String text) {
  if (text.contains("Veja Também:") || text.contains("Veja também:")) {
    return true;
  }
  return false;
}

List<String> getTextLinks(String text) {
  if (text.contains("Veja Também:")) {
    text = text.substring((text.indexOf("Veja Também:") + 12), text.length);

    if (text.contains("<strong>")) {
      text = text.replaceAll('<strong>', '');
    }

    if (text.contains("</strong>")) {
      text = text.replaceAll('</strong>', '');
    }

    text = text.substring(0, text.indexOf("</ul>"));

    final regex = RegExp(r'<a[^>]*>(.*?)<\/a>');
    final matches = regex.allMatches(text);
    final links =
        matches.map((match) => match.group(1)).cast<String>().toList();

    return links;
  } else if (text.contains("Veja também:")) {
    text = text.substring((text.indexOf("Veja também:") + 12), text.length);

    if (text.contains("<strong>")) {
      text = text.replaceAll('<strong>', '');
    }

    if (text.contains("</strong>")) {
      text = text.replaceAll('</strong>', '');
    }

    text = text.substring(0, text.indexOf("</ul>"));

    final regex = RegExp(r'<a[^>]*>(.*?)<\/a>');
    final matches = regex.allMatches(text);
    final links =
        matches.map((match) => match.group(1)).cast<String>().toList();

    return links;
  }

  List<String>? links = ["lala", "la"];
  return links;
}

String getLinkSlug(String text) {
  text = text.substring(42, text.length);

  String barra = text.substring(text.length - 1, text.length);
  if (barra == "/") {
    text = text.substring(0, text.length - 1);
  }

  text = text.substring(text.indexOf("/") + 1, text.length);

  if (text.contains("/")) {
    text = text.substring(text.indexOf("/") + 1, text.length);
  }

  return text;
}

List<String> getUrlLinks(String text) {
  if (text.contains("Veja Também:")) {
    text = text.substring((text.indexOf("Veja Também:") + 12), text.length);

    if (text.contains("<strong>")) {
      text = text.replaceAll('<strong>', '');
    }

    if (text.contains("</strong>")) {
      text = text.replaceAll('</strong>', '');
    }

    text = text.substring(0, text.indexOf("</ul>"));

    final regex = RegExp(r'<a[^>]* href="([^"]*)"[^>]*>');
    final matches = regex.allMatches(text);
    List<String>? links =
        matches.map((match) => match.group(1)).cast<String>().toList();
    return links;
  }

  List<String>? links = ["lala", "la"];
  return links;
}

String divideText(
  String text,
  int nText,
) {
  String text1 = '';
  String text2 = '';
  if (text.contains('Veja também:')) {
    text1 = text.substring(0, text.indexOf('Veja também:'));
    text2 = text.substring(
        text.indexOf("</ul>", text.indexOf("Veja também:")), text.length);
    text = text.replaceRange((text.indexOf("Veja também:")),
        text.indexOf("</ul>", text.indexOf("Veja também:")), '');
  } else if (text.contains('Veja Também:')) {
    text1 = text.substring(0, text.indexOf('Veja Também:'));
    text2 = text.substring(
        text.indexOf("</ul>", text.indexOf("Veja Também:")), text.length);
    text = text.replaceRange((text.indexOf("Veja Também:")),
        text.indexOf("</ul>", text.indexOf("Veja também:")), '');
  } else {
    text1 = text.substring(0, text.indexOf(".", (text.length ~/ 4)) + 1);
    text2 = text.substring(text.indexOf(text1) + text1.length, text.length);
  }

  if (nText == 1) {
    return text1;
  } else {
    return text2;
  }
}

String formatComments(String text) {
  if (text.contains("<p>", 0)) {
    text = text.replaceAll("<p>", "");
  }

  if (text.contains("</p>", 0)) {
    text = text.replaceAll("</p>", "");
  }

  if (text.contains("<strong>", 0)) {
    text = text.replaceAll("<strong>", "");
  }

  if (text.contains("</strong>", 0)) {
    text = text.replaceAll("</strong>", "");
  }

  if (text.contains("<h3>", 0)) {
    text = text.replaceAll("<h3>", "");
  }

  if (text.contains("</h3>", 0)) {
    text = text.replaceAll("</h3>", "");
  }

  if (text.contains("<h2>", 0)) {
    text = text.replaceAll("<h2>", "");
  }

  if (text.contains("</h2>", 0)) {
    text = text.replaceAll("</h2>", "");
  }

  if (text.contains("<ul>", 0)) {
    text = text.replaceAll("<ul>", "");
  }

  if (text.contains("</ul>", 0)) {
    text = text.replaceAll("</ul>", "");
  }

  if (text.contains("<li>", 0)) {
    text = text.replaceAll("<li>", "");
  }

  if (text.contains("</li>", 0)) {
    text = text.replaceAll("</li>", "");
  }

  if (text.contains("&#8211;")) {
    text = text.replaceAll("&#8211;", "-");
  }

  if (text.contains("-&nbsp;")) {
    text = text.replaceAll("&nbsp;", " ");
  }

  if (text.contains("<figure", 0) && text.contains("</figure>", 0)) {
    text = text.replaceRange(
        text.indexOf("<figure", 0), (text.indexOf("</figure>", 0) + 10), "");
  }

  if (text.contains('<h3 class="wp-block-heading">', 0)) {
    text = text.replaceAll('<h3 class="wp-block-heading">', '');
  }

  if (text.contains('<h2 class="wp-block-heading">', 0)) {
    text = text.replaceAll('<h2 class="wp-block-heading">', '');
  }

  if (text.contains('<h1 class="wp-block-heading">', 0)) {
    text = text.replaceAll('<h1 class="wp-block-heading">', '');
  }

  bool contains = text.contains("<a");

  while (contains) {
    text = text.replaceRange(
        text.indexOf("<a", 0), text.indexOf("</a>", 0) + 5, "");

    contains = text.contains("<a");
  }

  text = text.replaceAll("\n\n", "\n");
  text = text.replaceAll("\n\n\n", "\n");
  text = text.replaceAll("\n\n\n\n", "\n");
  text = text.replaceAll("\n\n\n\n\n", "\n");
  text = text.trim();

  return text;
}

int convertStrToInt(String value) {
  return int.parse(value);
}
