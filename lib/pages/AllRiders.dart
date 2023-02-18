import 'dart:developer';
import 'RiderDetails.dart';
import 'Riders.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'endpoints.dart';
// import 'products.dart';
import 'token.dart';
import 'TailorDetails.dart';
import 'Tailors.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'endpoints.dart';
import 'products.dart';
import 'token.dart';

List<Rider> allRiders = [];

String imgUri =
    "https://raw.githubusercontent.com/Amjad-Afridi/dressUp-backend/master/";

Future<bool> getRiders(Uri uri) async {
  print("iniside Riders");

  try {
    var response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print("hello");
    print("a");
    List<dynamic> data = json.decode(response.body);
    print("b");
    // List<dynamic> data = map;
    print("data here");
    print(data);
    // print("entryyyyyyy");
    print(data);
    data.forEach((entry) {
      String name = entry["name"];
      String email = entry["email"];
      // String number = entry["contactNumber"];

      // String complete = imgUri+img;

      print(name);
      print(email);
      // print(number);
      allRiders.add(Rider(
        name: name,
        email: email,
        // number: number,
      ));
      print(name);
    });
  } catch (error) {
    print("nigeeta");
    print(error);
  }
  // if (response.statusCode == 200) {
  //   print("suuuuuuuuccess");
  //   print(response);
  //   return true;
  // } else {
  //   print(response.body);
  //   return false;
  // }
}
