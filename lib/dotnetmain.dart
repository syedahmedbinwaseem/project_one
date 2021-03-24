import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:projectone/cppclass.dart';
import 'package:projectone/cppmethods.dart';
import 'package:projectone/cppvariables.dart';
import 'package:projectone/multiClass.dart';
import 'package:projectone/multiMethods.dart';
import 'package:projectone/multiVariables.dart';
import 'package:projectone/netclass.dart';
import 'package:projectone/netmethods.dart';
import 'package:projectone/netvariables.dart';

class NetProject extends StatefulWidget {
  @override
  _NetProjectState createState() => _NetProjectState();
}

class _NetProjectState extends State<NetProject> {
  double upheight;
  double downheight;
  double newh;
  double neww;
  double downh;
  double margin;
  double downw;
  double leftp;
  int duration;
  List mymethods = [];
  List myclass = [];
  List myfiles = [];
  List myvariables = [];
  int varr = 0;

  getVariables() {
    myfiles.forEach(
      (file) {
        int i = 0;
        File(file).readAsString().then(
          (String value) {
            setState(
              () {
                myvariables.add('File Name: ' + path.basename(file));
                myvariables.add('VARIABLES: ');
              },
            );
            for (String element in LineSplitter().convert(value)) {
              if (element.contains(';') &&
                  !element.contains('new') &&
                  !element.contains('/') &&
                  (element.contains('string') ||
                      element.contains('int') ||
                      element.contains('byte') ||
                      element.contains('double') ||
                      element.contains('SqlConnection') ||
                      element.contains('DataSet') ||
                      element.contains('SqlDataAdapter') ||
                      element.contains('SqlCommand') ||
                      element.contains('SqlDataReader') ||
                      element.contains('short') ||
                      element.contains('long') ||
                      element.contains('float') ||
                      element.contains('char') ||
                      element.contains('boolean'))) {
                setState(
                  () {
                    myvariables.add("▶ " + element.replaceAll(";", ""));
                  },
                );
                i++;
              }
            }
            setState(
              () {
                myvariables.add('\n');
                myvariables.add('TOTAL NUMBER OF VARIABLES $i');
                myvariables.add(
                    '\n------------------------------------------------------------------------\n');
              },
            );
          },
        );
      },
    );
  }

  getClass() {
    myfiles.forEach(
      (file) {
        File(file).readAsString().then(
          (String value) {
            setState(
              () {
                myclass.add('File Name: ' + path.basename(file));
                myclass.add('CLASS NAME: \n');
              },
            );
            for (String element in LineSplitter().convert(value)) {
              if (element.contains('class') &&
                  (!element.contains('<')) &&
                  (!element.contains('/'))) {
                setState(
                  () {
                    myclass.add('▶ ' + element.replaceAll("{", ""));
                  },
                );
              }
            }
            setState(
              () {
                myclass.add(
                    '\n--------------------------------------------------------------------------------------------\n');
              },
            );
          },
        );
      },
    );
  }

