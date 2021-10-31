import 'package:stateful_widget/classes/offer.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class HttpHelper{

  Future<List<Offer>> fetchOffers() async {
    String urlString = 'https://freelance-world.herokuapp.com/api/freelancers';
    Uri url = Uri.parse(urlString);

    http.Response response = await http.get(url);
    print(response.body);
    if(response.statusCode == HttpStatus.ok){
      print(response.body);
    }
    return [];
  }
}