import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextDaystemperature extends StatefulWidget {
  final List<dynamic> temperature;
  final List<dynamic> day;
  const NextDaystemperature({super.key, required this.day, required this.temperature});

  @override
  State<NextDaystemperature> createState() => _NextDaystemperatureState();
}

class _NextDaystemperatureState extends State<NextDaystemperature> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("${widget.day}"),
        SizedBox( width: 20,),
        Icon(Icons.cloud_circle),
        Text("15 C"),
        SizedBox(width: 40,),
        Text("${widget.temperature} C"),
      ],
    );
  }
}
