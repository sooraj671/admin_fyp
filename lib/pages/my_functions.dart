import 'dart:convert';
// import 'package:dart_application_1/token.dart';
// import 'package:dart_application_1/Tailor.dart';
// import 'package:dart_application_1/jazzcash.dart';
// import 'package:dart_application_1/products.dart';
import 'AddProduct.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'token.dart';
import 'dart:io';
import 'endpoints.dart';
import 'dart:developer';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
// import '../test/Network.dart';
// import '../test/admin.dart';
// import '../test/api_services.dart';
// import '../test/image.dart';

Dio dio = Dio();

postFunction(
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
  print(jsonDecode(response.body)['token']);
  token = jsonDecode(response.body)['token'];
  print(token);
}

postFunctionToken(
  Uri url,
  var body,
  String token,
) async {
  print(url.toString());

  var response = await http.post(url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(body));

  print("Receiveing response");
  print("Response code: ${response.statusCode}");
  print(jsonDecode(response.body));
}

getFunctionToken(
  Uri url,
  String token,
) async {
  print(url.toString());

  var response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  });

  print("Receiveing response");
  print("Response code: ${response.statusCode}");
  print(response.body);
}

// uploadProduct() async {
//   var request = http.MultipartRequest('POST', Uri.parse('https://.....com'));
//   request.headers.addAll(headers);
//   request.files.add(http.MultipartFile.fromBytes(
//       'image', await ConvertFileToCast(_fileBytes),
//       filename: fileName, contentType: MediaType('*', '*')));
//   request.fields.addAll(fields);
//   var response = await request.send();
// }

ConvertFileToCast(data) {
  List<int> list = data.cast();
  return list;
}

uploadPhoto(List<int> bytes, String name) async {
  String extension = name.split(".").last;
  Uri uri = Uri.parse(baseURL + admin + get_all_products);

  var formData = FormData.fromMap({
    "file": MultipartFile.fromBytes(
      bytes,
      filename: name,
      contentType: MediaType("File", extension),
    ),
  });

  var response = await http.post(uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(formData));

  print("test response");
  print(response.toString());
}

Future<void> anotherRequest() async {
  print('herererere');
  final Uri tailorLoginURL = Uri.parse(baseURL + admin + get_all_products);

  try {
    FormData formData = new FormData.fromMap({
      "name": "abc",
      "price": 1000,
      "description": "this shawl is used throughout pakistan in winter",
      "category": "common",
      "imgUrl": http.MultipartFile.fromBytes(
          'image', await ConvertFileToCast(bytes),
          filename: 'fileName', contentType: MediaType('*', '*'))
    });
    // FormData.fromMap

    Response response = await dio.post(tailorLoginURL.toString(),
        data: formData,
        options: Options(
          headers: {
            "accept": "/*",
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data"
          },
        ));
    print('before response');

    // print(response);
    print(response.toString());
    print('after response');

    if (response.data != null) {
      print(' response data');
    } // Options
  } catch (ex) {
    print(ex.toString());
  }
  // if (response.data != null) {
  //   return true;
  // } // Options
}

// Future<bool> createService(String name, String price, String description,
//     String serviceType, String path, String delivery_days) async {
//   File file = File(path);

//   int amount = int.parse(price);
//   final Uri tailorLoginURL = Uri.parse(baseURL + tailor + service);

//   try {
//     String filename = path.split('/').last;

//     String filepath = file.path;

//     FormData formData = new FormData.fromMap({
//       "name": "$name",
//       "description": "$description",
//       "price": "$amount",
//       "city": "$tailr_city",
//       "serviceType": "$serviceType",
//       "expectedDelivery": "$delivery_days",
//       "imgUrl": await MultipartFile.fromFile(filepath)
//     }); // FormData.fromMap

//     Response response = await dio.post(tailorLoginURL.toString(),
//         data: formData,
//         options: Options(
//           headers: {
//             "accept": "/*",
//             "Authorization": "Bearer $tailor_token",
//             "Content-Type": "multipart/form-data"
//           },
//         ));

//     gigs.add(TailorService(
//         id: "",
//         name: name,
//         description: description,
//         price: amount,
//         imgUrl: filepath,
//         city: city,
//         serviceType: service_type,
//         totalRatings: 0,
//         numberOfTimesRated: 0,
//         expectedDelivery: delivery_days));

//     // print(response);
//     print(response.toString());
//     if (response.data != null) {
//       return true;
//     } // Options
//   } catch (e) {
//     print(e);
//     print(e.toString());
//   }
//   // if (response.data != null) {
//   //   return true;
//   // } // Options

//   return false;
// }
