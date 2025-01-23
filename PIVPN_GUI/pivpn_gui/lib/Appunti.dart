import 'package:flutter/material.dart';
import 'Mediator.dart';

class _MyHomePageState extends State<MyHomePage> {
  
  Mediator mediator = new Mediator(); //<- here i can work with my mediator 

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.

      
    );
  }
}




body: Center(
        child: Row(
          children: [
            Column(
              children: [

                DataTable(
                  columns: [
                      DataColumn(label: Text('Nome')), 
                      DataColumn(label: Text('Cognome')),
                      DataColumn(label: Text('Data inizio')),
                      DataColumn(label: Text('Data fine')),
                      DataColumn(label: Text('Abilitato?')),
                      DataColumn(label: Text('Sempre abilitato?')),
                  ], 
                  rows: [

                  ]
                  ),
                  Row(
                    children: [
                      Text('Nome: '),
                      TextField(
                          decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter a search term',
                        ),
                      ),
                    ],
                    
                  ),
              ],
            ),
            Column(
              children: <Widget>[

                OutlinedButton(
                  onPressed: () {},
                  child: Text('Aggiungi Utente'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Rimuovi Utente'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Abilita Utente'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Disabilita Utente'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Salva Database'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Carica Database'),
                ),
              ],
            ),
          ],
        ),
      ),
      
    );
  }
}



children: [
                      const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      ),
                      Text('Nome: '),
                      TextField(
                          decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter a search term',
                        ),
                      ),
                    ],



@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Center(
        child: Row(
          children: [
            Column(
              children: [

                DataTable(
                  columns: [
                      DataColumn(label: Text('Nome')), 
                      DataColumn(label: Text('Cognome')),
                      DataColumn(label: Text('Data inizio')),
                      DataColumn(label: Text('Data fine')),
                      DataColumn(label: Text('Abilitato?')),
                      DataColumn(label: Text('Sempre abilitato?')),
                  ], 
                  rows: [

                  ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter a search term',
                            ),
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter your username',
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            Column(
              children: <Widget>[

                OutlinedButton(
                  onPressed: () {},
                  child: Text('Aggiungi Utente'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Rimuovi Utente'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Abilita Utente'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Disabilita Utente'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Salva Database'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Carica Database'),
                ),
              ],
            ),
          ],
        ),
      ),
      
    );
  }


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

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'PIVPN',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
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
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
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
                            controller: _model.textController1,
                            focusNode: _model.textFieldFocusNode1,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'TextField',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
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
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textController1Validator
                                .asValidator(context),
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Cognome -> ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 200,
                        child: Container(
                          width: 200,
                          child: TextFormField(
                            controller: _model.textController2,
                            focusNode: _model.textFieldFocusNode2,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'TextField',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
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
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textController2Validator
                                .asValidator(context),
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
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
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
                            controller: _model.textController3,
                            focusNode: _model.textFieldFocusNode3,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'TextField',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
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
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textController3Validator
                                .asValidator(context),
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
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
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
                            controller: _model.textController4,
                            focusNode: _model.textFieldFocusNode4,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'TextField',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
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
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textController4Validator
                                .asValidator(context),
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
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
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
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue1 ??= true,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.checkboxValue1 = newValue!);
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
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
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
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
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue2 ??= true,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.checkboxValue2 = newValue!);
                          },
                          side: BorderSide(
                            width: 2,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor: FlutterFlowTheme.of(context).info,
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
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Aggiungi Utente',
                    options: FFButtonOptions(
                      height: 40,
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Rimuovi Utente',
                    options: FFButtonOptions(
                      height: 40,
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Abilita Utente',
                    options: FFButtonOptions(
                      height: 40,
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Disabilita Utente',
                    options: FFButtonOptions(
                      height: 40,
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Salva Database',
                    options: FFButtonOptions(
                      height: 40,
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      thickness: 2,
                      color: Color(0x00E0E3E7),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Carica Database',
                    options: FFButtonOptions(
                      height: 40,
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0,
                      borderRadius: BorderRadius.circular(8),
                    ),
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
              Expanded(
                child: FlutterFlowDataTable<dynamic>(
                  controller: _model.paginatedDataTableController,
                  data: paginatedDataTableRecordList,
                  columnsBuilder: (onSortChanged) => [
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Text(
                          'Edit Header 1',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Text(
                          'Edit Header 2',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                    DataColumn2(
                      label: DefaultTextStyle.merge(
                        softWrap: true,
                        child: Text(
                          'Edit Header 3',
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ],
                  dataRowBuilder: (Item, paginatedDataTableIndex, selected,
                          onSelectChanged) =>
                      DataRow(
                    color: MaterialStateProperty.all(
                      paginatedDataTableIndex % 2 == 0
                          ? FlutterFlowTheme.of(context).secondaryBackground
                          : FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    cells: [
                      Text(
                        'Edit Column 1',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        'Edit Column 2',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                      Text(
                        'Edit Column 3',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].map((c) => DataCell(c)).toList(),
                  ),
                  paginated: true,
                  selectable: false,
                  hidePaginator: false,
                  showFirstLastButtons: false,
                  headingRowHeight: 56,
                  dataRowHeight: 48,
                  columnSpacing: 20,
                  headingRowColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: BorderRadius.circular(8),
                  addHorizontalDivider: true,
                  addTopAndBottomDivider: false,
                  hideDefaultHorizontalDivider: true,
                  horizontalDividerColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  horizontalDividerThickness: 1,
                  addVerticalDivider: false,
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}