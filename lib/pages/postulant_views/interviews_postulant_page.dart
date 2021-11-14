// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:stateful_widget/pages/menu_page.dart';

class InterviewsPostulantPage extends StatefulWidget {
  @override
  _InterviewsPostulantPageState createState() =>
      _InterviewsPostulantPageState();
}

class _InterviewsPostulantPageState extends State<InterviewsPostulantPage> {
  @override
  initState() {
    super.initState();
  }

  var day = 19;
  var month = 12;
  var year = 2019;
  var title = 'Desarrollador Backend Jr';
  var time = '8:00 - 9:00';
  var status = 'A tiempo';

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
        backgroundColor: Colors.blue,
      ),
      drawer: MenuPage(),
      body: GestureDetector(
        // Hide keyboard
        onTap: () {
          FocusScope.of(context).unfocus();
          TextEditingController().clear();
        },
        child: ListView(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10),
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
                    //------------ POSTULATIONS
                    Padding(
                      padding: const EdgeInsets.all(10.0),
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
                          // Offers Column
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '$title',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                Color.fromRGBO(81, 171, 216, 1),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('$time'),
                                          Text('$status',
                                              style: TextStyle(
                                                  color: Colors.green[600]))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
            //Date picker
            Padding(
              padding: const EdgeInsets.all(10),
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
                  children: [
                    //Date
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                              labelText: 'Fecha',
                              hintStyle: const TextStyle(fontSize: 10),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                    ),
                    //Hour Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 150,
                          child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Hora Inicio',
                                  hintStyle: const TextStyle(fontSize: 10),
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                        ),
                        SizedBox(
                          width: 150,
                          child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Hora Fin',
                                  hintStyle: const TextStyle(fontSize: 10),
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                        ),
                      ],
                    ),
                    //Asign Postulant
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Asignar postulantes',
                              hintStyle: const TextStyle(fontSize: 10),
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
