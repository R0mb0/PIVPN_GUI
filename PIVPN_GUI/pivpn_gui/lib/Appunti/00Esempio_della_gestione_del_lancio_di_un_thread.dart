import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Thread Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Thread Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ThreadManager _threadManager = ThreadManager();
  bool _isThreadRunning = false;

  @override
  void dispose() {
    _threadManager.stopThread();
    super.dispose();
  }

  void _startThread() {
    _threadManager.startThread();
    setState(() {
      _isThreadRunning = true;
    });
  }

  void _stopThread() {
    _threadManager.stopThread();
    setState(() {
      _isThreadRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _isThreadRunning ? 'Thread is running' : 'Thread is stopped',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isThreadRunning ? _stopThread : _startThread,
              child: Text(_isThreadRunning ? 'Stop Thread' : 'Start Thread'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThreadManager {
  bool _isRunning = false;
  Isolate? _isolate;

  void startThread() {
    if (_isRunning) return;
    _isRunning = true;
    _runThread();
  }

  void stopThread() {
    if (!_isRunning) return;
    _isRunning = false;
    _isolate?.kill(priority: Isolate.immediate);
  }

  Future<void> _runThread() async {
    _isolate = await Isolate.spawn(_threadEntry, _isRunning);
  }

  static void _threadEntry(bool isRunning) {
    while (isRunning) {
      print('Thread is running...');
      sleep(Duration(seconds: 1)); // Simulate work
    }
  }
}
