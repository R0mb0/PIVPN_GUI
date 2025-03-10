import 'package:flutter/material.dart';
import 'Mediator.dart';

import 'dart:async';
import 'dart:isolate';

// --------------------- MAIN ---------------------
void main() {
  runApp(const MyApp());
}
// --------------------- MAIN ---------------------

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PIVPN_GUI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'PIVPN_GUI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver{
  
  Mediator mediator = Mediator(); //<- here i can work with my mediator 
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Declaration variables for internal functions
  String name = "";
  String startDate = "";
  String endDate = "";
  bool isAlwaysAllowed = false;

  String errorMessage = "";
  Color colorMessage = Colors.red;

  // target field to write on table
  List<DataRow> tableData = [];

  // Functional fields when adding a user
  DateTime start = DateTime.utc(0);
  DateTime end = DateTime.utc(0);

  // Fields to Manage Thread
  final ThreadManager _threadManager = ThreadManager();
  bool _isThreadRunning = false;

  /****************************************************/
  // Dispose function 
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _threadManager.stopThread();
    super.dispose();
  }
   /****************************************************/

  /***********************************************************/
  // Functions to Manage Thread
  void _startThread() {
    _threadManager.startThread(update_table);
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
  /***********************************************************/

  /***********************************************************/
  // Functions to manage the state of the app 
   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _startThread(); // Start thread to manage users
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
      _onWindowClose();
    }
  }

  // Event on close
  void _onWindowClose() {
    _stopThread();
    //mediator.SaveDatabase(); //<--------------------------------------------------------------------------------------------------------------------------------
  }
  /***********************************************************/


  // Function to launch an alert
  void launch_allert(String error, Color colore) {
    setState(() {
      errorMessage = error;
      colorMessage = colore;
    });
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        errorMessage = "";
      });
    });
  }

  // Function to add a user 
  void add_user() {
    if (name.isEmpty || startDate.isEmpty || endDate.isEmpty) {
      launch_allert("A field is empty!", Colors.red);
    } else {
      try {
        start = DateTime.parse(startDate);
      } on Exception catch (e) {
        launch_allert("Start time is not valid!", Colors.red);
        return;
      }
      try {
        end = DateTime.parse(endDate);
      } on Exception catch (e) {
        launch_allert("End time is not valid!", Colors.red);
        return;
      }
      launch_allert(mediator.AddUser(name, start, end, true, isAlwaysAllowed), Colors.orange);
      update_table();
    }
  }

  // Function to remove a user
  void remove_user() {
    if (name.isEmpty) {
      launch_allert("A field is empty!", Colors.red);
    } else {
      launch_allert(mediator.RemoveUser(name), Colors.orange);
      update_table();
    }
  }

  // Function to enable a user 
  void enable_user() {
    if (name.isEmpty) {
      launch_allert("A field is empty!", Colors.red);
    } else {
      launch_allert(mediator.EnableUser(name), Colors.orange);
      update_table();
    }
  }

  // Function to disable a user 
  void disable_user() {
    if (name.isEmpty) {
      launch_allert("A field is empty!", Colors.red);
    } else {
      launch_allert(mediator.DisableUser(name), Colors.orange);
      update_table();
    }
  }

  void save_database() {
    launch_allert(mediator.SaveDatabase(), Colors.green);
  }

  Future<void> load_database() async {
    launch_allert(await mediator.LoadDatabase(), Colors.green);
    update_table();
  }

  void update_table() {
    setState(() {
      tableData = mediator.getDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Name ->'),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 200,
                        child: TextFormField(
                          onChanged: (value) {
                            this.name = value;
                          },
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Insert name',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.lime,
                          ),
                          cursorColor: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  Text('Start Date ->'),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 200,
                        child: TextFormField(
                          onChanged: (value) {
                            this.startDate = value;
                          },
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Ex 2024-10-18',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.lime,
                          ),
                          cursorColor: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  Text('End Date ->'),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 200,
                        child: TextFormField(
                          onChanged: (value) {
                            this.endDate = value;
                          },
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Ex 2024-10-18',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.lime,
                          ),
                          cursorColor: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  Text('Is always allowed? -> '),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          unselectedWidgetColor: Colors.white30,
                        ),
                        child: Checkbox(
                          tristate: true, // Example with tristate
                          value: this.isAlwaysAllowed,
                          onChanged: (bool? newValue) {
                            setState(() {
                              if (this.isAlwaysAllowed) {
                                this.isAlwaysAllowed = false;
                              } else {
                                this.isAlwaysAllowed = newValue!;
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                    ),
                    onPressed: () {
                      add_user();
                    },
                    child: Text('ADD USER'),
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                    ),
                    onPressed: () {
                      remove_user();
                    },
                    child: Text('REMOVE USER'),
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                    ),
                    onPressed: () {
                      enable_user();
                    },
                    child: Text('ENABLE USER'),
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                    ),
                    onPressed: () {
                      disable_user();
                    },
                    child: Text('DISABLE USER'),
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                    ),
                    onPressed: () {
                      save_database();
                    },
                    child: Text('SAVE DATABASE'),
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                    ),
                    onPressed: () {
                      load_database();
                    },
                    child: Text('LOAD DATABASE'),
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
                color: Color(0x00E0E3E7),
              ),
              Text(
                errorMessage,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: colorMessage,
                  fontSize: 30,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Divider(
                thickness: 2,
                color: Color(0x00E0E3E7),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: MaterialStateProperty.all<Color>(Colors.lime),
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Start date',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'End date',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Is enabled?',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Is always enabled?',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                      rows: tableData,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ******************************************* Function to manage Threads *******************************************

class ThreadManager {
  bool _isRunning = false;
  Isolate? _isolate;
  ReceivePort? _receivePort;
  late StreamSubscription _subscription;

  void startThread(Function updateTable) {
    if (_isRunning) return;
    _isRunning = true;
    _receivePort = ReceivePort();
    _subscription = _receivePort!.listen((message) {
      if (message == 'update') {
        updateTable();
      }
    });
    Isolate.spawn(_threadEntry, _receivePort!.sendPort);
  }

  void stopThread() {
    if (!_isRunning) return;
    _isRunning = false;
    _isolate?.kill(priority: Isolate.immediate);
    _subscription.cancel();
    _receivePort?.close();
  }

  static void _threadEntry(SendPort sendPort) async {
    // My field to work 
    Mediator mediator = Mediator();

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
      mediator.GetAllUsers().forEach((value){
        if(!value.isAlwaysAllowed && value.isEnabled && DateTime.now().isAfter(value.endDate))
        {
          value.isEnabled = false; 
        }
      });
      mediator.SaveDatabase();
      sendPort.send('update'); // Send update message to main isolate
      await Future.delayed(Duration(seconds: 86400)); // delay for operations
    }
    print('Thread stopped.');
  }
}