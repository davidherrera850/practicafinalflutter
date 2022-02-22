import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicación',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _paginaActual = 0;

  final List<Widget> _paginas = [Pag01(), Pag02(), Pag03()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Final"),
        backgroundColor: Colors.red,
      ),
      body: _paginas[_paginaActual],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _paginaActual = index;
          setState(() {
            _paginaActual = index;
          });
        },
        currentIndex: _paginaActual,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Presentacion"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), label: "Calendario"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Informacion"),
        ],
      ),
    );
  }
}

class Pag01 extends StatelessWidget {
  const Pag01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body:
      Center(
        child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    child:  Text("App calendario",style: TextStyle(
                          color: Colors.blue,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),),
                  ),
                ),
              ),
              Center(
                child: Container(
                  child:  Text("+",style: TextStyle(
                        color: Colors.blue,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    child:  Text("Login/Datatable",style: TextStyle(
                          color: Colors.blue,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),),
                  ),
                ),
              ),
              
              Container(
                child:  Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Image.network('https://avatars.githubusercontent.com/u/109951?s=400&v=4',),
                ),           
              ),
            ]
          ),
      ),
    );
  }
}

class Pag02 extends StatelessWidget {
  const Pag02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(
        view: CalendarView.month,
        firstDayOfWeek: 6,
        //initialDisplayDate: DateTime(2021, 03, 01, 08, 30),
        //initialSelectedDate: DateTime(2021, 03, 01, 08, 30),
        dataSource: MeetingDataSource(getAppointments()),
      ),
    );
  }
}
List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Ver partido',
      color: Colors.blue,
      recurrenceRule: 'FREQ=DAILY;COUNT=1',
      isAllDay: true));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

class Pag03 extends StatelessWidget {
  const Pag03({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicación',
      initialRoute: "/",
      routes: {
        '/': (context) => const FirstScreen(),
        '/second': (context) => const SecondScreen(),
      },
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late String user, password;
  TextEditingController controladorUser = TextEditingController();
  TextEditingController controladorPasswd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: 
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 250.0,
                  child: TextField(
                    controller: controladorUser,
                    autofocus: true,
                    keyboardType: TextInputType.text, // icono del botón
                    autocorrect: true,
                    textAlign: TextAlign.left,
                    maxLength: 20,
                    obscureText: false, // passowrd
                    style: TextStyle(color: Colors.black),

                    decoration: InputDecoration(
                      hintText: "Usuario",
                      hintStyle: TextStyle(color: Colors.red),
                      helperText: "Introducir usuario",
                    ),
                  ),
                ),
                Container(
                  width: 250.0,
                  child: TextField(
                    controller: controladorPasswd,
                    keyboardType: TextInputType.text, // icono del botón
                    autocorrect: true,
                    textAlign: TextAlign.left,
                    maxLength: 20,
                    obscureText: true, // passowrd
                    style: TextStyle(color: Colors.black),

                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.red),
                      helperText: "Introducir password",
                    ),
                  ),
                ),
                Container(
                  width: 250,
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (controladorUser.text == "fcbarcelona" &&
                        controladorPasswd.text == "cule10") {
                      Navigator.pushNamed(context, '/second', arguments: {
                        "usuario": controladorUser.text,
                        "password": controladorPasswd.text
                      });
                    }
                  },
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),  
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    Map? parametros = ModalRoute.of(context)?.settings.arguments as Map?;

    String usuario = parametros!["usuario"];

    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Padding(
        padding: const EdgeInsets.only(top:30.0),
        child: Center(
          child: Column(
            children: [
              Text("Pagina informacion titulos FC BARCELONA",style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),),
                DataTable(
                  sortColumnIndex: 2,
                  sortAscending: false,
                  columns: [
                    DataColumn(label: Text("Nombre titulo")),
                    DataColumn(label: Text("Total")),
                    DataColumn(label: Text("Ganado"), numeric: true),
                  ],
                  rows: [
                    DataRow(
                      selected: false,
                      cells: [
                      DataCell(Text("Liga"), showEditIcon: true),
                      DataCell(Text("26")),
                      DataCell(Text("2018-2019"))
                    ]),
                    DataRow(cells: [
                      DataCell(Text("Copa")),
                      DataCell(Text("31")),
                      DataCell(Text("2020-2021"))
                    ]),
                    DataRow(cells: [
                      DataCell(Text("Champions")),
                      DataCell(Text("5")),
                      DataCell(Text("2014-2015"))
                    ]),
                    DataRow(cells: [
                      DataCell(Text("SuperCopa de Europa")),
                      DataCell(Text("5")),
                      DataCell(Text("2015-2016"))
                    ]),
                    DataRow(cells: [
                      DataCell(Text("SuperCopa de España")),
                      DataCell(Text("13")),
                      DataCell(Text("2018-2019"))
                    ]),
                    DataRow(cells: [
                      DataCell(Text("Mundial de Clubs")),
                      DataCell(Text("3")),
                      DataCell(Text("2015-2016"))
                    ]),
                  ],
                ),
                Container(
                  child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLQU2l_qo2wORkj3RqVLkyJ78DA-fuHvROUg&usqp=CAU',),
                ),           
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text("Salir"),
              )
                
            ],
          ),
          ),
         ),
    );
  }
}

