import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pis_model.dart';
export 'pis_model.dart';

class PisWidget extends StatefulWidget {
  const PisWidget({Key? key}) : super(key: key);

  @override
  _PisWidgetState createState() => _PisWidgetState();
}

class _PisWidgetState extends State<PisWidget> {
  late PisModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PisModel());
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF12378F),
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
                              20.0, 25.0, 0.0, 25.0),
                          child: Text(
                            'PIS / PASEP',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 25.0, 0.0, 0.0),
                    child: Text(
                      'O que é o PIS / PASEP?',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                    child: Text(
                      'PIS ou Programa de Integração Social permite que o empregado da iniciativa privada tem acesso aos benefícios determinados por lei e ainda colabora para o desenvolvimento das empresas do setor.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF666666),
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 0.0, 0.0),
                    child: Text(
                      'PIS',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                    child: Text(
                      'Por meio da Lei Complementar n° 7/1970, foi criado o Programa de Integração Social (PIS). O programa buscava a integração do empregado do setor privado com o desenvolvimento da empresa. O pagamento do PIS é de responsabilidade da CAIXA​.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF666666),
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 0.0, 0.0),
                    child: Text(
                      'PASEP',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                    child: Text(
                      'Paralelamente à criação do PIS, a Lei Complementar n° 8/1970 instituiu o Programa de Formação do Patrimônio do Servidor Público (PASEP), com o qual União, Estados, Municípios, Distrito Federal e territórios contribuíam com o fundo destinado aos empregados do setor público. O pagamento do PASEP é feito pelo Banco do Brasil.​',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF666666),
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 0.0, 0.0),
                    child: Text(
                      'Abono Salarial',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                    child: Text(
                      'Atribuído ao participante cadastrado no programa PIS/PASEP há pelo menos 5 anos, com média de salarial mensal inferior a 2 salários mínimos e vínculo empregatício de 30 dias consecutivos, no ano anterior ao do pagamento.\n\nO valor a ser recebido é calculado pelo Ministério do Trabalho e Emprego.\n\nO abono salarial não sacado até o prazo fixado no calendário divulgado pelo Ministério do Trabalho e Emprego retorna para os cofres do Governo Federal.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF666666),
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
