import 'package:flutter/material.dart';

import 'package:stateful_widget/pages/postulant_views/interviews_postulant_page.dart';
import 'package:stateful_widget/pages/postulant_views/my_postulations_page.dart';
import 'package:stateful_widget/pages/postulant_views/send_message_page.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/my_postulations': (context) => MyPostulationPage(),
      '/interviews_postulant': (context) => InterviewsPostulantPage(),
      '/send_message': (context) => SendMessagePage(),
    },
    initialRoute: '/my_postulations',
  ));
}
