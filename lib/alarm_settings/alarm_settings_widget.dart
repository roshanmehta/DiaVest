import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../components/amenitity_indicator_widget.dart';
import '../edit_profile/edit_profile_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlarmSettingsWidget extends StatefulWidget {
  const AlarmSettingsWidget({Key? key}) : super(key: key);

  @override
  _AlarmSettingsWidgetState createState() => _AlarmSettingsWidgetState();
}

class _AlarmSettingsWidgetState extends State<AlarmSettingsWidget> {
  TextEditingController? textController1;
  bool? urgentLowGlucoseAlarm;
  bool? lowGlucoseAlarm;
  TextEditingController? textController2;
  bool? highGlucoseAlarm;
  TextEditingController? textController3;
  bool? signalLossAlarm;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF95A1AC),
            size: 24,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Alarm Settings',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'SET YOUR ALARMS',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.arrow_downward,
                                      color: Color(0xFFE00707),
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: urgentLowGlucoseAlarm ??= false,
                                onChanged: (newValue) =>
                                    setState(() => urgentLowGlucoseAlarm = newValue),
                                title: Text(
                                  'Urgent Low Glucose Alarm',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Urbanist',
                                        fontSize: 16,
                                      ),
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                activeTrackColor: Color(0xFF392BBA),
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.arrow_downward,
                                      color: Color(0xFFE00707),
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                                child: TextFormField(
                                  controller: textController1,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText:
                                        'Enter Urgent Low Threshold (mg/dL)',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Urbanist',
                                        color: FlutterFlowTheme.of(context)
                                            .dark600,
                                        fontSize: 16,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.arrow_downward,
                                      color: Color(0xFFEB7907),
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: lowGlucoseAlarm ??= false,
                                onChanged: (newValue) => setState(
                                    () => lowGlucoseAlarm = newValue),
                                title: Text(
                                  'Low Glucose Alarm',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Urbanist',
                                        fontSize: 16,
                                      ),
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                activeTrackColor: Color(0xFF392BBA),
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.arrow_downward,
                                      color: Color(0xFFEB7907),
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(18, 8, 0, 8),
                                child: TextFormField(
                                  controller: textController2,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Enter Low Threshold (mg/dL)',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Urbanist',
                                        color: FlutterFlowTheme.of(context)
                                            .dark600,
                                        fontSize: 16,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.arrow_upward,
                                      color: Color(0xFFE00707),
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: highGlucoseAlarm ??= false,
                                onChanged: (newValue) => setState(
                                    () => highGlucoseAlarm = newValue),
                                title: Text(
                                  'High Glucose Alarm',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Urbanist',
                                        fontSize: 16,
                                      ),
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                activeTrackColor: Color(0xFF392BBA),
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.arrow_upward,
                                      color: Color(0xFFE00707),
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                                child: TextFormField(
                                  controller: textController3,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText:
                                        'Enter High Glucose Threshold (mg/dL)',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Urbanist',
                                        color: FlutterFlowTheme.of(context)
                                            .dark600,
                                        fontSize: 16,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.signal_wifi_off,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: signalLossAlarm ??= false,
                                onChanged: (newValue) => setState(
                                    () => signalLossAlarm = newValue),
                                title: Text(
                                  'Signal Loss Alarm',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Urbanist',
                                        fontSize: 16,
                                      ),
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                activeTrackColor: Color(0xFF392BBA),
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          await FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid).update({
                            "alarmSettings" : {
                              "urgentLow" : urgentLowGlucoseAlarm! ? "0" : textController1!.text,
                              "low" : lowGlucoseAlarm! ? "0" : textController2!.text,
                              "high" : highGlucoseAlarm! ? "0" : textController3!.text,
                              "signalLoss" : signalLossAlarm
                            }
                          });
                          await Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileWidget(),
                            ),
                          );
                        },
                        text: 'Save Changes',
                        options: FFButtonOptions(
                          width: 120,
                          height: 50,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Urbanist',
                                    color: Colors.white,
                                  ),
                          elevation: 2,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
