import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'artigo_model.dart';
export 'artigo_model.dart';

class ArtigoWidget extends StatefulWidget {
  const ArtigoWidget({
    Key? key,
    this.data,
  }) : super(key: key);

  final dynamic data;

  @override
  _ArtigoWidgetState createState() => _ArtigoWidgetState();
}

class _ArtigoWidgetState extends State<ArtigoWidget> {
  late ArtigoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArtigoModel());

    _model.nomeController ??= TextEditingController();
    _model.nomeFocusNode ??= FocusNode();

    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.comentarioController ??= TextEditingController();
    _model.comentarioFocusNode ??= FocusNode();
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 500),
                        fadeOutDuration: Duration(milliseconds: 500),
                        imageUrl: functions.getImage(getJsonField(
                          widget.data,
                          r'''$._embedded["wp:featuredmedia"][0].link''',
                        ).toString()),
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 25.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                context.safePop();
                              },
                              text: 'Voltar',
                              icon: Icon(
                                Icons.arrow_back_sharp,
                                color: Color(0xFFC6C6C6),
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                width: 160.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFC6C6C6),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 1.0,
                                borderSide: BorderSide(
                                  color: Color(0xFFC6C6C6),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await actions.share(
                                    getJsonField(
                                      widget.data,
                                      r'''$.link''',
                                    ).toString(),
                                    'normal',
                                  );
                                },
                                text: 'Compartilhar',
                                icon: Icon(
                                  Icons.share_sharp,
                                  color: Colors.white,
                                  size: 22.0,
                                ),
                                options: FFButtonOptions(
                                  width: 160.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF12378F),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
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
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              functions.getDate(getJsonField(
                                widget.data,
                                r'''$.date''',
                              ).toString()),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF666666),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Text(
                              functions.getCategory(
                                  getJsonField(
                                    widget.data,
                                    r'''$.categories[0]''',
                                  ).toString(),
                                  FFAppState().nameCategories.toList(),
                                  FFAppState().idCategories.toList()),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF666666),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 12.0, 20.0, 0.0),
                          child: Text(
                            functions.formatTitle(getJsonField(
                              widget.data,
                              r'''$.title.rendered''',
                            ).toString()),
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
                            20.0, 12.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'por',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF666666),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  3.0, 0.0, 0.0, 0.0),
                              child: Text(
                                getJsonField(
                                  widget.data,
                                  r'''$._embedded.author[0].name''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF666666),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 20.0, 30.0),
                        child: FlutterFlowWebView(
                          content: functions.formatText(functions.divideText(
                              getJsonField(
                                widget.data,
                                r'''$.content.rendered''',
                              ).toString(),
                              1)),
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 100.0,
                          verticalScroll: false,
                          horizontalScroll: false,
                          html: true,
                        ),
                      ),
                      if (functions.containsLinks(getJsonField(
                            widget.data,
                            r'''$.content.rendered''',
                          ).toString()) ==
                          true)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Text(
                            'Veja Também:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF666666),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      if (functions.containsLinks(getJsonField(
                            widget.data,
                            r'''$.content.rendered''',
                          ).toString()) ==
                          true)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 12.0, 20.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final lvLinks = functions
                                  .getTextLinks(getJsonField(
                                    widget.data,
                                    r'''$.content.rendered''',
                                  ).toString())
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: lvLinks.length,
                                itemBuilder: (context, lvLinksIndex) {
                                  final lvLinksItem = lvLinks[lvLinksIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.getPostResult =
                                            await GetPostCall.call(
                                          slug: functions.getLinkSlug(
                                              functions.getUrlLinks(widget.data!
                                                  .toString())[lvLinksIndex]),
                                        );
                                        if ((_model.getPostResult?.succeeded ??
                                            true)) {
                                          context.pushNamed(
                                            'artigo',
                                            queryParameters: {
                                              'data': serializeParam(
                                                getJsonField(
                                                  (_model.getPostResult
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$[0]''',
                                                ),
                                                ParamType.JSON,
                                              ),
                                            }.withoutNulls,
                                          );
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

                                        setState(() {});
                                      },
                                      child: Text(
                                        lvLinksItem,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF12378F),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  );
                                },
                                controller: _model.listViewController1,
                              );
                            },
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 30.0, 20.0, 25.0),
                        child: FlutterFlowWebView(
                          content: functions.formatText(functions.divideText(
                              getJsonField(
                                widget.data,
                                r'''$.content.rendered''',
                              ).toString(),
                              2)),
                          height: MediaQuery.sizeOf(context).height * 0.5,
                          verticalScroll: false,
                          horizontalScroll: false,
                          html: true,
                        ),
                      ),
                      Divider(
                        height: 1.0,
                        thickness: 1.0,
                        indent: 20.0,
                        endIndent: 20.0,
                        color: Color(0xFFC6C6C6),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 25.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await actions.share(
                                  getJsonField(
                                    widget.data,
                                    r'''$.link''',
                                  ).toString(),
                                  'whats',
                                );
                              },
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF00A859),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: FaIcon(
                                    FontAwesomeIcons.whatsapp,
                                    color: Colors.white,
                                    size: 22.0,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await actions.share(
                                  getJsonField(
                                    widget.data,
                                    r'''$.link''',
                                  ).toString(),
                                  'face',
                                );
                              },
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF295396),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: FaIcon(
                                    FontAwesomeIcons.facebookF,
                                    color: Colors.white,
                                    size: 22.0,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await actions.share(
                                  getJsonField(
                                    widget.data,
                                    r'''$.link''',
                                  ).toString(),
                                  'twitter',
                                );
                              },
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF50ABF1),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: FaIcon(
                                    FontAwesomeIcons.twitter,
                                    color: Colors.white,
                                    size: 22.0,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await actions.share(
                                  getJsonField(
                                    widget.data,
                                    r'''$.link''',
                                  ).toString(),
                                  'telegram',
                                );
                              },
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF039BE5),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: FaIcon(
                                    FontAwesomeIcons.telegramPlane,
                                    color: Colors.white,
                                    size: 22.0,
                                  ),
                                ),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                await actions.share(
                                  getJsonField(
                                    widget.data,
                                    r'''$.link''',
                                  ).toString(),
                                  'normal',
                                );
                              },
                              text: 'Compartilhar',
                              icon: Icon(
                                Icons.share_sharp,
                                color: Colors.white,
                                size: 22.0,
                              ),
                              options: FFButtonOptions(
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF12378F),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 25.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Sobre o Autor',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF666666),
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    getJsonField(
                                      widget.data,
                                      r'''$._embedded.author[0].name''',
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 20.0, 25.0),
                        child: Text(
                          getJsonField(
                            widget.data,
                            r'''$._embedded.author[0].description''',
                          ).toString(),
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF666666),
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Divider(
                        height: 1.0,
                        thickness: 1.0,
                        indent: 20.0,
                        endIndent: 20.0,
                        color: Color(0xFFC6C6C6),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 25.0, 20.0, 25.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Comentários',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: 25.0,
                                height: 25.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF666666),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    getJsonField(
                                              widget.data,
                                              r'''$._embedded.replies[0]''',
                                            ) !=
                                            null
                                        ? functions.getNReplies((getJsonField(
                                            widget.data,
                                            r'''$._embedded.replies[0]''',
                                            true,
                                          ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList()!)
                                        : '0',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 8.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (getJsonField(
                            widget.data,
                            r'''$._embedded.replies[0]''',
                          ) !=
                          null)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 25.0),
                          child: Builder(
                            builder: (context) {
                              final replies = getJsonField(
                                widget.data,
                                r'''$._embedded.replies[0]''',
                              ).toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: replies.length,
                                itemBuilder: (context, repliesIndex) {
                                  final repliesItem = replies[repliesIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 15.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                getJsonField(
                                                  repliesItem,
                                                  r'''$.author_name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            functions
                                                .formatComments(getJsonField(
                                              repliesItem,
                                              r'''$.content.rendered''',
                                            ).toString()),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF666666),
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                controller: _model.listViewController2,
                              );
                            },
                          ),
                        ),
                      Divider(
                        height: 1.0,
                        thickness: 1.0,
                        indent: 20.0,
                        endIndent: 20.0,
                        color: Color(0xFFC6C6C6),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 25.0, 20.0, 0.0),
                        child: Text(
                          'Deixe um comentário',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 20.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          child: Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.nomeController,
                                          focusNode: _model.nomeFocusNode,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Nome*',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFF666666),
                                                      fontSize: 10.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            hintText: 'John Doe',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFF666666),
                                                      fontSize: 10.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC6C6C6),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC6C6C6),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC6C6C6),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF666666),
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          validator: _model
                                              .nomeControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.emailController,
                                          focusNode: _model.emailFocusNode,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Email*',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFF666666),
                                                      fontSize: 10.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            hintText: 'johndoe@gmail.com',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFF666666),
                                                      fontSize: 10.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC6C6C6),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC6C6C6),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFC6C6C6),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF666666),
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: _model
                                              .emailControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: TextFormField(
                                      controller: _model.comentarioController,
                                      focusNode: _model.comentarioFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Comentário*',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF666666),
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        hintText:
                                            'Essas informações me ajudaram muito!',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF666666),
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFC6C6C6),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFC6C6C6),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFC6C6C6),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF666666),
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      maxLines: null,
                                      minLines: 5,
                                      validator: _model
                                          .comentarioControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 100.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      var _shouldSetState = false;
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      _model.postReplyResult =
                                          await PostReplyCall.call(
                                        email: _model.emailController.text,
                                        name: _model.nomeController.text,
                                        mensagem:
                                            _model.comentarioController.text,
                                        post: getJsonField(
                                          widget.data,
                                          r'''$.id''',
                                        ).toString(),
                                      );
                                      _shouldSetState = true;
                                      if ((_model.postReplyResult?.succeeded ??
                                          true)) {
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Comentário enviado com sucesso!',
                                              style: GoogleFonts.getFont(
                                                'Poppins',
                                                color: Colors.white,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0xFF12378F),
                                          ),
                                        );
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Erro ao enviar comentário!',
                                              style: GoogleFonts.getFont(
                                                'Poppins',
                                                color: Colors.white,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0xFFFF0000),
                                          ),
                                        );
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }

                                      if (_shouldSetState) setState(() {});
                                    },
                                    text: 'Publicar comentário',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF12378F),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
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
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 12.0, 20.0, 30.0),
                        child: Html(
                          data: functions.formatText(functions.divideText(
                              getJsonField(
                                widget.data,
                                r'''$.content.rendered''',
                              ).toString(),
                              1)),
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).accent4,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 30.0, 20.0, 25.0),
                        child: Html(
                          data: functions.formatText(functions.divideText(
                              getJsonField(
                                widget.data,
                                r'''$.content.rendered''',
                              ).toString(),
                              2)),
                        ),
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
