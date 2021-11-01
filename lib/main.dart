// ignore_for_file: unnecessary_new, avoid_print

import 'package:flutter/material.dart';
import 'package:stateful_widget/pages/home_page.dart';
import 'package:stateful_widget/pages/register_freelancer.dart';

void main() {
  // ignore: unnecessary_new
  // ignore: prefer_const_constructors
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "FreelanceWorld",
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: RegisterFreelancerForm(),
  ));
}
