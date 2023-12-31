import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'input_weight_model.dart';
export 'input_weight_model.dart';

class InputWeightWidget extends StatefulWidget {
  const InputWeightWidget({
    Key? key,
    this.parameter1,
  }) : super(key: key);

  final int? parameter1;

  @override
  _InputWeightWidgetState createState() => _InputWeightWidgetState();
}

class _InputWeightWidgetState extends State<InputWeightWidget> {
  late InputWeightModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputWeightModel());

    _model.textController ??=
        TextEditingController(text: widget.parameter1?.toString());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: TextFormField(
        controller: _model.textController,
        autofocus: true,
        obscureText: false,
        decoration: InputDecoration(
          labelText: FFLocalizations.of(context).getText(
            '6roygyi2' /* Weight */,
          ),
          labelStyle: FlutterFlowTheme.of(context).labelMedium,
          hintStyle: FlutterFlowTheme.of(context).labelMedium,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
