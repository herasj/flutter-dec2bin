import 'package:flutter/material.dart';
import './widgets/bin2dec.dart';
import './widgets/dec2bin.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _bin = true;
  @override
  Widget build(BuildContext context) {
    if (_bin) {
      return MaterialApp(
        title: 'Conversor',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Conversor Bin2Dec'),
          ),
          body: Column(
            children: [
              Center(
                child: Bin2Dec(),
              ),
              Container(
                  padding: EdgeInsets.all(4),
                  child: Align(
                    child: FloatingActionButton(
                        onPressed: () => _changeScreen(),
                        tooltip: "Dec2bin",
                        child: Icon(Icons.autorenew_rounded),
                        backgroundColor: Colors.blueAccent),
                    alignment: Alignment.bottomRight,
                  ))
            ],
          ),
        ),
      );
    } else {
      return MaterialApp(
        title: 'Conversor',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Conversor Dec2Bin'),
          ),
          body: Column(
            children: [
              Center(
                child: Dec2Bin(),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FloatingActionButton(
                      onPressed: () => _changeScreen(),
                      tooltip: "Bin2Dec",
                      child: Icon(Icons.autorenew_rounded),
                      backgroundColor: Colors.blueAccent),
                ),
              )
            ],
          ),
        ),
      );
    }
  }

  void _changeScreen() {
    print(_bin);
    setState(() {
      _bin = !_bin;
    });
  }
}
