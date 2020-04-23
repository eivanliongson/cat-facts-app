import 'package:flutter/material.dart';
import 'facts.dart';
import 'dart:math';

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
  Facts facts = Facts();
  String displayText = 'Meow!';
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    List<Color> randomColors = [
      Colors.red,
      Colors.orange,
      Colors.blue,
      Colors.pink
    ];

    return Scaffold(
      backgroundColor: randomColors[random.nextInt(4)],
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
                child: Stack(
                  overflow: Overflow.visible,
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    buildImage(), // Cat Image
                    Positioned(bottom: -50, child: buildTitle())
                  ],
                ),
              ),
              // BODY
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 400,
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            displayText,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                ),
              ),
              Container(
                width: 200,
                height: 50,
                child: RaisedButton(
                  onPressed: getFacts,
                ),
              )
            ],
          ),
        ));
  }

  void getFacts() {
    setState(() async {
      await facts.getFacts();
      print(facts.text);
      displayText = facts.text;
    });
  }

  Widget buildImage() {
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

    return Container(
      height: 300,
      width: 450,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        child: image[random.nextInt(2)],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(width: 4, color: Colors.red),
            borderRadius: BorderRadius.circular(10),
            color: Colors.orange),
        child: Center(
            child: Text(
          'Random Cat Facts',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 21),
        )),
      ),
    );
  }
}
