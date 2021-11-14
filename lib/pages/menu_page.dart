import 'package:flutter/material.dart';

//Vars
var name = "Keiko";
var email = "SoyInocente@gmail.com";
var image_profile = "assets/image_profile.png";

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            accountName: Text('$name'),
            accountEmail: Text('$email'),
            currentAccountPicture: Image.asset('$image_profile'),
          ),
          ListTile(
            title: Text('Inicio'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/home');
              //
            },
          ),
          ListTile(
            title: Text('Postular'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '');
              //
            },
          ),
          ListTile(
            title: Text('Mis Postulaciones'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/my_postulations');
              //
            },
          ),
          ListTile(
            title: Text('Entrevistas'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/interviews_postulant');
              //
            },
          ),
          ListTile(
            title: Text('Mi Cuenta'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '');
              //
            },
          ),
          ListTile(
            title: Text('Configuracion'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '');
              //
            },
          ),
          ListTile(
            title: Text('Cerrar sesión'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '');
              //
            },
          ),
        ],
      ),
    );
  }
}
