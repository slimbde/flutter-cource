import 'dart:async';

import 'package:flutter/material.dart';

class MyFirstApp extends StatefulWidget {
  const MyFirstApp({super.key});

  @override
  State<MyFirstApp> createState() => _MyFirstAppState();
}

class _MyFirstAppState extends State<MyFirstApp> {
  bool _isLoading = false;
  double _percent = 0.0;

  _download() {
    setState(() {
      _isLoading = !_isLoading;
    });

    if (_isLoading) {
      _percent = 0;

      const delay = Duration(milliseconds: 10);
      Timer.periodic(delay, (Timer t) {
        setState(() {
          _percent += 0.01;

          if (_percent.toStringAsFixed(2) == '1.00') {
            _isLoading = false;
            t.cancel();

            Future.delayed(Duration(seconds: 1), () {
              setState(() {
                _percent = 0.0;
              });
            });
            return;
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          title: Text("My widget app"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearProgressIndicator(
                  value: _percent,
                ),
                Text(
                  '${(_percent * 100).toStringAsFixed(0)}%',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'Press button to download',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _download,
          child: Icon(Icons.cloud_download),
        ),
      ),
    );
  }
}
