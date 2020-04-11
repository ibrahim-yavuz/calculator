import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _number1 = 0;
  int _number2 = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Center(child: Text('Calculator')),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  onChanged: (String value){
                    setState(() {
                      _number1 = int.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10000),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10000),
                    ),
                    hintText: 'Enter a Number',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  onChanged: (String value){
                    setState(() {
                      _number2 = int.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10000),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10000),
                    ),
                    hintText: 'Enter a Number',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomCard(
                      text: '+',
                      result: (_number1 + _number2).toString(),
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      text: '-',
                      result: (_number1 - _number2).toString(),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomCard(
                      text: 'x',
                      result: '${_number1 * _number2}',
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      text: '/',
                      result: '${_number1 / _number2}',
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  String text, result;

  CustomCard({this.text, this.result});

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Material(
        elevation: 3,
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context){
                print(widget.result);
                return AlertDialog(
                  title: Text('Result'),
                  content: Text('${widget.result}'),
                );
              }
            );
          },
          child: Container(
            height: 150,
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(color: Colors.grey, fontSize: 100),
              ),
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
