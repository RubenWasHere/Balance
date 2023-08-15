import '/auth/firebase_auth/auth_util.dart';
import '/components/exercises_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExercisesModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for exercisesComp component.
  late ExercisesCompModel exercisesCompModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    exercisesCompModel = createModel(context, () => ExercisesCompModel());
  }

  void dispose() {
    unfocusNode.dispose();
    exercisesCompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
