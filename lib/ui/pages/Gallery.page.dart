import 'package:app_flutter/ui/widget/Gallery.data.widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; import 'dart:convert';


class Gallery extends StatefulWidget {

  @override
_GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  String keyword="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(keyword),
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
                      this.keyword=value;
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>GalleryData(keyword)));
                  },
                  child: Text('Get Images ..',style: TextStyle(fontSize: 22),),


                ),
              ),
            )
          ],
        )
    );
  }
}
