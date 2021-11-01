import 'dart:html';

import 'package:flutter/material.dart';

import 'package:stateful_widget/classes/offer.dart';
import 'package:stateful_widget/widgets/offer_detailed.dart';

class OfferDetail extends StatelessWidget {
  final Offer offer;
  const OfferDetail({required this.offer});

  @override
  Widget build(BuildContext context) {
    String topic = "DETALLES DE OFERTA DE TRABAJO";
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/logo.png", height: 100.0, width: 50.0),
        centerTitle: true,
        leading: IconButton(
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: OfferDetailed(offer: offer),
    );
  }
}
