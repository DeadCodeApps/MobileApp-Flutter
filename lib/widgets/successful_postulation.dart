import 'dart:convert';
import 'dart:html';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:stateful_widget/classes/offer.dart';
import 'package:stateful_widget/classes/postulation.dart';
import 'package:stateful_widget/pages/offer_detail_page.dart';

class SuccessfulPostulation extends StatelessWidget {
  final Offer offer;
  final Postulation postulation;
  const SuccessfulPostulation({required this.offer, required this.postulation});

  Future<Postulation> postPostulation(Postulation auxPostulation) async {
    final String postUrl = "http://localhost:8080/api​/freelancers​";
    final int freelancerId = 3;
    final int offerId = 4;

    final String token =
        "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNjM1ODA4NzI5LCJleHAiOjE2MzU4MTczNjl9.BDai0fDoDHX-oc_wnGG08I7GM_uLmnW5JHkfrgOkbu34n12z24-pWyIvYMQzU-AM7IbIpmwkg5NvpciQ6n8ZqA";

    var urlToPost = Uri.parse(Uri.encodeFull(
        '$postUrl/$freelancerId​/offers​/$offerId/postulations'));
    final response = await http.post(
      urlToPost,
      headers: {
        HttpHeaders.authorizationHeader: "token $token",
        HttpHeaders.contentTypeHeader: "application/json"
      },
      body: jsonEncode(<String, dynamic>{
        'desiredPayment': auxPostulation.desiredPayment,
        'description': auxPostulation.description
      }),
    );
    if (response.statusCode == 200) {
      return Postulation.fromJson(json.decode(response.body));
      //return jsonDecode(response.body).cast<Map<String, dynamic>>();
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
                      //postPostulation(postulation);
                      print(postulation.description);
                      print(postulation.desiredPayment);
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
