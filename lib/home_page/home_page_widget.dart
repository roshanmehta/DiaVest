import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dia_vest/index.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Widget> measurementCards = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder (
      future: FirebaseFirestore.instance.collection('users').doc(_auth.currentUser!.uid).get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if(!snapshot.hasData || snapshot.data!.data().toString() == "{}") {
          return CircularProgressIndicator(color: FlutterFlowTheme.of(context).primaryColor);
        } else {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;

          for(int i=0; i<data['glucoseVals'].length;i++) {
            String glucose = data["glucoseVals"].keys.toList()[i];
            Map<String, dynamic> info = data['glucoseVals'][glucose];
            measurementCards.add(_buildCard(glucose, info));
          }
        }

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 175,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).dark600,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: Color(0x39000000),
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 40, 0, 0),
                        child: Image.asset(
                          'assets/images/DiaVest_logo_dark',
                          width: 160,
                          height: 50,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome!',
                              style: FlutterFlowTheme.of(context).title1.override(
                                    fontFamily: 'Urbanist',
                                    color:
                                        FlutterFlowTheme.of(context).tertiaryColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Monitor you blood gucose in minutes!',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: FlutterFlowTheme.of(context).grayIcon,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: measurementCards,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCard(String glucose, Map<String, dynamic> data) {

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x32000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding:
              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      glucose,
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
              EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      data['Time'],
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(),
              child: Padding(
                padding:
                EdgeInsetsDirectional.fromSTEB(16, 0, 24, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      measurementIcon(data)[0],
                      color: measurementIcon(data)[1],
                      size: 24,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          4, 0, 0, 0),
                      child: Text(
                        data['range'],
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          80, 0, 0, 0),
                      child: InkWell (
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginWidget(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                          size: 24,
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<int, dynamic> measurementIcon(Map<String, dynamic> data) {
    switch (data['range']) {
      case "Glucose in range":
        return {0: Icons.check_circle, 1: Color(0xFF1ABF03)};
      case "Glucose High":
        return {0: Icons.arrow_upward, 1: Color(0xFFE00707)};
      case "Glucose Low":
        return {0: Icons.arrow_downward, 1: Color(0xFFEB7907)};
    }
    return {0: Icons.check_circle, 1: Color(0xFF1ABF03)};
  }
}