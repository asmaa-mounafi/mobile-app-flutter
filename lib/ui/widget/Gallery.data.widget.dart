import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GalleryData extends StatefulWidget {
 String keyword;
   GalleryData(this.keyword);

  @override
  State<GalleryData> createState() => _GalleryDataState();
}

class _GalleryDataState extends State<GalleryData> {
  var galleryData;
  int currentPage=1;
  int size=5;
  List<dynamic> hits=[];
  @override
  void initState(){
    super.initState();
    this.getData();
  }

  getData()async{
    String url="https://pixabay.com/api/?key=5832566-81dc7429a63c86e3b707d0429&q=${widget.keyword}&page=$currentPage&per_page=$size";
    var uri = Uri.parse(url);

    try {
      final response = await http.get(uri);
      setState(() {
        this.galleryData = json.decode(response.body);
        hits=galleryData['hits'];
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.keyword),backgroundColor: Colors.blue,),
      body: (galleryData==null?CircularProgressIndicator():
      ListView.builder(
        itemCount: (galleryData==null?0:this.hits.length),
          itemBuilder: (context,index){
          return Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 5,right: 5,top: 0,bottom: 0),
                child: Card(
                    color: Colors.deepOrange,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(hits[index]['tags'],style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    )),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(right: 5,left: 5,top: 0,bottom: 0),
                child: Card(
                    child: Image.network(hits[index]['previewURL'],fit: BoxFit.fitWidth,)), ),
              Divider(color: Colors.grey,thickness: 2,),

            ],
          );
          }
      )
      )

    );
  }
}
