import 'dart:convert';
import 'dart:html';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:stateful_widget/classes/offer.dart';
import 'package:stateful_widget/classes/token.dart';
import 'package:stateful_widget/classes/postulation.dart';
import 'package:stateful_widget/pages/offer_detail_page.dart';

class SuccessfulPostulation extends StatelessWidget {
  final Offer offer;
  final Postulation postulation;
  const SuccessfulPostulation({required this.offer, required this.postulation});

  Future<Postulation> postPostulation(Postulation auxPostulation) async {
    final String postUrl = "https://freelance-world.herokuapp.com/api/";
    final int freelancerId = 11;
    final int offerId = offer.id;

    var res = await http.patch(
      Uri.parse(postUrl + "login/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
          <String, dynamic>{'email': 'bill2@gmail.com', 'password': 'string'}),
    );

    final Token tokenObj = Token.fromJson(jsonDecode(res.body));
    final String token = tokenObj.token;

    String uri =
        postUrl + "freelancers/$freelancerId/offers/$offerId/postulations";

    var response = await http.post(
      Uri.parse(uri),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(<String, dynamic>{
        'desiredPayment': auxPostulation.desiredPayment,
        'description': auxPostulation.description
      }),
    );
    if (response.statusCode == 200) {
      return Postulation.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create freelancer.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: Colors.blue.shade900),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 5,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/successfulImage.png',
                    width: 450.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const SizedBox(height: 20),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      postPostulation(postulation);
                      //print(postulation.description);
                      //print(postulation.desiredPayment);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OfferDetail(offer: offer)));
                    },
                    child: Text('Salir'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const SizedBox(height: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
