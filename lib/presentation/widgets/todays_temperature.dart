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
            Icon(Icons.sunny),
            Column(
              children: [
                Text("Today" ,style:TextStyle(fontSize: 28),),
                Text("Sat,3 Aug"),
              ],
            )
          ],
        ),
        Text(
          "28",
          style: TextStyle(
            fontSize: 100,
          ),
        ),
        Text("Barcelona, Spain"),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Feels like 32"),
            SizedBox(
              width: 20,
            ),
            Text('Sunset at 20:15'),


          ],
        ),
        SizedBox(height: 30,)
      ],
    ));
  }
}
