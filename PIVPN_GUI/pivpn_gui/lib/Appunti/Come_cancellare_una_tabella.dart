import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DataTable Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<DataRow> _rows = [
    DataRow(cells: [DataCell(Text('Row 1, Col 1')), DataCell(Text('Row 1, Col 2'))]),
    DataRow(cells: [DataCell(Text('Row 2, Col 1')), DataCell(Text('Row 2, Col 2'))]),
  ];

  void _clearRows() {
    setState(() {
      _rows = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter DataTable Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DataTable(
              columns: [
                DataColumn(label: Text('Column 1')),
                DataColumn(label: Text('Column 2')),
              ],
              rows: _rows,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _clearRows,
              child: Text('Clear Rows'),
            ),
          ],
        ),
      ),
    );
  }
}
