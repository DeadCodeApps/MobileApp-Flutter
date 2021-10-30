import 'dart:html';

import 'package:flutter/material.dart';

import 'package:stateful_widget/classes/offer.dart';
import 'package:stateful_widget/widgets/offer_detailed.dart';

class SuccessfulPostulation extends StatelessWidget {
  final Offer offer;
  const SuccessfulPostulation({required this.offer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: Colors.deepPurple),
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
                    'assets/images/successfulImage.png',
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OfferDetailed(offer: offer)));
                    },
                    child: const Text('Salir'),
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
