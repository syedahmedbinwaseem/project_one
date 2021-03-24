import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CppMethods extends StatefulWidget {
  List mymethods;
  CppMethods({this.mymethods});
  @override
  _CppMethodsState createState() => _CppMethodsState();
}

class _CppMethodsState extends State<CppMethods> {
  Widget listItem(String name) {
    if (name.contains('File')) {
      return Container(
        height: 35,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueGrey[300],
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Center(
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
    } else if (name.contains('CLASS')) {
      return Column(
        children: <Widget>[
          Container(
            height: 40,
          ),
          Container(
            height: 48,
            width: MediaQuery.of(context).size.width,
            color: Colors.blueGrey[300],
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 15),
              child: Text(
                name.split(":")[0].replaceAll("\n", ""),
                style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      );
    } else if (name.contains("::")) {
      return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.lightGreen[200],
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 8, top: 8),
          child: Text(
            "▶         " +
                name
                    .split("::")
                    .toString()
                    .substring((name.split("::").toString().indexOf(',') + 1))
                    .replaceAll(']', ""),
            style: TextStyle(color: Colors.black, fontFamily: 'Open Sans'),
          ),
        ),
      );
    } else if (name.contains('METHODS ARE')) {
      return Container(
        height: 30,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueGrey[300],
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            name,
            style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ),
      );
    } else if (name.contains('TOTAL NUMBER ')) {
      return Column(
        children: <Widget>[
          Container(
            height: 40,
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.blueGrey[300],
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      );
    }
    {
      return Container(
        width: MediaQuery.of(context).size.width,
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
          'Methods',
          style: TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 19,
              fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        backgroundColor: Color.fromRGBO(0, 89, 156, 1),
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
            children: widget.mymethods.map((e) {
              return listItem(e);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
