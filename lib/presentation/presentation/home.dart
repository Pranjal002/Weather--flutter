import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherstation/Domain/Model/weather_data_model.dart';
import 'package:weatherstation/Domain/Model/weather_response_model.dart';
import 'package:weatherstation/presentation/widgets/detailtemperature.dart';
import 'package:weatherstation/presentation/widgets/today_rain_pressure_humidity.dart';
import 'package:weatherstation/presentation/widgets/todays_temperature.dart';

import '../blocs/home/homeapi_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       UserAccountsDrawerHeader(
      //         accountName: Text('Your Name'),
      //         accountEmail: Text('your_email@example.com'),
      //         currentAccountPicture: CircleAvatar(
      //           backgroundImage: AssetImage('assets/images/profile.jpeg'),
      //         ),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.home),
      //         title: Text('Home'),
      //         onTap: () {
      //           // Handle drawer item tap
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.settings),
      //         title: Text('Settings'),
      //         onTap: () {
      //           // Handle drawer item tap
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      // appBar: AppBar(
      //   title: Text('Weather Forecast'),
      //   backgroundColor: Colors.blue[50],
      // ),
      body: BlocConsumer<HomeapiBloc, HomeapiState>(
        bloc: BlocProvider.of(context)..add(HomeFetchEvent()),
        listener: (context, state) {
          if (state is HomeapiFailedState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }

          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is HomeapiLoadingState) {
            return _buildLoading();
          } else if (state is HomeapiLoadedState) {
            List<WeatherData> items = state.weatherModel;
            return SafeArea(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover,
                )),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Today_Temperature(),
                      SizedBox(height: 31,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color:Colors.transparent.withOpacity(0.12),
                                    spreadRadius: 2,
                                    offset: Offset(0,3),
                                    blurRadius: 5,
                                  )

                                ]
                              ),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Text('Cloudy conditions from 1 AM - 9AM, with showers expected at 9AM',style: TextStyle(fontSize: 16),),
                                    SizedBox(height: 15,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Divider(color: Colors.grey,height: 2,),
                                    ),
                                    SizedBox(height: 15,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        for(int i=0; i<5;i++)

                                          Column(
                                          children: [
                                              Text('Now', style: TextStyle(
                                                  fontSize: 17),),
                                              SizedBox(height: 24,),
                                              Icon(Icons.cloud_sharp),
                                              SizedBox(height: 24,),
                                              Text("21\u00B0", style: TextStyle(
                                                  fontSize: 22),),

                                          ],
                                        )
                                      ],
                                    ),



                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                            child: Container(

                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.transparent.withOpacity(0.12),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                              ),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    Text('10-DAY FORECAST',style: TextStyle(fontSize: 16),),
                                    SizedBox(height: 15,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Divider(color: Colors.grey,height: 2,),
                                    ),
                                    SizedBox(height: 15,),

                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        for(int i=0; i<5;i++)
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text('Today',style: TextStyle(fontSize: 22),),
                                                  SizedBox(width: 14,),
                                                  Column(
                                                    children: [
                                                      Icon(Icons.cloud_sharp),
                                                      Text('60%'),
                                                    ],
                                                  ),
                                                  SizedBox(width: 30,),

                                                  Opacity(
                                                    opacity: 0.30,
                                                      child: Text('15\u00B0',style: TextStyle(fontSize: 22),)),

                                                  Text('29\u00B0',style: TextStyle(fontSize: 22),),

                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 8),
                                                child: Divider(color: Colors.black, height: 2,

                                                ),
                                              )

                                            ],
                                          ),

                                      ],
                                    ),



                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Column(
                        children: [
                          Row(
                            children: [
                              TodayRainPressureHumidity(),
                              TodayRainPressureHumidity(),

                            ],
                          ),
                          Row(
                            children: [
                              TodayRainPressureHumidity(),
                              TodayRainPressureHumidity(),

                            ],
                          ),
                        ],
                      ),



                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Detailed_temperature(),

                      SizedBox(
                        height: 200,
                      ),
                      Container(
                        width: 450,
                        height: 300,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black26,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              )
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Text("lorem"),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.wind_power_outlined,
                                      size: 90,
                                    ),
                                    Text('wind'),
                                    Text('${items[1].windspeedmph}')
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.sunny,
                                      size: 90,
                                    ),
                                    Text("UV index"),
                                    Text("low")
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.water_drop,
                                      size: 90,
                                    ),
                                    Text("Humidity"),
                                    Text("50%")
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else if (state is HomeapiFailedState) {
            return _buildError(state.message);
          } else {
            return Center(
              child: Text('Unexpected States'),
            );
          }
        },
      ),
    );
  }
}

Widget _buildLoading() {
  return Center(child: CircularProgressIndicator());
}

Widget _buildError(String message) {
  return Center(
    child: Text(message + 'Build Error'),
  );
}
