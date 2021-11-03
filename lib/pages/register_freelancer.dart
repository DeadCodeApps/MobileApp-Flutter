import 'package:flutter/material.dart';
import 'package:stateful_widget/classes/freelancer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterFreelancerForm extends StatefulWidget {
  const RegisterFreelancerForm({Key? key}) : super(key: key);

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterFreelancerForm> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final birthdateController = DateRangePickerController();
  final phoneController = TextEditingController();
  final descriptionController = TextEditingController();
  final professionController = TextEditingController();

  Future<Freelancer> postFreelancer(Freelancer auxFreelancer) async {
    final response = await http.post(
      Uri.parse('https://freelance-world.herokuapp.com/api/freelancers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'username': auxFreelancer.username,
        'email': auxFreelancer.email,
        'password': auxFreelancer.password,
        'firstname': auxFreelancer.firstname,
        'lastname': auxFreelancer.lastname,
        'birthDate': auxFreelancer.birthDate,
        'phone': auxFreelancer.phone,
        'description': auxFreelancer.description,
        'profession': auxFreelancer.profession
      }),
    );

    if (response.statusCode == 200) {
      return Freelancer.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create freelancer.');
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FreelanceWorld"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListView(children: [
              Text(
                "Registrarse como freelancer",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                    fontSize: 20),
              ),
              Divider(
                color: Colors.blue[800],
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Correo"),
              ),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: "Username"),
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: "Contraseña"),
              ),
              TextFormField(
                controller: firstnameController,
                decoration: const InputDecoration(labelText: "Nombres"),
              ),
              TextFormField(
                controller: lastnameController,
                decoration: const InputDecoration(labelText: "Apellidos"),
              ),
              SfDateRangePicker(
                controller: birthdateController,
                view: DateRangePickerView.month,
                selectionMode: DateRangePickerSelectionMode.single,
              ),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: "Número"),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: "Descripción"),
              ),
              TextFormField(
                controller: professionController,
                decoration: const InputDecoration(labelText: "Profesion"),
              ),
              ElevatedButton(
                child: const Text("Registrar"),
                onPressed: () {
                  Freelancer freelancer = Freelancer(
                      email: emailController.text,
                      username: usernameController.text,
                      password: passwordController.text,
                      firstname: firstnameController.text,
                      lastname: lastnameController.text,
                      birthDate:
                          birthdateController.selectedDate!.toIso8601String(),
                      profession: professionController.text,
                      description: descriptionController.text,
                      phone: phoneController.text);
                  postFreelancer(freelancer);
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}