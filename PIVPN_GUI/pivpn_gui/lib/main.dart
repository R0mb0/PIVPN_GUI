import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Mediator.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const MyHomePage                                                                                                                                                                                                                                                                                  (title: 'PIVPN_GUI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  Mediator mediator = new Mediator(); //<- here i can work with my mediator 
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Declaration varaibles for internal functions
  String name ="";
  String startDate = "";
  String endDate = "";
  bool isDisabled = false;
  bool isAlwaysAllowed = false;

  String errorMessage = "";
  Color colorMessage = Colors.red;

  // targhet field to write on table
  List<DataRow> tableData = [DataRow(cells: [DataCell(Text("")), DataCell(Text("")), DataCell(Text("")), DataCell(Text("")), DataCell(Text(""))])];

  // Function to launch an allert
  void launch_allert(String error, Color colore)
  {
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

  // Function to add an user 
  void aggiunti_utente()
  {
    if(name.isEmpty || startDate.isEmpty || endDate.isEmpty)
    {
      launch_allert("A field is empty!", Colors.red);
    }else{
      mediator.AddUser(name, DateTime.parse(startDate), DateTime.parse(endDate), isDisabled, isAlwaysAllowed);
      aggiorna_tabella();
    }

  }

  // Function to remove an user
  void rimuovi_utente()
  {
    if(name.isEmpty)
    {
      launch_allert("A field is empty!", Colors.red);
    }else{
      mediator.RemoveUser(name);
      aggiorna_tabella();
    }
  }

  // Function to enable an user 
  void abilita_utente()
  {
    if(name.isEmpty)
    {
      launch_allert("A field is empty!", Colors.red);
    }else{
      mediator.EnableUser(name);
      aggiorna_tabella();
    }
  }

  // Function to disable an user 
  void disabilita_utente()
  {
    if(name.isEmpty)
    {
      launch_allert("A field is empty!", Colors.red);
    }else{
      mediator.DisableUser(name);
      aggiorna_tabella();
    }
  }

  void salva_database()
  {
    launch_allert(mediator.SaveDatabase(), Colors.green);
  }

  Future<void> carica_database()
  async {
    
    launch_allert(await mediator.LoadDatabase(), Colors.green);
    aggiorna_tabella();
  }

  void aggiorna_tabella()
  {
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
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Nome ->',
                          ),
                        ],
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 200,
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            onChanged: (value) {
                                //print("The value entered is : $value");
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
                            cursorColor:Colors.black38,
                          ),
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
                  Text(
                    'Data Inizio -> ',
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
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            onChanged: (value) {
                              //print("The value entered is : $value");
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
                  Text(
                    'Data Fine ->',
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
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            onChanged: (value) {
                              //print("The value entered is : $value");
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
                            cursorColor: Colors.black38
                          ),
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
                      Text(
                        'È Abilitato? -> ',
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          unselectedWidgetColor: Colors.white30,
                        ),
                        child: Checkbox(
                          tristate: true, // Example with tristate
                        value: this.isDisabled,
                        onChanged: (bool? newValue) {
                          setState(() {
                            if(this.isDisabled)
                            {
                              this.isDisabled = false;
                            } else{
                              this.isDisabled = newValue!;
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
                  Text(
                    'È Abilitato Per Sempre? -> ',
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
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          unselectedWidgetColor: Colors.white30,
                        ),
                        child: Checkbox(
                          tristate: true, // Example with tristate
                        value:  this.isAlwaysAllowed,
                        onChanged: (bool? newValue) {
                          setState(() {
                            if (this.isAlwaysAllowed)
                            {
                              this.isAlwaysAllowed = false;
                            }else{
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
                  TextButton( // <-------------------- Pulsante Aggiungi utente
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                    ),
                    onPressed: () {
                      aggiunti_utente();
                    },
                    child: Text('AGGIUNGI UTENTE'),
                    
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  TextButton( // <-------------------- Pulsante Rimuovi Utente
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                    ),
                    onPressed: () {
                      rimuovi_utente();
                    },
                    child: Text('RIMUOVI UTENTE'),
                    
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  TextButton( // <-------------------- Pulsante Abilita Utente
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                    ),
                    onPressed: () {
                      abilita_utente();
                    },
                    child: Text('ABILITA UTENTE'),
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  TextButton( // <-------------------- Pulsante Disabilita utente
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                    ),
                    onPressed: () {
                      disabilita_utente();
                    },
                    child: Text('DISABILITA UTENTE'),
                    
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  TextButton( // <-------------------- Pulsante Salva database
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                    ),
                    onPressed: () {
                      salva_database();
                    },
                    child: Text('SALVA DATABASE'),
                    
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  TextButton( // <-------------------- Pulsante carica database
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                    ),
                    onPressed: () {
                      carica_database();
                    },
                    child: Text('CARICA DATABASE'),
                    
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
                child: DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Nome',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Data Inizio',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Data Fine',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'È Abilitato?',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'È Abilitato per sempre?', // <----------------------------------------
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: tableData
    )
              ),
            ],
          ),
        ),
      ),
    );
  }
}