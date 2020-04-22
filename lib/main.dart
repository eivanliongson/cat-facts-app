import 'package:flutter/material.dart';
import 'facts.dart';

void main() => runApp(CatFacts());

class CatFacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeUI(),
    );
  }
}

class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  List<Image> image = [
    Image(
      image: AssetImage('images/1.jpg'),
      fit: BoxFit.fill,
    ),
    Image(
      image: AssetImage('images/2.jpg'),
      fit: BoxFit.fill,
    )
  ];

  // Instanse of Facts to be set here i think??????????
  Facts facts = Facts();
  String displayText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () async {
          await facts.getFacts();
          setState(() {
            print(facts.text);
            displayText = facts.text;
          });
        }),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  height: 300,
                  width: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: ClipRRect(
                    child: image[0],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
