import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hourtemperature extends StatefulWidget {
  final time;
  final Temperature;
  const Hourtemperature({super.key,required this.Temperature, required this.time});

  @override
  State<Hourtemperature> createState() => _HourtemperatureState();
}

class _HourtemperatureState extends State<Hourtemperature> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 150,
      width: 68,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2.0
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("${widget.time}"),
          Icon(Icons.sunny),
          Text("${widget.Temperature}"),

        ],

      ),
    );
  }
}
