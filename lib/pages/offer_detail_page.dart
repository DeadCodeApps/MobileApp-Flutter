import 'dart:html';

import 'package:flutter/material.dart';

import 'package:stateful_widget/classes/offer.dart';
import 'package:stateful_widget/widgets/offer_detailed.dart';

class OfferDetail extends StatelessWidget {
  final Offer offer;
  const OfferDetail({required this.offer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offer Details'),
        actions: [],
        backgroundColor: Colors.deepPurple,
      ),
      body: OfferDetailed(offer: offer),
    );
  }
}
