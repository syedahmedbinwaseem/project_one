import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NetVariables extends StatefulWidget {
  List myvariables;
  NetVariables({this.myvariables});
  @override
  _NetVariablesState createState() => _NetVariablesState();
}

class _NetVariablesState extends State<NetVariables> {
  Widget listItem(String name) {
    if (name.contains('File')) {
      return Container(
        height: 22,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueGrey[300],
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: FittedBox(
            alignment: Alignment.centerLeft,
            child: Text(
              name,
              style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
    } else if (name.contains('VARIABLES:')) {
      return Container(
        height: 30,
        color: Colors.blueGrey[300],
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 4),
          child: Text(
            name,
            style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ),
      );
    } else if (name.contains('---------')) {
      return Container(
        height: 40,
      );
    } else if (name.contains('=') &&
        (name.contains('int') ||
            name.contains('byte') ||
            name.contains('double') ||
            name.contains('short') ||
            name.contains('long') ||
            name.contains('float') ||
            name.contains('char') ||
            name.contains('string') ||
            name.contains('boolean'))) {
      return Container(
        color: Colors.lightGreen[200],
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 8, top: 8),
          child: Text(
            name.split('=')[0],
            style: TextStyle(color: Colors.black, fontFamily: 'Open Sans'),
          ),
        ),
      );
    } else if (name.contains('=') &&
        !(name.contains('int') ||
            name.contains('byte') ||
            name.contains('double') ||
            name.contains('short') ||
            name.contains('long') ||
            name.contains('float') ||
            name.contains('char') ||
            name.contains('string') ||
            name.contains('boolean'))) {
      return Container();
    }
    {
      return Container(
        color: Colors.lightGreen[200],
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 8, top: 8),
          child: Text(
            name,
            style: TextStyle(color: Colors.black, fontFamily: 'Open Sans'),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Variables',
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
            color: Colors.white,
          ),
          ListView(
            children: widget.myvariables.map((e) {
              return listItem(e);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
