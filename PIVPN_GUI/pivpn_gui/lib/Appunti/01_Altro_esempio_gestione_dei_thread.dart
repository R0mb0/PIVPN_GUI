import 'dart:async';
import 'dart:isolate';
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
  ReceivePort? _receivePort;

  void startThread() {
    if (_isRunning) return;
    _isRunning = true;
    _receivePort = ReceivePort();
    Isolate.spawn(_threadEntry, _receivePort!.sendPort);
  }

  void stopThread() {
    if (!_isRunning) return;
    _isRunning = false;
    _isolate?.kill(priority: Isolate.immediate);
    _receivePort?.close();
  }

  static void _threadEntry(SendPort sendPort) async {
    bool isRunning = true;
    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);

    receivePort.listen((message) {
      if (message == 'stop') {
        isRunning = false;
        receivePort.close();
      }
    });

    while (isRunning) {
      print('Thread is running...');
      await Future.delayed(Duration(seconds: 1)); // Simulate work
    }
    print('Thread stopped.');
  }
}
