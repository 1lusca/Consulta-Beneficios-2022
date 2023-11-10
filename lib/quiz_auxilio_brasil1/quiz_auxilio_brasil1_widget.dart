import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'quiz_auxilio_brasil1_model.dart';
export 'quiz_auxilio_brasil1_model.dart';

class QuizAuxilioBrasil1Widget extends StatefulWidget {
  const QuizAuxilioBrasil1Widget({Key? key}) : super(key: key);

  @override
  _QuizAuxilioBrasil1WidgetState createState() =>
      _QuizAuxilioBrasil1WidgetState();
}

class _QuizAuxilioBrasil1WidgetState extends State<QuizAuxilioBrasil1Widget> {
  late QuizAuxilioBrasil1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizAuxilioBrasil1Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF12378F),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 25.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 8.0,
                          borderWidth: 1.0,
                          buttonSize: 50.0,
                          fillColor: Colors.white,
                          icon: Icon(
                            Icons.arrow_back,
                            color: Color(0xFF12378F),
                            size: 22.0,
                          ),
                          onPressed: () async {
                            context.pop();
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 25.0, 0.0, 0.0),
                        child: Text(
                          'Pergunta 1',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 5.0, 20.0, 0.0),
                        child: Text(
                          'O responsável pela família possui Cadastro Único?',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 5.0, 20.0, 25.0),
                        child: Text(
                          'Cadastro Único para Programas Sociais ou CadÚnico é o programa responsável por fazer a coleta de dados que busca identificar famílias em situação de pobreza ou vulnerabilidade social. Ele também é utilizado como meio para a inscrição em programas sociais como o Auxílio Brasil.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      FFAppState().update(() {
                        FFAppState().quizPossuiCad = true;
                      });
                    },
                    text: 'Sim',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: colorFromCssString(
                        valueOrDefault<String>(
                          FFAppState().quizPossuiCad ? '#12378F' : '#FFFFFF',
                          '#FFFFFF',
                        ),
                        defaultColor: Colors.white,
                      ),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: colorFromCssString(
                                  valueOrDefault<String>(
                                    FFAppState().quizPossuiCad
                                        ? '#FFFFFF'
                                        : '#666666',
                                    '#666666',
                                  ),
                                  defaultColor: Color(0xFF666666),
                                ),
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: colorFromCssString(
                          valueOrDefault<String>(
                            FFAppState().quizPossuiCad ? '#12378F' : '#C6C6C6',
                            '#C6C6C6',
                          ),
                          defaultColor: Color(0xFFC6C6C6),
                        ),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      FFAppState().update(() {
                        FFAppState().quizPossuiCad = false;
                      });
                    },
                    text: 'Não',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: colorFromCssString(
                        valueOrDefault<String>(
                          FFAppState().quizPossuiCad ? '#FFFFFF' : '#12378F',
                          '#FFFFFF',
                        ),
                        defaultColor: Colors.white,
                      ),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: colorFromCssString(
                                  valueOrDefault<String>(
                                    FFAppState().quizPossuiCad
                                        ? '#666666'
                                        : '#FFFFFF',
                                    '#666666',
                                  ),
                                  defaultColor: Color(0xFF666666),
                                ),
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: colorFromCssString(
                          valueOrDefault<String>(
                            FFAppState().quizPossuiCad ? '#C6C6C6' : '#12378F',
                            '#C6C6C6',
                          ),
                          defaultColor: Color(0xFFC6C6C6),
                        ),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 200.0, 20.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (FFAppState().quizPossuiCad == true) {
                          context.pushNamed('quizAuxilioBrasil2');

                          return;
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                  child: AlertDialog(
                                title: Text('Auxílio Brasil'),
                                content: Text(
                                    'Você precisa estar cadastrado no Cadastro Único para receber o benefício.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              ));
                            },
                          );
                          return;
                        }
                      },
                      text: 'Continuar',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF12378F),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
