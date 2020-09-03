import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget {
  final Color color;

  const CircularLoader({
    Key key,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.transparent,
      valueColor: AlwaysStoppedAnimation<Color>(color),
    );
  }
}

class LinearLoader extends StatelessWidget {
  final double value;
  final Color color;

  const LinearLoader({
    Key key,
    this.value,
    this.color = Colors.yellow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: Colors.black12,
      valueColor: AlwaysStoppedAnimation<Color>(color),
      value: value,
    );
  }
}
