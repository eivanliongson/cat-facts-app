import 'package:flutter/material.dart';
import 'facts.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

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
      Color(0xFF035aa6),
      Color(0xFF40bad5),
      Color(0xFF120136),
      Color(0xFF16817a)
    ];

    return Scaffold(
        backgroundColor: randomColors[random.nextInt(4)],
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
                      border: Border.all(width: 4, color: Colors.white),
                      color: Color(0xFF30475e),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                displayText,
                                style: GoogleFonts.balooPaaji(
                                    textStyle: TextStyle(
                                        fontSize: 28,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 250,
                      child: RaisedButton(
                        color: Colors.red,
                        onPressed: getFacts,
                        child: Center(
                          child: Text(
                            'TAP',
                            style: GoogleFonts.balooPaaji(
                                textStyle: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  getFacts() async {
    await facts.getFacts();
    print(facts.text);
    setState(() {
      displayText = facts.text;
    });
  }

  Widget buildImage() {

    List<AssetImage> image = [
      AssetImage('images/1.jpg'),
      AssetImage('images/2.jpg'),
      AssetImage('images/3.jpg'),
      AssetImage('images/4.jpg')
    ];

    return Container(
      height: 300,
      width: 450,
      decoration: BoxDecoration(
        border: Border.all(width: 4, color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        child: Image(
          image: image[random.nextInt(2)],
          fit: BoxFit.fill,
        ),
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
            border: Border.all(width: 4, color: Colors.white),
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF30475e)),
        child: Center(
            child: Text(
          'Did You Know?',
          style: GoogleFonts.balooPaaji(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  letterSpacing: 4)),
        )),
      ),
    );
  }
}
