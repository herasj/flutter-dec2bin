import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Bin2Dec extends StatefulWidget {
  @override
  _Bin2DecState createState() => _Bin2DecState();
}

class _Bin2DecState extends State<Bin2Dec> {
  String _numbers = "0";
  String _binary = "0";
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
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
                      text: '${_binary}',
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
                      text: '${_numbers}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
                ],
              ),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              child: SizedBox(
                height: 450,
                width: 128,
                child: Container(
                  child: ElevatedButton(
                    child: Text('0'),
                    onPressed: () {
                      _addNumber('0');
                    },
                  ),
                ),
              ),
              padding: EdgeInsets.all(8),
            ),
            Container(
              child: SizedBox(
                height: 450,
                width: 128,
                child: Container(
                  child: ElevatedButton(
                    child: Text('1'),
                    onPressed: () {
                      _addNumber('1');
                    },
                  ),
                ),
              ),
              padding: EdgeInsets.all(8),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(8),
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
    ));
  }

  void _addNumber(String newNum) {
    if (_binary.length >= 21) {
      Fluttertoast.showToast(
          msg: 'Limite de binarios alcanzado', gravity: ToastGravity.BOTTOM);
    } else {
      setState(() {
        if (_binary == '0') {
          _binary = newNum;
        } else {
          _binary += newNum;
        }
        _convertBinary(int.parse(_binary));
      });
    }
  }

  void _clearNumbers() {
    setState(() {
      _numbers = '0';
      _binary = '0';
    });
  }

  void _convertBinary(int binary) {
    int dec = 0;
    int base = 1;
    int temp = binary;
    while (temp > 0) {
      int lastDig = temp % 10;
      temp =  (temp / 10).round();
      dec += lastDig * base;
      base = base * 2;
    }
    if (dec.toString().length >= 21) {
      Fluttertoast.showToast(
          msg: 'El decimal es demasiado grande', gravity: ToastGravity.BOTTOM);
    } else {
      _numbers = dec.toString();
    }
  }
}
