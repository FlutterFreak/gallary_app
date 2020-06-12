import 'dart:convert';

import 'package:gallary_app/photoModel.dart';
import 'package:http/http.dart' as http;

const CLIENT_ID =
    "cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0";
const API_URL = "https://api.unsplash.com/photos/?client_id=";

Future<List<Photo>> getImages() async {
  final response = await http.get('$API_URL$CLIENT_ID',
      headers: {'Content-type': 'application/json', 'charset': 'utf-8'});
  print('response:$response');
  if (response.statusCode == 200) {
    dynamic data = jsonDecode(utf8.decode(response.bodyBytes));
    print('response:$data');
    var list = (data as List).map((item) => new Photo.fromJSON(item)).toList();
    print('list$list');
    return list;
  } else {
    throw Exception('Something went wrong !');
  }
}
