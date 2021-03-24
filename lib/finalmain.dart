import 'package:flutter/material.dart';
import 'package:projectone/cpp.dart';
import 'package:projectone/cppmain.dart';
import 'package:projectone/dotnetmain.dart';
import 'package:projectone/mainScreen.dart';
import 'package:projectone/project.dart';

class FinalMain extends StatefulWidget {
  @override
  _FinalMainState createState() => _FinalMainState();
}

class _FinalMainState extends State<FinalMain> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              child: Image(
                height: height,
                width: width,
                fit: BoxFit.fill,
                image: AssetImage('assets/images/yes.png'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: height * 0.07),
              child: Text(
                'Language',
                style: TextStyle(
                    fontFamily: 'Open Sans',
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: height * 0.13),
              child: Text(
                'We currently support these languages:',
                style: TextStyle(
                    fontFamily: 'Sans Light',
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: height * 0.35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Project()));
                          },
                          child: Container(
                            height: height * 0.25,
                            width: width * 0.30,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: height * 0.17,
                                  width: width * 0.30,
                                  child: Image(
                                    image: AssetImage('assets/images/java.png'),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.015,
                                ),
                                Container(
                                  height: height * 0.04,
                                  width: width * 0.30,
                                  child: FittedBox(
                                    child: Text(
                                      'Java',
                                      style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontSize: 20),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CppProject()));
                          },
                          child: Container(
                            height: height * 0.25,
                            width: width * 0.30,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: height * 0.17,
                                  width: width * 0.30,
                                  child: Image(
                                    image: AssetImage('assets/images/cpp.png'),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  height: height * 0.04,
                                  width: width * 0.30,
                                  child: FittedBox(
                                    child: Text(
                                      'C++',
                                      style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontSize: 20),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NetProject()));
                        },
                        child: Container(
                          height: height * 0.25,
                          width: width * 0.30,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: height * 0.17,
                                width: width * 0.30,
                                child: Image(
                                  image: AssetImage('assets/images/net.png'),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                height: height * 0.04,
                                width: width * 0.30,
                                child: FittedBox(
                                  child: Text(
                                    '.NET',
                                    style: TextStyle(
                                        fontFamily: 'Open Sans', fontSize: 20),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 165,
                        width: 110,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
