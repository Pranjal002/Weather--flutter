import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Today_Temperature extends StatefulWidget {
  const Today_Temperature({super.key});

  @override
  State<Today_Temperature> createState() => _Today_TemperatureState();
}

class _Today_TemperatureState extends State<Today_Temperature> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "Kathmandu",
                  style: TextStyle(fontSize: 34),
                  textAlign: TextAlign.center,
                ),
                // Text("Sat,3 Aug"),
              ],
            )
          ],
        ),
        Text(
          "28\u00B0",
          style: TextStyle(
            fontSize: 92,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "Partly Cloudly ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
        // SizedBox(
        //   height: 2,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("H:32\u00B0"),
            SizedBox(
              width: 20,
            ),
            Text('L:19 \u00B0'),
          ],
        ),

      ],
    ));
  }
}
