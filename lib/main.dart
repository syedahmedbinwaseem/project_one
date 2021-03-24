import 'package:flutter/material.dart';
import 'package:easy_permission_validator/easy_permission_validator.dart';
import 'package:projectone/cpp.dart';
import 'package:projectone/finalmain.dart';
import 'package:projectone/mainScreen.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() => runApp(new MaterialApp(
      home: new Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    permissionRequest();
    super.initState();
  }

  permissionRequest() async {
    final permissionValidator = EasyPermissionValidator(
      context: context,
      appName: 'Easy Permission Validator',
    );
    var result = await permissionValidator.storage();
    if (result) {
      print('granted');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Color.fromRGBO(66, 44, 178, 1),
                  Color.fromRGBO(168, 94, 207, 1)
                ])),
          ),
          Container(
            margin: EdgeInsets.only(
                left: (width - width * 0.5) / 2, top: height * 0.13),
            height: height * 0.4,
            width: width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(105),
            ),
            child: Image(
              image: AssetImage('assets/images/monitor.png'),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                'Welcome',
                style: TextStyle(
                    fontFamily: 'Open Sans',
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 210),
              child: Text(
                'Software Architecture Recovery using Syntactic Clustering',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Sans Light',
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => FinalMain()));
              },
              child: Icon(
                Icons.arrow_right,
                color: Colors.white,
                size: 80,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
