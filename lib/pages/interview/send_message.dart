// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}

class SendMessageView extends StatefulWidget {
  const SendMessageView({Key? key}) : super(key: key);

  @override
  _SendMessageViewState createState() => _SendMessageViewState();
}

class _SendMessageViewState extends State<SendMessageView> {
// ignore: prefer_final_fields
  static List<Animal> animals = [
    Animal(id: 1, name: "Juan Perez"),
    Animal(id: 2, name: "Oscar Valencia"),
  ];

  int info = 0;

  List<Animal> _selectedAnimals2 = [];

  final itemss = animals.map((e) => MultiSelectItem(e, e.name)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset("assets/logo.png", height: 100.0, width: 50.0),
      centerTitle: true,
      leading: IconButton(
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
      ),
      body: Card(
        elevation: 10,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: Row(
                          children: [
                            Text("Mensaje para: ", style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold),
                          )
                          ],
                          mainAxisAlignment: MainAxisAlignment.end,
                        ),
                      ),

                      SizedBox(
                        height: 50,
                      ),

                      SizedBox(
                        width: 200,
                        height: 50,
                        child: Row(
                          children: [
                            Text("Asunto: ", style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold),
                              ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.end,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: Row(
                          children: [
                            SizedBox(
                            width: 200,
                            child: MultiSelectDialogField(
                              initialValue: _selectedAnimals2,
                              items: itemss,
                              title: Text("Asignar postulantes"),
                              onConfirm: (values) {
                                setState(() {
                                  //_selectedAnimals2 = values.cast<Animal>().toList();
                                  info = values.length;
                                });
                              },
                              selectedColor: Colors.blue[900],
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4)),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          )
                          ],
                        ),
                      ),

                      SizedBox(
                        width: 250,
                        height: 50,
                        child: Row(
                          children: [
                            Text('$info postulantes seleccionados'),
                          ],
                        ),
                      ),
                      Container(
                        width: 250,
                        height: 50,
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            SizedBox(
                              width: 200,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                ),
                              )
                          ],
                        ),
                      )
                    ],
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    width: 400,
                    height: 300,
                    child: TextField(
                      expands: true,
                      maxLines: null,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Hola, me es grato dirigirme a ustedes..."
                      ),
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),

            Container(
                    width: 200,
                    height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {}, 
                      child: Text("Enviar"),
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 15), 
                        primary: Colors.blue[900]),
                      ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            )
            
            
          ],
        ),
      ),
    );
  }
}
