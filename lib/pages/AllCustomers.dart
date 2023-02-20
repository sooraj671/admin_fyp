import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'CustomerDatails.dart';
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

List<Customer> allCustomers = [];

String imgUri =
    "https://raw.githubusercontent.com/Amjad-Afridi/dressUp-backend/master/";

Future<bool> getCustomers(Uri uri) async {
  print("iniside Customers");

  
    var response = await http.get(uri, headers: {
    // 'Content-Type': 'application/json',
    // 'Accept': 'application/json',
    // 'Authorization': 'Bearer $token',
  });
      Map<String, dynamic> map = json.decode(response.body);
  List<dynamic> data = map["result"];
   
    data.forEach((entry) {
      
      
      allCustomers.add(Customer.fromJson(entry));
    });

  if (response.statusCode == 200) {
    print("success");
    return true;
  } else {
    print(response.body);
    return false;
  }
}

deletePro(index) {
  allCustomers.removeAt(index);
}
  
  // if (response.statusCode == 200) {
  //   print("suuuuuuuuccess");
  //   print(response);
  //   return true;
  // } else {
  //   print(response.body);
  //   return false;
  // }

