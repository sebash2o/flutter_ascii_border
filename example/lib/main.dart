import 'package:flutter/material.dart';
import 'package:asciiborder/asciiborder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestCanvas(),
    );
  }
}

// #ffffff • #d0e1f9 • #4d648d • #283655 • #1e1f26
class TestCanvas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0x1e, 0x1f, 0x26),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AsciiCircle(
                color: Color.fromARGB(255, 0xd0, 0xe1, 0xf9),
                strokeWidth: 10,
                padding: const EdgeInsets.all(15),
                child: FlutterLogo(size: 50),
              ),
              SizedBox(
                width: 10.0,
                height: 20.0,
              ),
              AsciiBox(
                strokeWidth: 6.0,
                padding: const EdgeInsets.all(15),
                topRightCorner: ".",
                topLeftCorner: "&",
                bottomLeftCorner: "\\",
                bottomRightCorner: "`",
                horizontalBar: "#",
                verticalBar: "#",
                color: Color.fromARGB(255, 0xd0, 0xe1, 0xf9),
                child: Container(
                  width: 200,
                  height: 55,
                  child: Center(
                    child: Text(
                      "Flutter Hackathon 2020",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 0x4d, 0x64, 0x8d),
                        fontWeight: FontWeight.bold,
                        fontFamily: "GochiHand",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
                height: 20.0,
              ),
              AsciiBox(
                strokeWidth: 6.0,
                padding: const EdgeInsets.all(15),
                topRightCorner: ".",
                bottomLeftCorner: "\\",
                bottomRightCorner: "`",
                color: Color.fromARGB(255, 0xd0, 0xe1, 0xf9),
                child: Container(
                  width: 200,
                  height: 20,
                  child: Center(
                    child: Text(
                      "ASCII art border",
                      style: TextStyle(
                        fontSize: 15,
                        //color: Color.fromARGB(255, 0x4d, 0x64, 0x8d), // d0e1f9
                        color: Color.fromARGB(255, 0x4d, 0x64, 0x8d), // d0e1f9
                        fontWeight: FontWeight.w300,
                        fontFamily: "SourceCodePro",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
