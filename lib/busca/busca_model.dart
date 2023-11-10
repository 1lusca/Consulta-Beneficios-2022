import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'busca_widget.dart' show BuscaWidget;
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

class BuscaModel extends FlutterFlowModel<BuscaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getPosts)] action in busca widget.
  ApiCallResponse? getPostsSearchResult3;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (getPosts)] action in TextField widget.
  ApiCallResponse? getPostsSearchResult1;
  // Stores action output result for [Backend Call - API (getPosts)] action in Button widget.
  ApiCallResponse? getSearchPostsResult2;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Stores action output result for [Backend Call - API (getPosts)] action in Button widget.
  ApiCallResponse? getPostsSearchPrevResult;
  // Stores action output result for [Backend Call - API (getPosts)] action in Button widget.
  ApiCallResponse? getPostsSearchNextResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController = ScrollController();
  }

  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
