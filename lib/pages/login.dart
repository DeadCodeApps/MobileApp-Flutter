import 'package:flutter/material.dart';
import 'input_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  //StateFullWidget

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.lightBlueAccent,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomRight,
              heightFactor: 0.5,
              widthFactor: 0.5,
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(200.0)),
                color: const Color.fromRGBO(255, 255, 255, 0.4),
                child: Container(
                  width: 400,
                  height: 400,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 400,
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Material(
                        elevation: 10.0,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "images/FreelanceWorldlogo.png",
                            width: 200,
                            height: 200,
                          ),
                        )),
                    Form(
                      child: InputField(
                          //Calling inputField  class

                          const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          "Correo"),
                    ),
                    Form(
                      child: InputField(
                          const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          "Contraseña"),
                    ),
                    Container(
                      width: 150,
                      child: ElevatedButton(
                        //Raised Button
                        onPressed: () {
                          ;
                        },
                        child: const Text(
                          "Ingresar",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
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
