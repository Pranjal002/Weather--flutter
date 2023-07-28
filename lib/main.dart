import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weatherstation/presentation/blocs/home/homeapi_bloc.dart';
import 'package:weatherstation/presentation/presentation/home.dart';
import 'package:weatherstation/presentation/provider/Tommorow_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeapiBloc(),
      child: ChangeNotifierProvider(
        create: (_) => tomorrowState(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Home(),
        ),
      ),
    );
  }
}
