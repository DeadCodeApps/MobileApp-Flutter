import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<String?> attemptLogIn(String username, String password) async {
    var res = await http.patch(
        Uri.parse("https://freelance-world.herokuapp.com/api/login"),
        body: {"username": username, "password": password});
    if (res.statusCode == 200) return res.body;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FreelanceWorld"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(onPressed: onPressed, child: const Text("Log in")),
            ElevatedButton(onPressed: onPressed, child: const Text("Sign up"))
          ],
        ),
      ),
    );
  }

  onPressed() async {
    var username = _usernameController.text;
    var password = _passwordController.text;

    var jwt = await attemptLogIn(username, password);
    if (jwt != null) {
      //storage.write(key: "jwt", value: jwt);
      //Navigator.push(
      //  context,
      //  MaterialPageRoute(
      //  )
      //);
    } else {
      print("didn't work");
    }
  }
}
