import '/auth/firebase_auth/auth_util.dart';
import '/components/start_workout_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'current_workout_model.dart';
export 'current_workout_model.dart';

class CurrentWorkoutWidget extends StatefulWidget {
  const CurrentWorkoutWidget({Key? key}) : super(key: key);

  @override
  _CurrentWorkoutWidgetState createState() => _CurrentWorkoutWidgetState();
}

class _CurrentWorkoutWidgetState extends State<CurrentWorkoutWidget> {
  late CurrentWorkoutModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CurrentWorkoutModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: valueOrDefault<Color>(
            currentUserDocument?.colour,
            FlutterFlowTheme.of(context).primaryBackground,
          ),
          body: SafeArea(
            top: true,
            child: wrapWithModel(
              model: _model.startWorkoutCompModel,
              updateCallback: () => setState(() {}),
              child: StartWorkoutCompWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
