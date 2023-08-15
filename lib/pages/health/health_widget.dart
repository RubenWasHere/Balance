import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'health_model.dart';
export 'health_model.dart';

class HealthWidget extends StatefulWidget {
  const HealthWidget({Key? key}) : super(key: key);

  @override
  _HealthWidgetState createState() => _HealthWidgetState();
}

class _HealthWidgetState extends State<HealthWidget> {
  late HealthModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HealthModel());
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
          appBar: AppBar(
            backgroundColor: Color(0xFF127300),
            automaticallyImplyLeading: false,
            title: Text(
              FFLocalizations.of(context).getText(
                's8r3i5uq' /* BALANCE. */,
              ),
              style: FlutterFlowTheme.of(context).displayMedium.override(
                    fontFamily: 'Outfit',
                    color: Color(0xFFF8F1F1),
                  ),
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Color(0x004B39EF),
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 80.0,
                fillColor: Color(0x004B39EF),
                icon: Icon(
                  Icons.settings,
                  color: Color(0xFFF8F1F1),
                  size: 40.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    'Settings',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.bottomToTop,
                        duration: Duration(milliseconds: 200),
                      ),
                    },
                  );
                },
              ),
            ],
            centerTitle: false,
            elevation: 2.0,
          ),
        ),
      ),
    );
  }
}
