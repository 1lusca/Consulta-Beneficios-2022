import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _nameCategories =
          prefs.getStringList('ff_nameCategories') ?? _nameCategories;
    });
    _safeInit(() {
      _idCategories = prefs.getStringList('ff_idCategories') ?? _idCategories;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _nameCategories = [];
  List<String> get nameCategories => _nameCategories;
  set nameCategories(List<String> _value) {
    _nameCategories = _value;
    prefs.setStringList('ff_nameCategories', _value);
  }

  void addToNameCategories(String _value) {
    _nameCategories.add(_value);
    prefs.setStringList('ff_nameCategories', _nameCategories);
  }

  void removeFromNameCategories(String _value) {
    _nameCategories.remove(_value);
    prefs.setStringList('ff_nameCategories', _nameCategories);
  }

  void removeAtIndexFromNameCategories(int _index) {
    _nameCategories.removeAt(_index);
    prefs.setStringList('ff_nameCategories', _nameCategories);
  }

  void updateNameCategoriesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nameCategories[_index] = updateFn(_nameCategories[_index]);
    prefs.setStringList('ff_nameCategories', _nameCategories);
  }

  void insertAtIndexInNameCategories(int _index, String _value) {
    _nameCategories.insert(_index, _value);
    prefs.setStringList('ff_nameCategories', _nameCategories);
  }

  bool _isCatUpdated = false;
  bool get isCatUpdated => _isCatUpdated;
  set isCatUpdated(bool _value) {
    _isCatUpdated = _value;
  }

  dynamic _posts;
  dynamic get posts => _posts;
  set posts(dynamic _value) {
    _posts = _value;
  }

  dynamic _searchPosts;
  dynamic get searchPosts => _searchPosts;
  set searchPosts(dynamic _value) {
    _searchPosts = _value;
  }

  bool _quizPossuiCad = true;
  bool get quizPossuiCad => _quizPossuiCad;
  set quizPossuiCad(bool _value) {
    _quizPossuiCad = _value;
  }

  double _quizRendaBruta = 0.0;
  double get quizRendaBruta => _quizRendaBruta;
  set quizRendaBruta(double _value) {
    _quizRendaBruta = _value;
  }

  int _quizNIntegrantes = 0;
  int get quizNIntegrantes => _quizNIntegrantes;
  set quizNIntegrantes(int _value) {
    _quizNIntegrantes = _value;
  }

  int _quizNIntegrantesInfanc = 0;
  int get quizNIntegrantesInfanc => _quizNIntegrantesInfanc;
  set quizNIntegrantesInfanc(int _value) {
    _quizNIntegrantesInfanc = _value;
  }

  int _quizNIntegrantesGravida = 0;
  int get quizNIntegrantesGravida => _quizNIntegrantesGravida;
  set quizNIntegrantesGravida(int _value) {
    _quizNIntegrantesGravida = _value;
  }

  int _quizNIntegrantesCidada = 0;
  int get quizNIntegrantesCidada => _quizNIntegrantesCidada;
  set quizNIntegrantesCidada(int _value) {
    _quizNIntegrantesCidada = _value;
  }

  String _calendarioMes = '';
  String get calendarioMes => _calendarioMes;
  set calendarioMes(String _value) {
    _calendarioMes = _value;
  }

  String _calendarioNis = '';
  String get calendarioNis => _calendarioNis;
  set calendarioNis(String _value) {
    _calendarioNis = _value;
  }

  List<String> _comoSacarFgts = [
    'Demissão sem justa causa, pelo empregador',
    'Término do contrato por prazo determinado',
    'Aposentadoria',
    'Aquisição de casa própria',
    'Rescisão por falecimento do empregador ou nulidade do contrato',
    'Falecimento do trabalhador',
    'Idade igual ou superior a 70 anos',
    'Portador de HIV - SIDA/AIDS (trabalhador ou dependente)',
    'Neoplasia maligna (trabalhador ou dependente)',
    'Influência de doenças graves',
    'Estágio Terminal por doença grave (trabalhador ou dependente)',
    'Necessidade pessoal decorrente de desastres naturais',
    'Suspensão do Trabalho Avulso',
    'Rescisão do contrato por culpa recíproca ou força maior'
  ];
  List<String> get comoSacarFgts => _comoSacarFgts;
  set comoSacarFgts(List<String> _value) {
    _comoSacarFgts = _value;
  }

  void addToComoSacarFgts(String _value) {
    _comoSacarFgts.add(_value);
  }

  void removeFromComoSacarFgts(String _value) {
    _comoSacarFgts.remove(_value);
  }

  void removeAtIndexFromComoSacarFgts(int _index) {
    _comoSacarFgts.removeAt(_index);
  }

  void updateComoSacarFgtsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _comoSacarFgts[_index] = updateFn(_comoSacarFgts[_index]);
  }

  void insertAtIndexInComoSacarFgts(int _index, String _value) {
    _comoSacarFgts.insert(_index, _value);
  }

  String _mesAniverFgts = '';
  String get mesAniverFgts => _mesAniverFgts;
  set mesAniverFgts(String _value) {
    _mesAniverFgts = _value;
  }

  double _saldoFgts = 0.0;
  double get saldoFgts => _saldoFgts;
  set saldoFgts(double _value) {
    _saldoFgts = _value;
  }

  List<String> _idCategories = [];
  List<String> get idCategories => _idCategories;
  set idCategories(List<String> _value) {
    _idCategories = _value;
    prefs.setStringList('ff_idCategories', _value);
  }

  void addToIdCategories(String _value) {
    _idCategories.add(_value);
    prefs.setStringList('ff_idCategories', _idCategories);
  }

  void removeFromIdCategories(String _value) {
    _idCategories.remove(_value);
    prefs.setStringList('ff_idCategories', _idCategories);
  }

  void removeAtIndexFromIdCategories(int _index) {
    _idCategories.removeAt(_index);
    prefs.setStringList('ff_idCategories', _idCategories);
  }

  void updateIdCategoriesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _idCategories[_index] = updateFn(_idCategories[_index]);
    prefs.setStringList('ff_idCategories', _idCategories);
  }

  void insertAtIndexInIdCategories(int _index, String _value) {
    _idCategories.insert(_index, _value);
    prefs.setStringList('ff_idCategories', _idCategories);
  }

  bool _buscandoArtigo = true;
  bool get buscandoArtigo => _buscandoArtigo;
  set buscandoArtigo(bool _value) {
    _buscandoArtigo = _value;
  }

  String _homeTotalPages = '';
  String get homeTotalPages => _homeTotalPages;
  set homeTotalPages(String _value) {
    _homeTotalPages = _value;
  }

  int _homeCurrentPage = 1;
  int get homeCurrentPage => _homeCurrentPage;
  set homeCurrentPage(int _value) {
    _homeCurrentPage = _value;
  }

  String _homeCategories = '';
  String get homeCategories => _homeCategories;
  set homeCategories(String _value) {
    _homeCategories = _value;
  }

  String _homeCategoriesExclude = '';
  String get homeCategoriesExclude => _homeCategoriesExclude;
  set homeCategoriesExclude(String _value) {
    _homeCategoriesExclude = _value;
  }

  String _searchTotalPages = '';
  String get searchTotalPages => _searchTotalPages;
  set searchTotalPages(String _value) {
    _searchTotalPages = _value;
  }

  int _searchCurrentPage = 1;
  int get searchCurrentPage => _searchCurrentPage;
  set searchCurrentPage(int _value) {
    _searchCurrentPage = _value;
  }

  String _searchCategories = '';
  String get searchCategories => _searchCategories;
  set searchCategories(String _value) {
    _searchCategories = _value;
  }

  String _searchCategoriesExclude = '';
  String get searchCategoriesExclude => _searchCategoriesExclude;
  set searchCategoriesExclude(String _value) {
    _searchCategoriesExclude = _value;
  }

  String _searchText = '';
  String get searchText => _searchText;
  set searchText(String _value) {
    _searchText = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
