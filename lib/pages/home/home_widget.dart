import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
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
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              '2tzrzp82' /* Workout History */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  100.0, 0.0, 100.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF00AEFF),
                              textStyle:
                                  FlutterFlowTheme.of(context).titleMedium,
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'tviu6xrv' /* Weight */,
                      ),
                      style: FlutterFlowTheme.of(context).headlineMedium,
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            final _datePickedDate = await showDatePicker(
                              context: context,
                              initialDate: getCurrentTimestamp,
                              firstDate: getCurrentTimestamp,
                              lastDate: DateTime(2050),
                            );

                            if (_datePickedDate != null) {
                              setState(() {
                                _model.datePicked = DateTime(
                                  _datePickedDate.year,
                                  _datePickedDate.month,
                                  _datePickedDate.day,
                                );
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: FutureBuilder<List<WeightRecord>>(
                  future: queryWeightRecordOnce(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<WeightRecord> chartWeightRecordList = snapshot.data!;
                    return Container(
                      width: 350.0,
                      height: 200.0,
                      child: FlutterFlowLineChart(
                        data: [
                          FFLineChartData(
                            xData: chartWeightRecordList
                                .map((d) => d.weight)
                                .toList(),
                            yData: chartWeightRecordList
                                .map((d) => d.date)
                                .toList(),
                            settings: LineChartBarData(
                              color: Color(0xFFFF6E00),
                              barWidth: 2.0,
                              isCurved: true,
                              dotData: FlDotData(show: false),
                              belowBarData: BarAreaData(
                                show: true,
                                color: Color(0xFFEF9439),
                              ),
                            ),
                          )
                        ],
                        chartStylingInfo: ChartStylingInfo(
                          backgroundColor: Color(0x00FFFFFF),
                          showGrid: true,
                          borderColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          borderWidth: 1.0,
                        ),
                        axisBounds: AxisBounds(),
                        xAxisLabelInfo: AxisLabelInfo(
                          title: FFLocalizations.of(context).getText(
                            '1s85p23h' /* Day */,
                          ),
                          titleTextStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          showLabels: true,
                          labelInterval: 1.0,
                        ),
                        yAxisLabelInfo: AxisLabelInfo(
                          title: FFLocalizations.of(context).getText(
                            '60icw63v' /* Weight */,
                          ),
                          titleTextStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          showLabels: true,
                          labelTextStyle: TextStyle(),
                          labelInterval: 10.0,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
