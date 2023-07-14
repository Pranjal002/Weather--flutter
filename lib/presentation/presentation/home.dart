import 'package:flutter/material.dart';
import 'package:weatherstation/presentation/widgets/detailtemperature.dart';
import 'package:weatherstation/presentation/widgets/todays_temperature.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Your Name'),
              accountEmail: Text('your_email@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle drawer item tap
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle drawer item tap
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Weather Forecast'),
        backgroundColor: Colors.blue[50],
      ),
      body: Container(
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
              SizedBox(height: 25,),
               Today_Temperature(),
              SizedBox(
                height: 20,
              ),
              Detailed_temperature(),
              SizedBox(height: 200,)
            ],
          ),
        ),
      ),
    );
  }
}
