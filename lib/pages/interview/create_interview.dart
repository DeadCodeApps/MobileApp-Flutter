// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stateful_widget/classes/freelancer.dart';

class CreateInterviewView extends StatefulWidget {
  CreateInterviewView({Key? key}) : super(key: key);

  @override
  State<CreateInterviewView> createState() => _CreateInterviewViewState();
}

class _CreateInterviewViewState extends State<CreateInterviewView> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController hourinputstart = TextEditingController();
  TextEditingController hourinputend = TextEditingController();

  String topic = "CREAR NUEVA ENTREVISTA";
  String dropdownValue = 'One';

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Confirmación de creación de entrevista"),
            content: Text(
                "Se seleccionaron 2 postulantes para las entrevistas de 7:00 am a 9:00 am ¿Es correcto?"),
            actions: [
              ElevatedButton(
                  onPressed: () {},
                  child: Text("Confirmar"),
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 15),
                      primary: Colors.blue[900])),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancelar"),
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 15),
                      primary: Colors.red[900])),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle stylebtn = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15), primary: Colors.blue[900]);

    return Scaffold(
      appBar: AppBar(title: Text("My APP")),
      body: Card(
          elevation: 10,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Text(topic,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold)),
                  ),
                  Divider(
                    thickness: 5,
                    color: Colors.blue[900],
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                    child: Container(
                      width: 300,
                      child: TextField(
                        controller: dateinput,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.calendar_today),
                            labelText: "Fecha"),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            setState(() {
                              dateinput.text = formattedDate;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
                    child: Container(
                      width: 350,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: TextField(
                              controller: hourinputstart,
                              readOnly: true,
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.alarm),
                                  border: OutlineInputBorder(),
                                  labelText: "Hora de inicio"),
                              onTap: () async {
                                TimeOfDay? result = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now());
                                if (result != null) {
                                  setState(() {
                                    hourinputstart.text =
                                        result.format(context);
                                  });
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: TextField(
                              controller: hourinputend,
                              readOnly: true,
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.alarm),
                                  border: OutlineInputBorder(),
                                  labelText: "Hora de fin"),
                              onTap: () async {
                                TimeOfDay? result = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now());
                                if (result != null) {
                                  setState(() {
                                    hourinputend.text = result.format(context);
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: SizedBox(
                      width: 300,
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 20,
                        elevation: 10,
                        style: TextStyle(color: Colors.black),
                        onChanged: (String? newVal) {
                          setState(() {
                            dropdownValue = newVal!;
                          });
                        },
                        items: <String>['One', 'Two', 'Three', 'Four']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: SizedBox(
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Link de Google Meet',
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {
                              createAlertDialog(context);
                            },
                            child: Text("Crear"),
                            style: stylebtn)),
                  )
                ],
              ),
              Container()
            ],
          )),
    );
  }
}
