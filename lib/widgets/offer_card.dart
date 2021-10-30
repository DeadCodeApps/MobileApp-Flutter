import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:math';

import 'package:stateful_widget/classes/offer.dart';
import 'package:stateful_widget/pages/offer_detail_page.dart';

class OfferCard extends StatelessWidget {
  final Offer offer;
  const OfferCard({required this.offer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min, // add this
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    child: Flexible(
                      child: Text(
                        utf8.decode(offer.title.toString().runes.toList()),
                        style: const TextStyle(
                            fontSize: 20.0, color: Colors.deepPurple),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      "Especialidad: " +
                          utf8.decode(
                              offer.specialty.name.toString().runes.toList()),
                      style: const TextStyle(
                          fontSize: 20.0, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                        utf8.decode(
                            offer.description.toString().runes.toList()),
                        style: const TextStyle(
                            fontSize: 17.0, color: Colors.black54),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 7,
                    child: Text(
                      "Presupuesto: " +
                          "S/" +
                          utf8.decode(
                              offer.paymentAmount.toString().runes.toList()),
                      style: TextStyle(
                          fontSize: 20.0, color: Colors.green.shade600),
                    ),
                  ),
                  Flexible(
                      flex: 3,
                      child: ElevatedButton(
                        child: const Text(
                          "Ver más",
                          textAlign: TextAlign.end,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      OfferDetail(offer: offer)));
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurple),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
