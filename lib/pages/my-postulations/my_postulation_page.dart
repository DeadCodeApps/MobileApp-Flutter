import 'package:flutter/material.dart';

class MyPostulationPage extends StatefulWidget {
  @override
  _MyPostulationPageState createState() => _MyPostulationPageState();
}

class _MyPostulationPageState extends State<MyPostulationPage> {
  @override
  initState() {
    super.initState();
  }

  var day = 19;
  var month = 12;
  var year = 2019;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            "assets/logo.png",
            height: 100.0,
            width: 50.0,
          ),
          centerTitle: true,
          leading: IconButton(
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          backgroundColor: Colors.blue,
        ),
        body: GestureDetector(
          // Hide keyboard
          onTap: () {
            FocusScope.of(context).unfocus();
            new TextEditingController().clear();
          },

          child: ListView(
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          offset: Offset(0, 5))
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //------------ TITLE
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Entrevistas pendientes',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color.fromRGBO(81, 171, 216, 1),
                          ),
                        ),
                      ),
                      //------------ DATE
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          '$day de $month del $year',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      //-------------   POSTULATIONS
                      Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  offset: Offset(0, 5))
                            ],
                          ),
                          // first Offer
                          child: Column(
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(5),
                                  child: const Text('Desarrollador Fronted JS',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Color.fromRGBO(81, 171, 216, 1),
                                      ))),
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: const Text(
                                  'Hora: 8:00 pm - 9:00 pm',
                                  style: TextStyle(fontSize: 8),
                                ),
                              )
                            ],
                          )),

                      //--------------  DATE PICKER
                      const SizedBox(height: 40),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                                labelText: 'Fecha',
                                hintStyle: const TextStyle(fontSize: 10),
                                //fillColor: Colors.lightBlue,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                            decoration: InputDecoration(
                                labelText: 'Hora Inicio',
                                hintStyle: const TextStyle(fontSize: 10),
                                //fillColor: Colors.lightBlue,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                            decoration: InputDecoration(
                                labelText: 'Hora Fin',
                                hintStyle: const TextStyle(fontSize: 10),
                                //fillColor: Colors.lightBlue,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                            decoration: InputDecoration(
                                labelText: 'Asignar postulantes',
                                hintStyle: const TextStyle(fontSize: 10),
                                //fillColor: Colors.lightBlue,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
