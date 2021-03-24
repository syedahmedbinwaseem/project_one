import 'package:flutter/material.dart';
import 'package:projectone/cppmain.dart';

class CppMain extends StatefulWidget {
  @override
  _CppMainState createState() => _CppMainState();
}

class _CppMainState extends State<CppMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Architecture Recovery'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'You have selected C++\n\n\n\n\nCONTINUE?',
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  child: Center(child: Text('YES')),
                  height: 60,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CppProject()));
                },
              ),
              SizedBox(width: 10),
              GestureDetector(
                child: Container(
                  child: Center(child: Text('NO')),
                  height: 60,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