  getMethods() {
    myfiles.forEach(
      (file) {
        int i = 0;
        File(file).readAsString().then(
          (String value) {
            setState(
              () {
                mymethods.add('File Name: ' + path.basename(file));
                mymethods.add('METHODS: ');
              },
            );
            for (String element in LineSplitter().convert(value)) {
              if (element.contains('(') &&
                  element.contains(')') &&
                  !element.contains('System') &&
                  !element.contains('=') &&
                  !element.contains('/') &&
                  !element.contains('h1') &&
                  !element.contains('return') &&
                  (element.toLowerCase().contains('string') ||
                      element.contains('int') ||
                      element.contains('void') ||
                      element.contains('protected') ||
                      element.contains('public') ||
                      element.contains('byte') ||
                      element.contains('double') ||
                      element.contains('short') ||
                      element.contains('long') ||
                      element.contains('float') ||
                      element.contains('char') ||
                      element.contains('boolean'))) {
                setState(
                  () {
                    mymethods.add(
                        "▶ " + element.replaceAll("{", "").replaceAll(";", ""));
                  },
                );
                i++;
              }
            }
            setState(
              () {
                mymethods.add('\n');
                mymethods.add('TOTAL NUMBER OF METHODS = $i');
                mymethods.add(
                    ' \n--------------------------------------------------------------------------------------------\n');
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (myfiles.length > 0) {
      setState(() {
        downheight = 100;
        upheight = 100;
        newh = 100;
        neww = 300;
        downh = height;
        downw = width;
        duration = 500;
        margin = 0;
      });
    } else {
      setState(() {
        downheight = 400;
        upheight = 250;
        newh = 0;
        neww = 0;
        downh = 0;
        downw = 0;
        duration = 0;
        margin = height * 0.06;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '.NET',
          style: TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 19,
              fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        backgroundColor: Color.fromRGBO(103, 42, 122, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: height,
            width: width,
            color: Color.fromRGBO(0, 162, 226, 1),
          ),
          GestureDetector(
            child: AnimatedContainer(
              margin: EdgeInsets.only(top: margin),
              duration: Duration(milliseconds: duration),
              height: upheight,
              width: downheight,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/manager.png'),
                ),
              ),
            ),
            onTap: () async {
              setState(
                () {
                  myclass = [];
                  myvariables = [];
                  myfiles = [];
                  mymethods = [];
                },
              );
              List<File> files = await FilePicker.getMultiFile();

              files.forEach(
                (file) {
                  setState(
                    () {
                      myfiles.add(file
                          .toString()
                          .replaceAll("File:", "")
                          .replaceAll("'", "")
                          .replaceAll(" ", ""));
                    },
                  );
                },
              );

              getClass();
              getVariables();
              getMethods();
            },
          ),
          AnimatedContainer(
            margin: EdgeInsets.only(left: 100),
            duration: Duration(milliseconds: duration),
            height: newh,
            width: neww,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Files Selected!',
                    style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Total Files Selected = ${myfiles.length}',
                    style: TextStyle(
                        fontFamily: 'Sans Light',
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                'Select Files',
                style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 160),
              child: Text(
                'You can select a single file or a whole project',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Sans Light',
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: duration),
            margin: EdgeInsets.only(top: 110),
            height: downh,
            width: downw,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 8),
                    child: Text(
                      'Operations',
                      style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 5),
                    child: Text(
                      'You can perform the following operations:',
                      style: TextStyle(
                          fontFamily: 'Sans Light',
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NetClass(
                                          myclass: myclass,
                                        )));
                          },
                          child: Container(
                            height: height * 0.23,
                            width: width * 0.27,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: height * 0.15,
                                  width: width * 0.27,
                                  child: Image(
                                    fit: BoxFit.contain,
                                    image:
                                        AssetImage('assets/images/class.png'),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.015,
                                ),
                                Container(
                                  height: height * 0.03,
                                  child: FittedBox(
                                    child: Text(
                                      'Get Classes',
                                      style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontSize: 15),
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
                                    builder: (context) => NetVariables(
                                          myvariables: myvariables,
                                        )));
                          },
                          child: Container(
                            height: height * 0.23,
                            width: width * 0.27,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: height * 0.15,
                                  width: width * 0.27,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/variability.png'),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.015,
                                ),
                                Container(
                                  height: height * 0.03,
                                  child: FittedBox(
                                    child: Text(
                                      'Get Variables',
                                      style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontSize: 15),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NetMethods(
                                        mymethods: mymethods,
                                      )));
                        },
                        child: Container(
                          height: height * 0.23,
                          width: width * 0.27,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: height * 0.15,
                                width: width * 0.27,
                                child: Image(
                                  image: AssetImage('assets/images/coding.png'),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Container(
                                height: height * 0.03,
                                child: FittedBox(
                                  child: Text(
                                    'Get Methods',
                                    style: TextStyle(
                                        fontFamily: 'Open Sans', fontSize: 15),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: height * 0.23,
                        width: width * 0.27,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
