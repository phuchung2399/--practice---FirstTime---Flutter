import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(new MaterialApp(
      home: new HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  final String url = "https://5cff0d8bd691540014b0d7be.mockapi.io/books/";
  List data;
  @override
  void initState(){
    super.initState();
    this.getData();
  }

  Future<String> getData() async{
    var response = await http.get(
      Uri.parse(url),
      headers: {"Accept": "application/json"}
    );
    setState(() {
      data = json.decode(response.body);
    });
    return "ok";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Home Page'),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: new Center(
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new Card(
                      child: new Container(
                          child: Text(data[index]["category"]),
                          padding: const EdgeInsets.all(20.0)),
                    ),
                  ]),
            )
          );
        },
      ),
    );
  }
}
