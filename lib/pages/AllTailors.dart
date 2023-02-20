import 'dart:developer';
import 'Tailors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'endpoints.dart';
// import 'products.dart';
import 'token.dart';
import 'RiderDetails.dart';
import 'Riders.dart';
import 'TailorDetails.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'endpoints.dart';
import 'products.dart';
import 'token.dart';

List<Tailor> allTailors = [];

String imgUri =
    "https://raw.githubusercontent.com/Amjad-Afridi/dressUp-backend/master/";

Future<bool> getTailors(Uri uri) async {
  
  var response = await http.get(uri, headers: {
    // 'Content-Type': 'application/json',
    // 'Accept': 'application/json',
    // 'Authorization': 'Bearer $token',
  });

  Map<String, dynamic> map = json.decode(response.body);
  List<dynamic> data = map["result"];
  data.forEach((entry) {
    
    allTailors.add(Tailor.fromJson(entry));
    // print(name);
  });
  print("length of Tailors");
  print(allTailors.length.toString());

  if (response.statusCode == 200) {
    print("suppppppppccess");
    print(response);
    return true;
  } else {
    print(response.body);
    return false;
  }
}

deletePro(index) {
  allTailors.removeAt(index);
}