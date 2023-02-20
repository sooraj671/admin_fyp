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
import 'RiderDetails.dart';

List<Rider> allRiders = [];

String imgUri =
    "https://raw.githubusercontent.com/Amjad-Afridi/dressUp-backend/master/";

Future<bool> getRiders(Uri uri) async {


  print("=================================================================================");
  print(uri.toString());

  var response = await http.get(uri);

  print("for riders real");
  // print(response.body.toString());
  // print(response.body.toString());

  Map<String, dynamic> map = json.decode(response.body);
  List<dynamic> data = map["result"];

  
  data.forEach((entry) {

    allRiders.add(Rider.fromJson(entry));    


  });

  print("Length of Riderss");
  print(allRiders.length.toString());

  if (response.statusCode == 200) {
    print("success");
    return true;
  } else {
    print(response.body);
    return false;
  }
}

deletePro(index) {
  allRiders.removeAt(index);
}
//   try {
//     var response = await http.get(uri, headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     });
  
//     List<dynamic> data = json.decode(response.body);
    
//     data.forEach((entry) {
//       String name = entry["name"];
//       String number = entry["phone"];

  
//       allRiders.add(Rider(
//         name: name,
//         number: int.parse(number),
//       ));
//     });
//   } catch (error) {
//     print(error);
//   }
//   // if (response.statusCode == 200) {
//   //   print("suuuuuuuuccess");
//   //   print(response);
//   //   return true;
//   // } else {
//   //   print(response.body);
//   //   return false;
//   // }
// }
