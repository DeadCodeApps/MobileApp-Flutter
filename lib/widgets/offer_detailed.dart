import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:math';

import 'package:stateful_widget/classes/offer.dart';
import 'package:stateful_widget/pages/postulation_steps.dart';

class OfferDetailed extends StatelessWidget {
  final Offer offer;
  const OfferDetailed({required this.offer});

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
          mainAxisSize: MainAxisSize.min, // size
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                utf8.decode(offer.title.toString().runes.toList()),
                style:
                    const TextStyle(fontSize: 20.0, color: Colors.deepPurple),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Especialidad: " +
                    utf8.decode(offer.specialty.name.toString().runes.toList()),
                style: const TextStyle(fontSize: 20.0, color: Colors.black87),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Flexible(
                      child: Text("Detalles del aviso",
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.black87)))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(offer.description,
                        style: const TextStyle(
                            fontSize: 17.0, color: Colors.black54)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: PopUpConfirmation(offer: offer),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopUpConfirmation extends StatelessWidget {
  final Offer offer;
  const PopUpConfirmation({required this.offer});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('¿Proceder al proceso de postulación?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PostulationSteps(offer: offer)));
                    },
                    child: const Text('Aceptar'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancelar'),
                  ),
                ],
              ),
            ),
        child: const Text(
          'POSTULARME',
          style: TextStyle(fontSize: 17.0),
        ),
        style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.blue)))));
  }
}
