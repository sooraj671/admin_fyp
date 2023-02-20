import 'dart:developer';
// import 'package:admin/pages/OrderDetails.dart';
import 'package:file_upload_web/pages/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'OrderDetails.dart';
import 'endpoints.dart';

import 'token.dart';

List<Product> allOrders = [];

String imgUri =
    "https://raw.githubusercontent.com/Amjad-Afridi/dressUp-backend/master/";

Future<bool> getOrders(Uri uri) async {
  print("Product Orders response");
  print(uri.toString());

  String newToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiYWRtaW4xMjMiLCJlbWFpbCI6ImFkbWluMTIzQGdtYWlsLmNvbSIsIl9pZCI6IjYzY2JlYjM3NGFlNTVlNTY4MTgzNGQ3YiIsImlhdCI6MTY3Njg5NTUxOSwiZXhwIjoxNjc2OTgxOTE5fQ.CKnOy8XCv52fGrHFvpL9u2yOCmT3suvFN_TiUg2ALjM";
  try {
    var response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $newToken',
    });
    print(response.toString());
    print("======================================================");

    print(jsonDecode(response.body.toString()));

    print("======================================================");

    print(jsonDecode(response.body.toString())['result']);

    Map<String, dynamic> myMap = json.decode(response.body);

    List<dynamic> data = myMap["result"];

    print("======================================================");

    print(data.toString());

    data.forEach((entry) {
      // print(entry);
      allOrders.add(Product.fromJson(entry));
    });
  } catch (error) {
    print(error);
  }
  print(allOrders.length.toString());

  //Map<String, dynamic> map = json.decode(response.body);
  // List<dynamic> data = map["result"];
  // print("12");
  // print("ab");
  // data.forEach((entry) {
  //   String id = entry["_id"];
  //   int totalPrice = entry["totalPrice"];
  //   String date = entry["date"];
  //   String customerLocation = entry["customerLocation"];
  // String complete = imgUri+img;
  print("13");
  print("abb");
  // allOrders.add(Order(
  //   id: id,
  //   totalPrice: totalPrice,
  //   date: date,
  //   customerLocation: customerLocation,
  // ));
  // print(name);
  print("14");
  print("abbb");
  //});

  // if (response.statusCode == 200) {
  //   print("success");
  //   print("15");
  //   print("abbbb");
  //   return true;
  // } else {
  //   print(response.body);
  //   return false;
  // }
}

deletePro(index) {
  allOrders.removeAt(index);
}
