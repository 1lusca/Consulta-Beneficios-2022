import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_widget.dart' show HomeWidget;
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

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getCategories)] action in home widget.
  ApiCallResponse? getCategoriesResult;
  // Stores action output result for [Backend Call - API (getPosts)] action in home widget.
  ApiCallResponse? getPostsResult;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Row widget.
  ScrollController? rowController1;
  // State field(s) for Row widget.
  ScrollController? rowController2;
  // Stores action output result for [Backend Call - API (getPosts)] action in Button widget.
  ApiCallResponse? getPostsResult2;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Stores action output result for [Backend Call - API (getPosts)] action in Button widget.
  ApiCallResponse? getPostsPrevResult;
  // Stores action output result for [Backend Call - API (getPosts)] action in Button widget.
  ApiCallResponse? getPostsNextResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController = ScrollController();
    rowController1 = ScrollController();
    rowController2 = ScrollController();
    listViewController = ScrollController();
  }

  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
    rowController1?.dispose();
    rowController2?.dispose();
    listViewController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
