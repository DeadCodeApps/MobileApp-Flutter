import 'package:flutter/material.dart';

class SendMessagePage extends StatefulWidget {
  @override
  _SendMessagePageState createState() => _SendMessagePageState();
}

class _SendMessagePageState extends State<SendMessagePage> {
  @override
  initState() {
    super.initState();
  }

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
              const SizedBox(height: 20),
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
                          'Mensaje a: Fuerza Libre',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Color.fromRGBO(81, 171, 216, 1),
                          ),
                        ),
                      ),
                      //------------ SUBTITLE
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          'Asunto: Desarrollador Backend Jr',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      //-------------   MESSAGE
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                            maxLines: 15,
                            decoration: InputDecoration(
                                labelText: 'Escriba un mensaje',
                                labelStyle: const TextStyle(
                                    color: Colors.black, fontSize: 15),
                                hintStyle: const TextStyle(fontSize: 20),
                                //fillColor: Colors.lightBlue,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                      ),
                      //--------------  ACCEPT
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          child: const Text(
                            'Aceptar',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                barrierDismissible:
                                    false, // N deja salir del alert sin aceptar
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Mensaje Enviado'),
                                    actions: [
                                      ElevatedButton(
                                        child: const Text('Aceptar'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  );
                                });
                          },
                        ),
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
