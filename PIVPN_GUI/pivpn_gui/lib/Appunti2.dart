import 'package:flutter/material.dart';
import 'package:process_run/shell.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Run Sudo Command'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: _runSudoCommand,
            child: Text('Run Sudo Command'),
          ),
        ),
      ),
    );
  }

  Future<void> _runSudoCommand() async {
    var shell = Shell();

    try {
      var result = await shell.run('echo your_password | sudo -S ls'); // Example command
      print(result.outText);
    } catch (e) {
      print('Error: $e');
    }
  }
}