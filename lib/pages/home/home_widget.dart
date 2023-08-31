import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<WorkoutsRecord>>(
        stream: queryWorkoutsRecord(
          parent: currentUserReference,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: valueOrDefault<Color>(
                currentUserDocument?.colour,
                FlutterFlowTheme.of(context).primaryBackground,
              ),
              body: Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: SpinKitFoldingCube(
                    color: Color(0xFF00D3FF),
                    size: 50.0,
                  ),
                ),
              ),
            );
          }
          List<WorkoutsRecord> homeWorkoutsRecordList = snapshot.data!;
          return GestureDetector(
            onTap: () =>
                FocusScope.of(context).requestFocus(_model.unfocusNode),
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
                    'n80x0pjn' /* BALANCE. */,
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
              ),
              body: SafeArea(
                top: true,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: Image.asset(
                        'assets/images/Copy_of_Copy_of_Health_(3).png',
                      ).image,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF127300),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(10.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 4.0, 12.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'xuw9dcd1' /* Welcome. */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed('History');
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '2tzrzp82' /* Workout History */,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          100.0, 0.0, 100.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF00AEFF),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 10.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'tviu6xrv' /* Workouts This Week */,
                              ),
                              style:
                                  FlutterFlowTheme.of(context).headlineMedium,
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Container(
                            height: 230.0,
                            child: FlutterFlowBarChart(
                              barData: [
                                FFBarChartData(
                                  yData: functions.getFrequency(
                                      homeWorkoutsRecordList
                                          .map((e) => e.timestamp)
                                          .withoutNulls
                                          .toList()),
                                  color: Color(0xFF5EC5FF),
                                )
                              ],
                              xLabels: functions.getLabels(),
                              barWidth: 15.0,
                              barBorderRadius: BorderRadius.circular(8.0),
                              groupSpace: 20.0,
                              chartStylingInfo: ChartStylingInfo(
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                showGrid: true,
                                borderColor: Color(0xFF5EC5FF),
                                borderWidth: 1.0,
                              ),
                              axisBounds: AxisBounds(),
                              xAxisLabelInfo: AxisLabelInfo(
                                showLabels: true,
                                labelInterval: 10.0,
                              ),
                              yAxisLabelInfo: AxisLabelInfo(
                                showLabels: true,
                                labelInterval: 10.0,
                                labelFormatter: LabelFormatter(
                                  numberFormat: (val) => val.toString(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
