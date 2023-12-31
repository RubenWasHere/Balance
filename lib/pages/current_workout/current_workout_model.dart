import '/auth/firebase_auth/auth_util.dart';
import '/components/start_workout_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CurrentWorkoutModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for startWorkoutComp component.
  late StartWorkoutCompModel startWorkoutCompModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    startWorkoutCompModel = createModel(context, () => StartWorkoutCompModel());
  }

  void dispose() {
    unfocusNode.dispose();
    startWorkoutCompModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
