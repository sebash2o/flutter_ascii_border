library asciiborder;

import 'dart:ui';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _AsciiBoxPainter extends CustomPainter {
  final double fontSize;
  final Color color;
  String fontFamily;
  String topLeftCorner;
  String topRightCorner;
  String bottomLeftCorner;
  String bottomRightCorner;
  String horizontalBar;
  String verticalBar;

  _AsciiBoxPainter({
    this.fontSize = 20.0,
    this.color = Colors.white,
    this.fontFamily = "Monospace",
    this.topLeftCorner = "+",
    this.topRightCorner = "+",
    this.bottomLeftCorner = "+",
    this.bottomRightCorner = "+",
    this.horizontalBar = "-",
    this.verticalBar = "|",
  });

  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: fontFamily,
    );

    final double adjust = fontSize / 2;

    // top left corner
    final topLeftCornerPainter = TextPainter(
      text: TextSpan(
        text: topLeftCorner,
        style: textStyle,
      ),
      textDirection: TextDirection.ltr,
    );
    final offsetTL = Offset(adjust, adjust);
    topLeftCornerPainter.layout(
      minWidth: 0,
      maxWidth: 0,
    );
    topLeftCornerPainter.paint(canvas, offsetTL);

    // top right corner
    final topRightCornerPainter = TextPainter(
      text: TextSpan(
        text: topRightCorner,
        style: textStyle,
      ),
      textDirection: TextDirection.ltr,
    );
    final offsetTR = Offset(size.width, adjust);
    topRightCornerPainter.layout(
      minWidth: 0,
      maxWidth: 0,
    );
    topRightCornerPainter.paint(canvas, offsetTR);

    // bottom left corner
    final bottomLeftCornerPainter = TextPainter(
      text: TextSpan(
        text: bottomLeftCorner,
        style: textStyle,
      ),
      textDirection: TextDirection.ltr,
    );
    final offsetBL = Offset(adjust, size.height);
    bottomLeftCornerPainter.layout(
      minWidth: 0,
      maxWidth: 0,
    );
    bottomLeftCornerPainter.paint(canvas, offsetBL);

    // bottom right corner
    final bottomRightCornerPainter = TextPainter(
      text: TextSpan(
        text: bottomRightCorner,
        style: textStyle,
      ),
      textDirection: TextDirection.ltr,
    );
    final offsetBR = Offset(size.width, size.height);
    bottomRightCornerPainter.layout(
      minWidth: 0,
      maxWidth: 0,
    );
    bottomRightCornerPainter.paint(canvas, offsetBR);

    // Horizontal line
    final textSpanDash = TextSpan(
      text: horizontalBar,
      style: textStyle,
    );
    final horizontalBarPainter = TextPainter(
      text: textSpanDash,
      textDirection: TextDirection.ltr,
    );
    horizontalBarPainter.layout(
      minWidth: 0,
      maxWidth: 0,
    );
    for (double step = fontSize + adjust;
        step <= size.width - adjust;
        step += fontSize) {
      var topOffset = Offset(step, adjust);
      horizontalBarPainter.paint(canvas, topOffset);

      var bottomOffset = Offset(step, size.height);
      horizontalBarPainter.paint(canvas, bottomOffset);
    }

    // Vertical line
    final textSpanBar = TextSpan(
      text: verticalBar,
      style: textStyle,
    );
    final verticalBarPainter = TextPainter(
      text: textSpanBar,
      textDirection: TextDirection.ltr,
    );
    verticalBarPainter.layout(
      minWidth: 0,
      maxWidth: 0,
    );

    for (double step = fontSize + adjust;
        step <= size.height - fontSize;
        step += fontSize) {
      var leftOffset = Offset(adjust, step);
      verticalBarPainter.paint(canvas, leftOffset);

      var rightOffset = Offset(size.width, step);
      verticalBarPainter.paint(canvas, rightOffset);
    }
  }

  @override
  bool shouldRepaint(CustomPainter old) => true;
}

class AsciiBox extends StatelessWidget {
  final Widget child;
  final double strokeWidth;
  final EdgeInsets padding;
  final Color color;

  String fontFamily;
  String topLeftCorner;
  String topRightCorner;
  String bottomLeftCorner;
  String bottomRightCorner;
  String horizontalBar;
  String verticalBar;

  AsciiBox({
    @required this.child,
    this.strokeWidth = 20.0,
    this.padding = const EdgeInsets.all(0),
    this.color = Colors.white,
    this.fontFamily = "Monospace",
    this.topLeftCorner = "+",
    this.topRightCorner = "+",
    this.bottomLeftCorner = "+",
    this.bottomRightCorner = "+",
    this.horizontalBar = "-",
    this.verticalBar = "|",
  }) {
    assert(child != null);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: CustomPaint(
            painter: _AsciiBoxPainter(
              fontSize: strokeWidth,
              color: color,
              topLeftCorner: topLeftCorner,
              topRightCorner: topRightCorner,
              bottomLeftCorner: bottomLeftCorner,
              bottomRightCorner: bottomRightCorner,
              horizontalBar: horizontalBar,
              verticalBar: verticalBar,
            ),
          ),
        ),
        Padding(
          padding: padding,
          child: child,
        ),
      ],
    );
  }
}

class _AsciiCirclePainter extends CustomPainter {
  final int fontSize;
  final Color color;
  String fontFamily;
  String char;

  _AsciiCirclePainter({
    this.fontSize = 20,
    this.color = Colors.white,
    this.fontFamily = "Monospace",
    this.char = "`",
  });

  @override
  void paint(Canvas canvas, Size size) {
    final int adjust = fontSize ~/ 2;

    final textStyle = TextStyle(
      color: color,
      fontSize: fontSize * 1.0,
      fontFamily: fontFamily,
    );

    final circumferencePainter = TextPainter(
      text: TextSpan(
        text: char,
        style: textStyle,
      ),
      textDirection: TextDirection.ltr,
    );
    circumferencePainter.layout(minWidth: 0, maxWidth: 0,);

    int oX = (size.width - adjust) ~/ 2;
    int oY = (size.height - adjust) ~/ 2;
    int r = oX;

    for (var angle = 0; angle <= 360; angle += fontSize ~/2 ) {
      double x = oX + cos(angle) * r;
      double y = oY + sin(angle) * r;
      var offset = Offset(x, y);
      circumferencePainter.paint(canvas, offset);
    }
  }

  @override
  bool shouldRepaint(CustomPainter old) => true;
}

class AsciiCircle extends StatelessWidget {
  final Widget child;
  final int strokeWidth;
  final EdgeInsets padding;
  final Color color;
  final double radius;
  String fontFamily;
  String char;

  AsciiCircle({
    @required this.child,
    this.strokeWidth = 20,
    this.padding = const EdgeInsets.all(0),
    this.color = Colors.white,
    this.radius = 20.0,
    this.char = "`",
    this.fontFamily = "Monospace",
  }) {
    assert(child != null);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: CustomPaint(
            painter: _AsciiCirclePainter(
              fontSize: strokeWidth,
              color: color,
              char: char,
            ),
          ),
        ),
        Padding(
          padding: padding,
          child: child,
        ),
      ],
    );
  }
}