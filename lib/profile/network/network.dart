import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

/// Printing the token.
String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiYWRtaW4xMjMiLCJlbWFpbCI6ImFkbWluMTIzQGdtYWlsLmNvbSIsIl9pZCI6IjYzY2JlYjM3NGFlNTVlNTY4MTgzNGQ3YiIsImlhdCI6MTY3NjY0OTIzMiwiZXhwIjoxNjc2NzM1NjMyfQ.fjGvIrqbgvBLlGabOSkwp_P1_W4xHyQwI5V1l6BXNwE";

class ApiClient {
  static var dio = Dio();

  static postFunction(
    Uri url,
    var body,
  ) async {
    print(url.toString());

    var response = await http.post(url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(body));

    print("Receiveing response");
    print("Response code: ${response.statusCode}");
    // print(jsonDecode(response.body)['token']);
    token = jsonDecode(response.body)['token'];
    // print(token);
  }

  static Future<void> uploadFile(List<int> file, String fileName, String name, String price, String desc,
      String category) async {

    print("Tokent is $token");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '$token'
    };

    FormData formData = FormData.fromMap({
      "name": name,
      "price": price,
      "description": desc,
      "category": category,
      "imgUrl": MultipartFile.fromBytes(
        file,
        filename: "fileName.jpeg",
        contentType: MediaType("image", "jpeg"),
      )
    });

    var url = Uri.parse("https://dress-up.azurewebsites.net/admin/products");

    try {
      var response = await dio.post(url.toString(),
          data: formData,
          options: Options(
            validateStatus: (_) => true,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
            headers: {
              "accept": "/*",
              "Authorization": "Bearer $token",
              "Content-Type": "multipart/form-data"
            },
          ));
      print(response.toString());
    } catch (e) {
      print(e.toString());
    }
    // print(response.data.toString());
    // return response.data.toString();
  }



  static Future<void> editProduct(List<int> file, String fileName, String name, String price, String desc,
      String category, String id) async {


    print("Tokent is $token");

    log(id);
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '$token'
    };

    FormData formData = FormData.fromMap({
      "id": id,
      "name": name,
      "price": price,
      "description": desc,
      "category": category,
      "imgUrl": MultipartFile.fromBytes(
        file,
        filename: "fileName.jpeg",
        contentType: MediaType("image", "jpeg"),
      )
    });

    var url = Uri.parse("https://dress-up.azurewebsites.net/admin/products/id");

    try {
      var response = await dio.put(url.toString(),
          data: formData,
          options: Options(
            validateStatus: (_) => true,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
            headers: {
              "accept": "/*",
              "Authorization": "Bearer $token",
              "Content-Type": "multipart/form-data"
            },
          ));
      print(response.toString());
    } catch (e) {
      print(e.toString());
    }
    // print(response.data.toString());
    // return response.data.toString();
  }
}
