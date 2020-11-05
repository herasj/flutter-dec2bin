import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Dec2Bin extends StatefulWidget {
  @override
  _Dec2BinState createState() => _Dec2BinState();
}

class _Dec2BinState extends State<Dec2Bin> {
  String _numbers = "0";
  String _binary = "0";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: '${_numbers}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
                ],
              ),
            ),
          ),
        ),
        Divider(indent: 5, endIndent: 5, color: Colors.grey),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 32),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: '${_binary}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
                ],
              ),
            ),
          ),
        ),
        Row(children: [
          Padding(
            child: ElevatedButton(
              child: Text('1'),
              onPressed: () {
                _addNumber('1');
              },
            ),
            padding: EdgeInsets.all(16),
          ),
          Padding(
            child: ElevatedButton(
              child: Text('2'),
              onPressed: () {
                _addNumber('2');
              },
            ),
            padding: EdgeInsets.all(16),
          ),
          Padding(
            child: ElevatedButton(
              child: Text('3'),
              onPressed: () {
                _addNumber('3');
              },
            ),
            padding: EdgeInsets.all(16),
          )
        ], mainAxisAlignment: MainAxisAlignment.center),
        Row(children: [
          Padding(
            child: ElevatedButton(
              child: Text('4'),
              onPressed: () {
                _addNumber('4');
              },
            ),
            padding: EdgeInsets.all(16),
          ),
          Padding(
            child: ElevatedButton(
              child: Text('5'),
              onPressed: () {
                _addNumber('5');
              },
            ),
            padding: EdgeInsets.all(16),
          ),
          Padding(
            child: ElevatedButton(
              child: Text('6'),
              onPressed: () {
                _addNumber('6');
              },
            ),
            padding: EdgeInsets.all(16),
          )
        ], mainAxisAlignment: MainAxisAlignment.center),
        Row(children: [
          Padding(
            child: ElevatedButton(
              child: Text('7'),
              onPressed: () {
                _addNumber('7');
              },
            ),
            padding: EdgeInsets.all(16),
          ),
          Padding(
            child: ElevatedButton(
              child: Text('8'),
              onPressed: () {
                _addNumber('8');
              },
            ),
            padding: EdgeInsets.all(16),
          ),
          Padding(
            child: ElevatedButton(
              child: Text('9'),
              onPressed: () {
                _addNumber('9');
              },
            ),
            padding: EdgeInsets.all(16),
          )
        ], mainAxisAlignment: MainAxisAlignment.center),
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.fromLTRB(82, 0, 82, 0),
              child: ElevatedButton(
                child: Text('0'),
                onPressed: () {
                  _addNumber('0');
                },
              ),
            ))
          ],
        ),
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.fromLTRB(82, 0, 82, 16),
              child: ElevatedButton(
                child: Text('Clear'),
                onPressed: () {
                  _clearNumbers();
                },
              ),
            ))
          ],
        )
      ],
    );
  }

  void _addNumber(String newNum) {
    if (_numbers.length >= 21) {
      Fluttertoast.showToast(
          msg: 'Limite de numeros alcanzado', gravity: ToastGravity.BOTTOM);
    } else {
      setState(() {
        if (_numbers == '0') {
          _numbers = newNum;
        } else {
          _numbers += newNum;
        }
        _convertDecimal(int.parse(_numbers));
      });
    }
  }

  void _clearNumbers() {
    setState(() {
      _numbers = '0';
      _binary = '0';
    });
  }

  void _convertDecimal(int decimal) {
    String bin = '';
    while (decimal > 0) {
      bin = bin + (decimal % 2).toString();
      decimal = (decimal / 2).floor();
    }
    if (bin.length >= 21) {
      Fluttertoast.showToast(
          msg: 'El binario es demasiado grande', gravity: ToastGravity.BOTTOM);
    } else {
      _binary = bin;
    }
  }
}
