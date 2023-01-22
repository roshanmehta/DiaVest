import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlarmsWidget extends StatefulWidget {
  const AlarmsWidget({Key? key}) : super(key: key);

  @override
  _AlarmsWidgetState createState() => _AlarmsWidgetState();
}

class _AlarmsWidgetState extends State<AlarmsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  List<Widget> alarmCards = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid).get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if(!snapshot.hasData || snapshot.data!.data().toString() == "{}") {
          return CircularProgressIndicator(color: FlutterFlowTheme.of(context).primaryColor);
        } else {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;

          for(int i=0; i<data['alarms'].length;i++) {
            Map<String, dynamic> info = data['glucoseVals'][i];
            alarmCards.add(_buildAlarm(info));
          }
        }
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).dark600,
            automaticallyImplyLeading: false,
            title: Text(
              'Alarms',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Urbanist',
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: alarmCards,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAlarm(Map<String, dynamic> data) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
      child: Material(
        color: Colors.transparent,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: 100,
          height: 75,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(8),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  data['icon'],
                  color: Color(0xFFE00707),
                  size: 36,
                ),
                Expanded(
                  child: Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 8, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data["alarmType"],
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                  fontFamily: 'Urbanist',
                                  color:
                                  FlutterFlowTheme.of(context)
                                      .dark600,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                data['time'],
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 4, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                data['text'],
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
