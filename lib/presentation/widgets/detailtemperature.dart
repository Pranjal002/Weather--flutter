import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherstation/presentation/presentation/future_temperature.dart';
import 'package:weatherstation/presentation/provider/Tommorow_state.dart';
import 'package:weatherstation/presentation/widgets/Hour_temperature.dart';
import 'package:weatherstation/presentation/widgets/LineChartWidget.dart';

import '../../Data/Remote/weather_data.dart';

class Detailed_temperature extends StatefulWidget {
  const Detailed_temperature({Key? key}) : super(key: key);

  @override
  _Detailed_temperatureState createState() => _Detailed_temperatureState();
}

class _Detailed_temperatureState extends State<Detailed_temperature> {
  // Track whether to show the next day's values

  _performFunction() {
    // setState(() {
    //   showNextDay = !showNextDay; // Toggle the showNextDay value
    // });
  }

  @override
  Widget build(BuildContext context) {
    final tomorrow = Provider.of<tomorrowState>(context);
    bool showNextDay = false;
    String _formatTime(int hour, int minute) {
      String hourString = hour.toString().padLeft(2, '0');
      String minuteString = minute.toString().padLeft(2, '0');
      String period = hour < 12 ? "AM" : "PM";

      return "$hourString:$minuteString $period";
    }

    return FutureBuilder<weatherapi>(
      future: getapi(),
      builder: (BuildContext context, AsyncSnapshot<weatherapi> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('sudip: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final weatherapi data = snapshot.data!;
          final List<String>? timeList = data.hourly?.time;
          final List<double>? temperatureList = data.hourly?.temperature2m;
          final int itemCount = (timeList?.length ?? 0);
          List<dynamic> day1Hours = [];
          List<dynamic> day1Temperature = [];
          List<dynamic> day2Hours = [];
          List<dynamic> day2Temperature = [];

          // Parse the time and temperature data for two days
          for (int i = 0; i < itemCount; i++) {
            String time = timeList?[i] ?? '';
            DateTime dateTime = DateTime.parse(time);
            String formattedString =
                _formatTime(dateTime.hour, dateTime.minute);

            if (i < 24) {
              day1Hours.add(formattedString);
              day1Temperature.add(temperatureList?[i] ?? 0);
            } else {
              day2Hours.add(formattedString);
              day2Temperature.add(temperatureList?[i] ?? 0);
            }
          }

          List<DataPoint> chartData1 = [];
          List<DataPoint> chartData2 = [];

          // Populate the chart data for two days
          for (int i = 0; i < 24; i++) {
            chartData1
                .add(DataPoint(x: day1Hours[i], y: day1Temperature[i] ?? 0));
            chartData2
                .add(DataPoint(x: day2Hours[i], y: day2Temperature[i] ?? 0));
          }
          //-----------------

          // Display the fetched data in your UI
          return Container(
            child: Column(
              children: [
                Consumer(builder: (context, tomorrowState, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () => tomorrow.onToday(),
                        child: Text(
                          'Today',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      InkWell(
                        onTap: () => tomorrow.onClick(),
                        child: Text(
                          'Tomorrow',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Future_Temperature(
                                  dayList: day1Hours,
                                  tempList: day1Temperature),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              'Next 7 days',
                              style: TextStyle(fontSize: 15),
                            ),
                            Icon(Icons.arrow_right),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 0; i < 24; i++)
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Hourtemperature(
                            Temperature: showNextDay
                                ? day2Temperature[i] ?? 0
                                : day1Temperature[i] ?? 0,
                            time: showNextDay
                                ? day2Hours[i] ?? ''
                                : day1Hours[i] ?? '',
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 400,
                  child: LineChartWidget(
                    dataPoints1: chartData1,
                    dataPoints2: chartData2,
                  ),
                ),
                // Column(
                //   children: [
                //     for (int i = 0; i < 24; i++) Text('${day2Hours[i]}'),
                //   ],
                // ),
              ],
            ),
          );
        } else {
          return Text('No data available');
        }
      },
    );
  }
}
