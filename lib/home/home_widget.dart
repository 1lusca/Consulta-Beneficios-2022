import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().isCatUpdated != true) {
        FFAppState().update(() {
          FFAppState().buscandoArtigo = true;
        });
        _model.getCategoriesResult = await GetCategoriesCall.call(
          exclude: '43,1,55',
        );
        if ((_model.getCategoriesResult?.succeeded ?? true)) {
          FFAppState().update(() {
            FFAppState().idCategories = (GetCategoriesCall.idCat(
              (_model.getCategoriesResult?.jsonBody ?? ''),
            ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .map((e) => e.toString())
                .toList()
                .toList()
                .cast<String>();
            FFAppState().isCatUpdated = true;
            FFAppState().nameCategories = (GetCategoriesCall.nomeCat(
              (_model.getCategoriesResult?.jsonBody ?? ''),
            ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .map((e) => e.toString())
                .toList()
                .toList()
                .cast<String>();
          });
        } else {
          FFAppState().update(() {
            FFAppState().isCatUpdated = false;
            FFAppState().buscandoArtigo = false;
          });
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                  child: AlertDialog(
                title: Text('Erro'),
                content: Text(
                    'Houve um erro ao buscar os artigos, tente novamente.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ));
            },
          );
          return;
        }
      }
      setState(() {
        FFAppState().buscandoArtigo = true;
        FFAppState().homeCategories = '41,40,36,37,38,39';
        FFAppState().homeCategoriesExclude = '43,55,1';
      });
      _model.getPostsResult = await GetPostsCall.call(
        perPage: '10',
        categories: FFAppState().homeCategories,
        categoriesExclude: FFAppState().homeCategoriesExclude,
        page: '1',
      );
      if ((_model.getPostsResult?.succeeded ?? true)) {
        FFAppState().update(() {
          FFAppState().posts = (_model.getPostsResult?.jsonBody ?? '');
          FFAppState().homeTotalPages =
              (_model.getPostsResult?.getHeader('x-wp-totalpages') ?? '');
        });
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
                child: AlertDialog(
              title: Text('Erro'),
              content:
                  Text('Houve um erro ao buscar os artigos, tente novamente.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            ));
          },
        );
      }

      FFAppState().update(() {
        FFAppState().buscandoArtigo = false;
      });
    });
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
            child: Stack(
              children: [
                SingleChildScrollView(
                  controller: _model.columnController,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Image.asset(
                                'assets/images/logo-white.png',
                                width: 60.0,
                                height: 60.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 20.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 8.0,
                                  borderWidth: 1.0,
                                  buttonSize: 50.0,
                                  fillColor: Color(0xFF12378F),
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 22.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('busca');
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Programas Sociais',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 20.0, 0.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          controller: _model.rowController1,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 180.0,
                                height: 215.0,
                                decoration: BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: Image.asset(
                                      'assets/images/bg-beneficios.png',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Stack(
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('auxilioBrasil');
                                      },
                                      child: Container(
                                        width: 180.0,
                                        height: 215.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFF12378F),
                                              Color(0xB612378F)
                                            ],
                                            stops: [0.0, 1.0],
                                            begin:
                                                AlignmentDirectional(0.0, 1.0),
                                            end: AlignmentDirectional(0, -1.0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 8.0,
                                              borderWidth: 1.0,
                                              buttonSize: 50.0,
                                              fillColor: Colors.white,
                                              icon: Icon(
                                                Icons.people,
                                                color: Color(0xFF12378F),
                                                size: 22.0,
                                              ),
                                              onPressed: () async {
                                                context
                                                    .pushNamed('auxilioBrasil');
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'Auxílio Brasil',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 20.0),
                                            child: Text(
                                              'Mais informações',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: 180.0,
                                  height: 215.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: Image.asset(
                                        'assets/images/bg-beneficios.png',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('fgts');
                                        },
                                        child: Container(
                                          width: 180.0,
                                          height: 215.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF12378F),
                                                Color(0xB612378F)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, 1.0),
                                              end:
                                                  AlignmentDirectional(0, -1.0),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 8.0,
                                                borderWidth: 1.0,
                                                buttonSize: 50.0,
                                                fillColor: Colors.white,
                                                icon: Icon(
                                                  Icons.people,
                                                  color: Color(0xFF12378F),
                                                  size: 22.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: Text(
                                                'FGTS',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 20.0),
                                              child: Text(
                                                'Mais informações',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: 180.0,
                                  height: 215.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: Image.asset(
                                        'assets/images/bg-beneficios.png',
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('pis');
                                        },
                                        child: Container(
                                          width: 180.0,
                                          height: 215.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF12378F),
                                                Color(0xB612378F)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, 1.0),
                                              end:
                                                  AlignmentDirectional(0, -1.0),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 8.0,
                                                borderWidth: 1.0,
                                                buttonSize: 50.0,
                                                fillColor: Colors.white,
                                                icon: Icon(
                                                  Icons.people,
                                                  color: Color(0xFF12378F),
                                                  size: 22.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: Text(
                                                'PIS / PASEP',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 20.0),
                                              child: Text(
                                                'Mais informações',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Notícias recentes',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('busca');
                                },
                                child: Text(
                                  'Ver todos',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF12378F),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 20.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final rowCategories =
                                FFAppState().nameCategories.toList();
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              controller: _model.rowController2,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(rowCategories.length,
                                    (rowCategoriesIndex) {
                                  final rowCategoriesItem =
                                      rowCategories[rowCategoriesIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        FFAppState().update(() {
                                          FFAppState().buscandoArtigo = true;
                                          FFAppState().homeCategories =
                                              functions.setQueryCategory(
                                                  rowCategoriesIndex,
                                                  FFAppState()
                                                      .idCategories
                                                      .toList());
                                        });
                                        _model.getPostsResult2 =
                                            await GetPostsCall.call(
                                          categories:
                                              FFAppState().homeCategories,
                                          page: '1',
                                          perPage: '10',
                                        );
                                        if ((_model
                                                .getPostsResult2?.succeeded ??
                                            true)) {
                                          FFAppState().update(() {
                                            FFAppState().posts = (_model
                                                    .getPostsResult2
                                                    ?.jsonBody ??
                                                '');
                                            FFAppState()
                                                .homeTotalPages = (_model
                                                    .getPostsResult2
                                                    ?.getHeader(
                                                        'x-wp-totalpages') ??
                                                '');
                                            FFAppState().homeCurrentPage = 1;
                                          });
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                  child: AlertDialog(
                                                title: Text('Erro'),
                                                content: Text(
                                                    'Houve um erro ao buscar os artigos, tente novamente.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ));
                                            },
                                          );
                                        }

                                        FFAppState().update(() {
                                          FFAppState().buscandoArtigo = false;
                                        });

                                        setState(() {});
                                      },
                                      text: rowCategoriesItem,
                                      options: FFButtonOptions(
                                        height: 34.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Colors.white,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF666666),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Color(0xFFC6C6C6),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      ),
                      Stack(
                        children: [
                          if (FFAppState().buscandoArtigo == false)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 15.0, 20.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final listViewPosts = getJsonField(
                                        FFAppState().posts,
                                        r'''$''',
                                      ).toList();
                                      if (listViewPosts.isEmpty) {
                                        return Center(
                                          child: Image.network(
                                            '',
                                            width: 100.0,
                                            height: 100.0,
                                          ),
                                        );
                                      }
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listViewPosts.length,
                                        itemBuilder:
                                            (context, listViewPostsIndex) {
                                          final listViewPostsItem =
                                              listViewPosts[listViewPostsIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'artigo',
                                                  queryParameters: {
                                                    'data': serializeParam(
                                                      listViewPostsItem,
                                                      ParamType.JSON,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0xFFC6C6C6),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.00, 0.00),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  0.0),
                                                        ),
                                                        child:
                                                            CachedNetworkImage(
                                                          fadeInDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          fadeOutDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      500),
                                                          imageUrl: functions
                                                              .getImage(
                                                                  getJsonField(
                                                            listViewPostsItem,
                                                            r'''$._embedded["wp:featuredmedia"][0].link''',
                                                          ).toString()),
                                                          width: 104.0,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        8.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Text(
                                                              functions
                                                                  .getCategory(
                                                                      getJsonField(
                                                                        listViewPostsItem,
                                                                        r'''$.categories[0]''',
                                                                      )
                                                                          .toString(),
                                                                      FFAppState()
                                                                          .nameCategories
                                                                          .toList(),
                                                                      FFAppState()
                                                                          .idCategories
                                                                          .toList()),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        4.0,
                                                                        8.0,
                                                                        8.0),
                                                            child: AutoSizeText(
                                                              functions
                                                                  .formatTitle(
                                                                      getJsonField(
                                                                listViewPostsItem,
                                                                r'''$.title.rendered''',
                                                              ).toString()),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        controller: _model.listViewController,
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: FFAppState()
                                                    .homeCurrentPage ==
                                                1
                                            ? null
                                            : () async {
                                                var _shouldSetState = false;
                                                setState(() {
                                                  FFAppState().homeCurrentPage =
                                                      FFAppState()
                                                              .homeCurrentPage +
                                                          -1;
                                                });
                                                if (FFAppState()
                                                        .homeCurrentPage >=
                                                    1) {
                                                  setState(() {
                                                    FFAppState()
                                                        .buscandoArtigo = true;
                                                  });
                                                  _model.getPostsPrevResult =
                                                      await GetPostsCall.call(
                                                    perPage: '10',
                                                    categories: FFAppState()
                                                        .homeCategories,
                                                    categoriesExclude: FFAppState()
                                                        .homeCategoriesExclude,
                                                    page: FFAppState()
                                                        .homeCurrentPage
                                                        .toString(),
                                                  );
                                                  _shouldSetState = true;
                                                  if ((_model.getPostsPrevResult
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .posts = (_model
                                                              .getPostsPrevResult
                                                              ?.jsonBody ??
                                                          '');
                                                      FFAppState()
                                                          .homeTotalPages = (_model
                                                              .getPostsPrevResult
                                                              ?.getHeader(
                                                                  'x-wp-totalpages') ??
                                                          '');
                                                    });
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                            child: AlertDialog(
                                                          title: Text('Erro'),
                                                          content: Text(
                                                              'Houve um erro ao buscar os artigos, tente novamente.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ));
                                                      },
                                                    );
                                                    setState(() {
                                                      FFAppState()
                                                              .homeCurrentPage =
                                                          FFAppState()
                                                                  .homeCurrentPage +
                                                              1;
                                                    });
                                                  }

                                                  FFAppState().update(() {
                                                    FFAppState()
                                                        .buscandoArtigo = false;
                                                  });
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                } else {
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }

                                                if (_shouldSetState)
                                                  setState(() {});
                                              },
                                        text: 'Página anterior',
                                        options: FFButtonOptions(
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.white,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFF12378F),
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          disabledColor: Colors.white,
                                          disabledTextColor: Color(0xFF666666),
                                        ),
                                      ),
                                      RichText(
                                        textScaleFactor: MediaQuery.of(context)
                                            .textScaleFactor,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: FFAppState()
                                                  .homeCurrentPage
                                                  .toString(),
                                              style: TextStyle(
                                                color: Color(0xFF12378F),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' \\ ',
                                              style: TextStyle(
                                                color: Color(0xFF666666),
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: FFAppState().homeTotalPages,
                                              style: TextStyle(
                                                color: Color(0xFF666666),
                                                fontSize: 12.0,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: FFAppState()
                                                    .homeCurrentPage ==
                                                functions.convertStrToInt(
                                                    FFAppState().homeTotalPages)
                                            ? null
                                            : () async {
                                                var _shouldSetState = false;
                                                setState(() {
                                                  FFAppState().homeCurrentPage =
                                                      FFAppState()
                                                              .homeCurrentPage +
                                                          1;
                                                });
                                                if (FFAppState()
                                                        .homeCurrentPage <=
                                                    functions.convertStrToInt(
                                                        FFAppState()
                                                            .homeTotalPages)) {
                                                  setState(() {
                                                    FFAppState()
                                                        .buscandoArtigo = true;
                                                  });
                                                  _model.getPostsNextResult =
                                                      await GetPostsCall.call(
                                                    perPage: '10',
                                                    categories: FFAppState()
                                                        .homeCategories,
                                                    categoriesExclude: FFAppState()
                                                        .homeCategoriesExclude,
                                                    page: FFAppState()
                                                        .homeCurrentPage
                                                        .toString(),
                                                  );
                                                  _shouldSetState = true;
                                                  if ((_model.getPostsNextResult
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .posts = (_model
                                                              .getPostsNextResult
                                                              ?.jsonBody ??
                                                          '');
                                                      FFAppState()
                                                          .homeTotalPages = (_model
                                                              .getPostsNextResult
                                                              ?.getHeader(
                                                                  'x-wp-totalpages') ??
                                                          '');
                                                    });
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                            child: AlertDialog(
                                                          title: Text('Erro'),
                                                          content: Text(
                                                              'Houve um erro ao buscar os artigos, tente novamente.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ));
                                                      },
                                                    );
                                                    setState(() {
                                                      FFAppState()
                                                              .homeCurrentPage =
                                                          FFAppState()
                                                                  .homeCurrentPage +
                                                              -1;
                                                    });
                                                  }

                                                  FFAppState().update(() {
                                                    FFAppState()
                                                        .buscandoArtigo = false;
                                                  });
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                } else {
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }

                                                if (_shouldSetState)
                                                  setState(() {});
                                              },
                                        text: 'Próxima página',
                                        options: FFButtonOptions(
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.white,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFF12378F),
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          disabledColor: Colors.white,
                                          disabledTextColor: Color(0xFF666666),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          if (FFAppState().buscandoArtigo == true)
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: Lottie.asset(
                                  'assets/lottie_animations/loading.json',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.contain,
                                  animate: true,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1.00, 1.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 50.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 8.0,
                      borderWidth: 1.0,
                      buttonSize: 50.0,
                      fillColor: Color(0xFF12378F),
                      icon: Icon(
                        Icons.arrow_upward_rounded,
                        color: Colors.white,
                        size: 22.0,
                      ),
                      onPressed: () async {
                        await _model.columnController?.animateTo(
                          0,
                          duration: Duration(milliseconds: 250),
                          curve: Curves.ease,
                        );
                      },
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
