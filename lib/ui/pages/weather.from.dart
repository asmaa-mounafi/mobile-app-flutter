import 'package:app_flutter/ui/pages/weather.detail.dart';
import 'package:flutter/material.dart';
import './weather.detail.dart';


class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String city="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(city),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(hintText: 'Taper une ville'),
                  onChanged: (value){
                    setState(() {
                      this.city=value;
                    });
                  },

                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherDetails(city)));
                  },
                  child: Text('Get Whather ..',style: TextStyle(fontSize: 22),),


                ),
              ),
            )
          ],
        )
    );
  }
}
