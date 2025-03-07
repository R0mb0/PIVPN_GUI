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

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {

  Mediator mediator = Mediator(); //<- here i can work with my mediator
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Declaration variables for internal functions
  String name = "";
  String startDate = "";
  String endDate = "";
  bool isEnabled = false;
  bool isAlwaysAllowed = false;

  String errorMessage = "";
  Color colorMessage = Colors.red;

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
    _threadManager.startThread(aggiorna_tabella);
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
  void aggiunti_utente() {
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
      launch_allert(mediator.AddUser(name, start, end, isEnabled, isAlwaysAllowed), Colors.orange);
    }
  }

  // Function to remove a user
  void rimuovi_utente() {
    if (name.isEmpty) {
      launch_allert("A field is empty!", Colors.red);
    } else {
      launch_allert(mediator.RemoveUser(name), Colors.orange);
    }
  }

  // Function to enable a user
  void abilita_utente() {
    if (name.isEmpty) {
      launch_allert("A field is empty!", Colors.red);
    } else {
      launch_allert(mediator.EnableUser(name), Colors.orange);
    }
  }

  // Function to disable a user
  void disabilita_utente() {
    if (name.isEmpty) {
      launch_allert("A field is empty!", Colors.red);
    } else {
      launch_allert(mediator.DisableUser(name), Colors.orange);
    }
  }

  void salva_database() {
    launch_allert(mediator.SaveDatabase(), Colors.green);
  }

  Future<void> carica_database() async {
    launch_allert(await mediator.LoadDatabase(), Colors.green);
  }

  void aggiorna_tabella() {
    setState(() {
      // Update table data here
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
                      Text('Nome ->'),
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
                            hintText: 'Inserisci nome',
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
                  Text('Data Inizio -> '),
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
                  Text('Data Fine ->'),
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('È Abilitato? -> '),
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
                          value: this.isEnabled,
                          onChanged: (bool? newValue) {
                            setState(() {
                              if (this.isEnabled) {
                                this.isEnabled = false;
                              } else {
                                this.isEnabled = newValue!;
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
                  Text('È Abilitato Per Sempre? -> '),
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

  void startThread(Function aggiornaTabella) {
    if (_isRunning) return;
    _isRunning = true;
    _receivePort = ReceivePort();
    Isolate.spawn(_threadEntry, [_receivePort!.sendPort, aggiornaTabella]);
  }

  void stopThread() {
    if (!_isRunning) return;
    _isRunning = false;
    _isolate?.kill(priority: Isolate.immediate);
    _receivePort?.close();
  }

  static void _threadEntry(List<dynamic> args) async {
    SendPort sendPort = args[0];
    Function aggiornaTabella = args[1];

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

      aggiornaTabella(); // Call aggiorna_tabella before delay

      await Future.delayed(Duration(seconds: 86400)); // delay for operations
    }
    print('Thread stopped.');
  }
}