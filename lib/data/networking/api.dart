import 'dart:convert';

import 'package:pruebaTest/app/app_constants.dart';

import 'package:http/http.dart' as http;


class API {
  API();



  String uidUser = "";




  static const String GET_POSTS = "/api/character/";

  static const String RESTAURANT_URL = "https://api.geoapify.com/v2/places?categories=catering.restaurant&filter=rect%3A10.716463143326969%2C48.755151258420966%2C10.835314015356737%2C48.680903341613316&limit=20&apiKey=2be91b4f93794efabff119b675fc9aa3";


 Future<MyHttpResponse> getRestaurant() async {
    var url = Uri.parse(RESTAURANT_URL);
    print(url.toString());
    MyHttpResponse response = await getRequest(url);
   try {
     if (response.statusCode == 200) {
       response.message = "exito";

     } else {
       response.message = "Error";
       response.data = null;
     }
   }catch(e){
     response.message = e.toString();
     response.data = null;
   }
    return response;
  }
 








}

Future<MyHttpResponse> getRequest(Uri uri) async {
  var response = await http.get(uri);

  print(response.body);

  var data = json.decode(utf8.decode(response.bodyBytes));

  return MyHttpResponse(response.statusCode, response.body);
}

class MyHttpResponse {
  int statusCode;
  String message;
  dynamic data;

  MyHttpResponse(this.statusCode, this.data, {this.message});

  @override
  String toString() {
    return 'MyHttpResponse{statusCode: $statusCode, message: $message, data: $data}';
  }
}
