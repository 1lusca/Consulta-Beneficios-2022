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
import 'busca_model.dart';
export 'busca_model.dart';

class BuscaWidget extends StatefulWidget {
  const BuscaWidget({Key? key}) : super(key: key);

  @override
  _BuscaWidgetState createState() => _BuscaWidgetState();
}

class _BuscaWidgetState extends State<BuscaWidget> {
  late BuscaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuscaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().buscandoArtigo = true;
        FFAppState().searchCategories = '41,40,36,37,38,39';
        FFAppState().searchCategoriesExclude = '43,55,1';
      });
      _model.getPostsSearchResult3 = await GetPostsCall.call(
        perPage: '10',
        page: '1',
        categories: FFAppState().searchCategories,
        categoriesExclude: FFAppState().searchCategoriesExclude,
      );
      if ((_model.getPostsSearchResult3?.succeeded ?? true)) {
        FFAppState().update(() {
          FFAppState().searchPosts =
              (_model.getPostsSearchResult3?.jsonBody ?? '');
          FFAppState().searchTotalPages =
              (_model.getPostsSearchResult3?.getHeader('x-wp-totalpages') ??
                  '');
          FFAppState().searchCurrentPage = 1;
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

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Color(0xFFC6C6C6),
                                  borderRadius: 8.0,
                                  borderWidth: 1.0,
                                  buttonSize: 50.0,
                                  fillColor: Colors.white,
                                  icon: Icon(
                                    Icons.arrow_back_outlined,
                                    color: Color(0xFFC6C6C6),
                                    size: 22.0,
                                  ),
                                  onPressed: () async {
                                    context.pop();
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onFieldSubmitted: (_) async {
                                    FFAppState().update(() {
                                      FFAppState().buscandoArtigo = true;
                                      FFAppState().searchText =
                                          _model.textController.text;
                                      FFAppState().searchCategories =
                                          '41,40,36,37,38,39';
                                      FFAppState().searchCategoriesExclude =
                                          '43,55,1';
                                    });
                                    _model.getPostsSearchResult1 =
                                        await GetPostsCall.call(
                                      search: FFAppState().searchText,
                                      perPage: '10',
                                      categories: FFAppState().searchCategories,
                                      categoriesExclude:
                                          FFAppState().searchCategoriesExclude,
                                      page: '1',
                                    );
                                    if ((_model
                                            .getPostsSearchResult1?.succeeded ??
                                        true)) {
                                      FFAppState().update(() {
                                        FFAppState().searchPosts = (_model
                                                .getPostsSearchResult1
                                                ?.jsonBody ??
                                            '');
                                        FFAppState().searchTotalPages = (_model
                                                .getPostsSearchResult1
                                                ?.getHeader(
                                                    'x-wp-totalpages') ??
                                            '');
                                        FFAppState().searchCurrentPage = 1;
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
                                                onPressed: () => Navigator.pop(
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
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFC6C6C6),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    suffixIcon: Icon(
                                      Icons.search,
                                      color: Color(0xFF12378F),
                                      size: 22.0,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF666666),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 25.0, 0.0, 0.0),
                          child: Text(
                            'Todas categorias',
                            textAlign: TextAlign.center,
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
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 20.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final categories =
                                FFAppState().nameCategories.toList();
                            return Wrap(
                              spacing: 15.0,
                              runSpacing: 15.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: List.generate(categories.length,
                                  (categoriesIndex) {
                                final categoriesItem =
                                    categories[categoriesIndex];
                                return FFButtonWidget(
                                  onPressed: () async {
                                    FFAppState().update(() {
                                      FFAppState().buscandoArtigo = true;
                                      FFAppState().searchCategories =
                                          functions.setQueryCategory(
                                              categoriesIndex,
                                              FFAppState()
                                                  .idCategories
                                                  .toList());
                                      FFAppState().searchCategoriesExclude =
                                          '43,55,1';
                                      FFAppState().searchText =
                                          _model.textController.text;
                                    });
                                    _model.getSearchPostsResult2 =
                                        await GetPostsCall.call(
                                      categories: FFAppState().searchCategories,
                                      search: FFAppState().searchText,
                                      perPage: '10',
                                      page: '1',
                                      categoriesExclude:
                                          FFAppState().searchCategoriesExclude,
                                    );
                                    if ((_model
                                            .getSearchPostsResult2?.succeeded ??
                                        true)) {
                                      FFAppState().update(() {
                                        FFAppState().searchPosts = (_model
                                                .getSearchPostsResult2
                                                ?.jsonBody ??
                                            '');
                                        FFAppState().searchCurrentPage = 1;
                                        FFAppState().searchTotalPages = (_model
                                                .getSearchPostsResult2
                                                ?.getHeader(
                                                    'x-wp-totalpages') ??
                                            '');
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
                                                onPressed: () => Navigator.pop(
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
                                  text: categoriesItem,
                                  options: FFButtonOptions(
                                    height: 34.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  showLoadingIndicator: false,
                                );
                              }),
                            );
                          },
                        ),
                      ),
                      Stack(
                        children: [
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
                          if (FFAppState().buscandoArtigo == false)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 30.0, 20.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final listViewPosts =
                                          FFAppState().searchPosts.toList();
                                      if (listViewPosts.isEmpty) {
                                        return Center(
                                          child: Image.asset(
                                            'assets/images/empty.png',
                                            width: 200.0,
                                            height: 200.0,
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
                                                    .searchCurrentPage ==
                                                1
                                            ? null
                                            : () async {
                                                var _shouldSetState = false;
                                                setState(() {
                                                  FFAppState()
                                                          .searchCurrentPage =
                                                      FFAppState()
                                                              .searchCurrentPage +
                                                          -1;
                                                });
                                                if (FFAppState()
                                                        .searchCurrentPage >=
                                                    1) {
                                                  setState(() {
                                                    FFAppState()
                                                        .buscandoArtigo = true;
                                                  });
                                                  _model.getPostsSearchPrevResult =
                                                      await GetPostsCall.call(
                                                    perPage: '10',
                                                    categories: FFAppState()
                                                        .searchCategories,
                                                    categoriesExclude: FFAppState()
                                                        .searchCategoriesExclude,
                                                    page: FFAppState()
                                                        .searchCurrentPage
                                                        .toString(),
                                                    search:
                                                        FFAppState().searchText,
                                                  );
                                                  _shouldSetState = true;
                                                  if ((_model
                                                          .getPostsSearchPrevResult
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .searchPosts = (_model
                                                              .getPostsSearchPrevResult
                                                              ?.jsonBody ??
                                                          '');
                                                      FFAppState()
                                                          .searchTotalPages = (_model
                                                              .getPostsSearchPrevResult
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
                                                              .searchCurrentPage =
                                                          FFAppState()
                                                                  .searchCurrentPage +
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
                                                  .searchCurrentPage
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
                                              text:
                                                  FFAppState().searchTotalPages,
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
                                                    .searchCurrentPage ==
                                                functions.convertStrToInt(
                                                    FFAppState()
                                                        .searchTotalPages)
                                            ? null
                                            : () async {
                                                var _shouldSetState = false;
                                                setState(() {
                                                  FFAppState()
                                                          .searchCurrentPage =
                                                      FFAppState()
                                                              .searchCurrentPage +
                                                          1;
                                                });
                                                if (FFAppState()
                                                        .searchCurrentPage <=
                                                    functions.convertStrToInt(
                                                        FFAppState()
                                                            .searchTotalPages)) {
                                                  setState(() {
                                                    FFAppState()
                                                        .buscandoArtigo = true;
                                                  });
                                                  _model.getPostsSearchNextResult =
                                                      await GetPostsCall.call(
                                                    perPage: '10',
                                                    categories: FFAppState()
                                                        .searchCategories,
                                                    categoriesExclude: FFAppState()
                                                        .searchCategoriesExclude,
                                                    page: FFAppState()
                                                        .searchCurrentPage
                                                        .toString(),
                                                    search:
                                                        FFAppState().searchText,
                                                  );
                                                  _shouldSetState = true;
                                                  if ((_model
                                                          .getPostsSearchNextResult
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .searchPosts = (_model
                                                              .getPostsSearchNextResult
                                                              ?.jsonBody ??
                                                          '');
                                                      FFAppState()
                                                          .searchTotalPages = (_model
                                                              .getPostsSearchNextResult
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
                                                              .searchCurrentPage =
                                                          FFAppState()
                                                                  .searchCurrentPage +
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
