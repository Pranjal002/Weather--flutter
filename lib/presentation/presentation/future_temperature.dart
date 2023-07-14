import 'package:flutter/material.dart';
import 'package:weatherstation/presentation/widgets/Next_day_temperature.dart';

class Future_Temperature extends StatefulWidget {
  final List<dynamic> dayList;
  final List<dynamic> tempList;

  const Future_Temperature({required this.dayList,required this.tempList});

  @override
  State<Future_Temperature> createState() => _Future_TemperatureState();
}

class _Future_TemperatureState extends State<Future_Temperature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
        backgroundColor: Colors.blue[50],

      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/images/future.jpg',
          ),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.only(left :20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text("Next 7 days",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Card(
                color: Colors.white,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: 350,
                  height: 180,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                    ],

                  ),
                ),
              ),
              SizedBox(height: 40,),
              for(int i=0;i<4;i++)
                NextDaystemperature(day: widget.dayList[i], temperature: widget.tempList[i]),





              // NextDaystemperature(),
              // SizedBox(height: 40,),
              //
              // NextDaystemperature(),
              // SizedBox(height: 40,),
              //
              // NextDaystemperature(),
              // SizedBox(height: 40,),
              //
              // NextDaystemperature(),
              // SizedBox(height: 40,),
              //
              // NextDaystemperature(),





            ],
          ),
        ),
      ),
    );
  }
}
