import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class TodayIndoorOutdoorUv extends StatelessWidget {
  const TodayIndoorOutdoorUv({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 162,
      height: 162,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.transparent.withOpacity(0.12),
              offset: Offset(0,3),
              spreadRadius: 2,
              blurRadius: 5,

            ),
          ]

      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.water_drop),
              Opacity(
                  opacity: 0.3,
                  child: Text('HUMIDITY',style: TextStyle(fontSize: 14,letterSpacing: 1,),))
            ],
          ),
          Text('73%',style: TextStyle(fontSize: 34,fontWeight: FontWeight.w400),),
          SizedBox(height: 30,),
          Container(
            width: 86,
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 85,
                height: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow)
                    ],
                  ),
                )
              ],
            ),
          )
          

        ],
      ),

    );
  }
}
