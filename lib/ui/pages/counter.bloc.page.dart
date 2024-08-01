import 'package:flutter/material.dart';

import '../widget/main.drawer.widget.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("Counter Bloc"),
         backgroundColor: Colors.blue,
    ),
      body: const Center(child:  Text("Counter Bloc" ),),
    );
  }
}
