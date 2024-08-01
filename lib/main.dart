import 'package:app_flutter/ui/pages/Gallery.page.dart';
import 'package:app_flutter/ui/pages/counter.bloc.page.dart';
import 'package:app_flutter/ui/pages/counter.statteful.page.dart';
import 'package:app_flutter/ui/pages/home.page.dart';
import 'package:app_flutter/ui/pages/quiz.page.dart';
import 'package:app_flutter/ui/pages/weather.detail.dart';
import 'package:app_flutter/ui/pages/weather.from.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const RootView();
  }
}

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:  Colors.blue
      ),
      routes: {
        "/":(context)=>const HomePage(),
        "/counter1":(context)=>const CounterStatefulPage(),
        "/quiz":(context)=> Quiz(),
         "/weather":(context)=>const Weather(),
        "/Gallery" : (context)=>  Gallery()



      },
      initialRoute: "/",
    );
  }
}
