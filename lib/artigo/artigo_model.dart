import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'artigo_widget.dart' show ArtigoWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ArtigoModel extends FlutterFlowModel<ArtigoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // Stores action output result for [Backend Call - API (getPost)] action in Text widget.
  ApiCallResponse? getPostResult;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeController;
  String? Function(BuildContext, String?)? nomeControllerValidator;
  String? _nomeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 1) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Email inválido';
    }
    return null;
  }

  // State field(s) for comentario widget.
  FocusNode? comentarioFocusNode;
  TextEditingController? comentarioController;
  String? Function(BuildContext, String?)? comentarioControllerValidator;
  String? _comentarioControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 1) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (postReply)] action in Button widget.
  ApiCallResponse? postReplyResult;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
    nomeControllerValidator = _nomeControllerValidator;
    emailControllerValidator = _emailControllerValidator;
    comentarioControllerValidator = _comentarioControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
    listViewController1?.dispose();
    listViewController2?.dispose();
    nomeFocusNode?.dispose();
    nomeController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    comentarioFocusNode?.dispose();
    comentarioController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
