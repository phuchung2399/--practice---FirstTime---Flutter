import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MaterialApp(
  title: "Test App",
  home: MyApp(),
));

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), tooltip: "Icon Home",onPressed: null),
        title: Center(
          child: Text("Home Page"),
        ),
      ),
      body: Center(
        child: RandomWord(),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add",
        child: Icon(Icons.add),
        onPressed: null
      ),
    );
  }
}

class RandomWord extends StatefulWidget{
  @override
  StateRandomWord createState() => StateRandomWord();
}

class StateRandomWord extends State<RandomWord>{
  final _words = <WordPair>[];

  @override
  Widget build(BuildContext context){
   return ListView.separated(
     padding: const EdgeInsets.all(8),
     itemCount: _words.length,
       itemBuilder: (context, index){
       _words.addAll(generateWordPairs().take(10));
         return Container(
           height: 50.0,
           child: _buildRow(_words[index])
         );
   },
     separatorBuilder: (BuildContext context, int index) => const Divider(),
   );
  }

  Widget _buildRow(WordPair wordPair){
   return ListTile(
     title: Text(
         wordPair.asPascalCase,
         style: const TextStyle(fontSize: 15.0),
     ),
   );
  }
}