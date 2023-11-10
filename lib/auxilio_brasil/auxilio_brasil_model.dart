import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'auxilio_brasil_widget.dart' show AuxilioBrasilWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuxilioBrasilModel extends FlutterFlowModel<AuxilioBrasilWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Column widget.
  ScrollController? columnController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
