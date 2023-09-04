import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/exercises_comp_widget.dart';
import '/components/input_reps_widget.dart';
import '/components/input_weight_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StartWorkoutCompModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for inputWorkoutName widget.
  TextEditingController? inputWorkoutNameController;
  String? Function(BuildContext, String?)? inputWorkoutNameControllerValidator;
  String? _inputWorkoutNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uely6csh' /* Please Enter Workout Name */,
      );
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 12) {
      return FFLocalizations.of(context).getText(
        'j1y8e9m4' /* Workout Name Too Long (1-12 Ch... */,
      );
    }

    return null;
  }

  // State field(s) for Timer widget.
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  StopWatchTimer timerController = StopWatchTimer(mode: StopWatchMode.countUp);

  // Models for inputWeight dynamic component.
  late FlutterFlowDynamicModels<InputWeightModel> inputWeightModels;
  // Models for inputReps dynamic component.
  late FlutterFlowDynamicModels<InputRepsModel> inputRepsModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    inputWorkoutNameControllerValidator = _inputWorkoutNameControllerValidator;
    inputWeightModels = FlutterFlowDynamicModels(() => InputWeightModel());
    inputRepsModels = FlutterFlowDynamicModels(() => InputRepsModel());
  }

  void dispose() {
    inputWorkoutNameController?.dispose();
    timerController.dispose();
    inputWeightModels.dispose();
    inputRepsModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
