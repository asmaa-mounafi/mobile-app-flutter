import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';
class WeatherDetails extends StatefulWidget {
  String city="";
   WeatherDetails(this.city);

  @override
  State<WeatherDetails> createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  var weatherData;
  @override
  void initState() {
    super.initState();
    getData(widget.city);
  }

Future<void> getData(String city) async {
  print("Getting weather of " + city);
  String url = "https://api.openweathermap.org/data/2.5/forecast?q=${city}&appid=a26af3b9fb9e03632673a589f09ec696";
  var uri = Uri.parse(url);

  try {
    final response = await http.get(uri);
    setState(() {
      this.weatherData = json.decode(response.body);
      print(this.weatherData);
    });
  } catch (err) {
    print(err);
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wheather of city ${widget.city}'),backgroundColor: Colors.blue,),
      body:  (weatherData==null)? const Center(child: CircularProgressIndicator(),):ListView.builder(
        itemCount: (weatherData==null || weatherData['list']==null)?0:weatherData['list'].length,
        itemBuilder: (context,index){
          return Card(
            color: Colors.amberAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
               Row(
                 children:  <Widget>[
                   CircleAvatar(
                     backgroundImage: AssetImage('images/${weatherData['list'][index]['weather'][0]['main'].toLowerCase()}.png'),                ),
                   // Text(
                   //   "City: ${weatherData['name']}",
                   //   style: TextStyle(fontSize: 22),
                   // ),

             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text(
                     "${DateFormat('E dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(weatherData['list'][index]['dt'] * 1000))}",
                     style: TextStyle(
                         fontSize: 18,
                         color: Colors.black,
                         fontWeight: FontWeight.bold),
                   ),
                   Text(
                     "${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(weatherData['list'][index]['dt'] * 1000))}  | ${weatherData['list'][index]['weather'][0]['main']}",
                     style: TextStyle(
                         fontSize: 18,
                         color: Colors.black,
                         fontWeight: FontWeight.bold),
                   ),
                 ],
               ),
             )
                 ],
               ),
                Text(
                  "Temperature: ${(weatherData['list'][index]['main']['temp'] - 273.15).toStringAsFixed(2)} °C",
                  style: TextStyle(fontSize: 18),
                ),
                // Text(
                //   "Weather: ${weatherData['weather'][0]['description']}",
                //   style: TextStyle(fontSize: 22),
                // ),


               // Text("$weatherData['list'][index]['main']['temp']",style: TextStyle(fontSize: 22),)

              ],

            ),

          );

        },

      )



    );
  }
}
