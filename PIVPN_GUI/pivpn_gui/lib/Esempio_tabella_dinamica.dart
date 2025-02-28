import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DynamicTable(),
    );
  }
}

class DynamicTable extends StatefulWidget {
  @override
  _DynamicTableState createState() => _DynamicTableState();
}

class _DynamicTableState extends State<DynamicTable> {
  List<Map<String, dynamic>> _data = [
    {"name": "John", "age": 25},
    {"name": "Jane", "age": 30},
  ];

  void _addData() {
    setState(() {
      _data.add({"name": "New Person", "age": 28});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Table'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Name',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Age',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: _data
                .map(
                  (item) => DataRow(
                    cells: <DataCell>[
                      DataCell(Text(item['name'])),
                      DataCell(Text(item['age'].toString())),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addData,
        tooltip: 'Add Data',
        child: Icon(Icons.add),
      ),
    );
  }
}
