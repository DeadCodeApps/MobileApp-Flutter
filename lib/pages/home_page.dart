// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stateful_widget/classes/offer.dart';
import 'package:stateful_widget/env/local_environment.dart';
import 'package:stateful_widget/widgets/offer_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Offer> offers;

  List<Offer> parseOffers(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Offer>((json) => Offer.fromJson(json)).toList();
  }

  Future<List<Offer>> getOffers() async {
    final response =
        await http.get(Uri.parse("http://localhost:8080/api/offers"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return parseOffers(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load offers');
    }
  }

  @override
  initState() {
    super.initState();
    getOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FreelanceWorld'),
        actions: [],
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder<List<Offer>>(
        future: getOffers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? OfferList(
                  offers: snapshot.data ?? [],
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class OfferList extends StatelessWidget {
  final List<Offer> offers;
  const OfferList({required this.offers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: offers == null ? 0 : offers.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  //color: Colors.black,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: OfferCard(
                        offer: offers[i],
                      )),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
