import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Flutter",
      home: RandomWords(),
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
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
      appBar: AppBar(
          title: Text("Home Page")
      ),
      body: Center(child: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (context, index) {

        if (index.isOdd) return Divider();
        return _buildRow(data[index]["category"]);
      })),

      floatingActionButton: FloatingActionButton(
          tooltip: "Like",
          child: Text("${data == null ? 0 : data.length}"),
          backgroundColor: Colors.blue,
          onPressed: null
      ),
    );
  }

  Widget _buildRow(String string) {
    return ListTile(
      title: Text(
        string,
        style: _biggerFont,
      ),
      trailing: new Icon(
        Icons.favorite,
        color: Colors.red,
      ),
    );
  }
}