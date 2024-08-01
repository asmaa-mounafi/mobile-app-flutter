import 'package:flutter/material.dart';

import '../widget/main.drawer.widget.dart';

class CounterStatefulPage extends StatefulWidget {

  const CounterStatefulPage({super.key });

  @override
  State<CounterStatefulPage> createState() => _CounterStatefulPageState();
}

class _CounterStatefulPageState extends State<CounterStatefulPage> {
  int counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("Counter Stateful"),
         backgroundColor: Colors.blue,
    ),
      body:  Center(child:  Text("Counter Value => $counter",style: const TextStyle(height: 5, fontSize: 25)),),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(

            onPressed: (){
              setState(() {
                --counter;

              });
          },
          child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(onPressed: (){
            setState(() {
              ++counter;
            });
          },
            child: const Icon(Icons.add),
          ),

        ],
      ),
    );
  }
}
