import 'dart:developer';


import 'package:file_upload_web/pages/profile_screen.dart';

import 'AllProducts.dart';
import 'EditProductPage.dart';
import 'AddProduct.dart';
import 'edit_content.dart';
import 'products.dart';
import 'token.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_functions.dart';
import 'main.dart';
import 'endpoints.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

class ContentsPage extends StatefulWidget {
  const ContentsPage({Key key}) : super(key: key);

  @override
  _ContentsPageState createState() => _ContentsPageState();
}

class _ContentsPageState extends State<ContentsPage> {
  // var body = {
  //   "name": "shawl",
  //   "price": 1000,
  //   "description": "this shawl is used throughout pakistan in winter",
  //   "category": "common",
  //   "imgUrl": "any image here either jpeg or png"
  // };

  DataRow _getDataRow(result, index) {
    print("Size: " + allProducts.length.toString());
    print("inside get data" + result.name);
    return DataRow(
      cells: <DataCell>[
        DataCell(Text(result.name)),
        DataCell(Text(result.price.toString())),
        DataCell(Text(result.category)),
        DataCell(Image.network(result.imgUrl)),
        // DataCell(ElevatedButton(
        //   child: new Text('edit '),
        //   style: ElevatedButton.styleFrom(
        //     primary: Color.fromARGB(255, 74, 179, 77),
        //   ),
        //   onPressed: () {/** */},
        // )),
        DataCell(ElevatedButton(
          child: new Text('delete '),
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 74, 179, 77),
          ),
          onPressed: () async {
            //https://dress-up.azurewebsites.net/admin/products/id
            final Uri url =
                Uri.parse(baseURL + admin + get_all_products + "/" + result.id);
            await deleteProducts(url);
            deletePro(index);
          },
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Manage Products'),
          backgroundColor: Color.fromARGB(255, 74, 179, 77),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              child: Text("Add New"),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: allProducts.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Image.network(allProducts[index].imgUrl),
                  title: Text(allProducts[index].name ?? ''),
                  subtitle:
                      Text("PKR: " + allProducts[index].price.toString() ?? ''),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EditProductPage(allProducts[index])));
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.teal,
                          )),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              allProducts.removeAt(index);
                            });
                            // _deleteFormDialog(context, _userList[index].id);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
              );
            }));


  }

  Future<bool> deleteProducts(Uri uri) async {
    print("iniside dlete prodycts");
    print(uri);
    var response = await http.delete(uri, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
    } else {
      print(response.statusCode);
    }
  }

}
