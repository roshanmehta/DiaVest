import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AmenitityIndicatorWidget extends StatefulWidget {
  const AmenitityIndicatorWidget({
    Key? key,
    this.icon,
    this.background,
    this.borderColor,
  }) : super(key: key);

  final Widget? icon;
  final Color? background;
  final Color? borderColor;

  @override
  _AmenitityIndicatorWidgetState createState() =>
      _AmenitityIndicatorWidgetState();
}

class _AmenitityIndicatorWidgetState extends State<AmenitityIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: widget.background,
          shape: BoxShape.circle,
          border: Border.all(
            color: widget.borderColor!,
            width: 2,
          ),
        ),
        alignment: AlignmentDirectional(0, 0),
        child: widget.icon!,
      ),
    );
  }
}
