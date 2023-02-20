import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:file_upload_web/profile/network/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TailorProfileScreen extends StatefulWidget {
  TailorProfileScreen({Key key}) : super(key: key);

  @override
  State<TailorProfileScreen> createState() => _TailorProfileScreenState();
}

class _TailorProfileScreenState extends State<TailorProfileScreen> {
  List<PlatformFile> _paths;

  List<TextEditingController> myController =
      List.generate(6, (i) => TextEditingController());

  void pickFiles() async {
    try {
      _paths = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: ['png', 'jpg', 'jpeg', 'heic'],
      ))
          ?.files;
    } on PlatformException catch (e) {
      log('Unsupported operation' + e.toString());
    } catch (e) {
      log(e.toString());
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        body: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade200,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade800,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(
                                20.00,
                              ),
                              bottomRight: Radius.circular(
                                20.00,
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 132.00,
                                width: 327.00,
                                margin: const EdgeInsets.only(
                                  left: 10.00,
                                  top: 24.00,
                                  right: 10.00,
                                ),
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    _paths != null
                                        ? Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              height: 100.00,
                                              width: 100.00,
                                              margin: const EdgeInsets.only(
                                                left: 113.00,
                                                top: 10.00,
                                                right: 113.00,
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    50.00,
                                                  ),
                                                  image: DecorationImage(
                                                      image: MemoryImage(
                                                          _paths.first.bytes))),
                                            ),
                                          )
                                        : Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              height: 100.00,
                                              width: 100.00,
                                              margin: const EdgeInsets.only(
                                                left: 113.00,
                                                top: 10.00,
                                                right: 113.00,
                                              ),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade400,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    50.00,
                                                  ),
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/image_not_found.png'))),
                                            ),
                                          ),
                                    InkWell(
                                      onTap: pickFiles,
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height: 30.00,
                                          width: 30.00,
                                          margin: const EdgeInsets.only(
                                            left: 183.00,
                                            top: 10.00,
                                            right: 113.00,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white70,
                                            borderRadius: BorderRadius.circular(
                                              5.00,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.camera_alt_outlined,
                                            size: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //     left: 10.00,
                              //     top: 16.00,
                              //     right: 10.00,
                              //   ),
                              //   child: Text(
                              //     "",
                              //     overflow: TextOverflow.ellipsis,
                              //     textAlign: TextAlign.left,
                              //     style: TextStyle(
                              //       color: Colors.grey.shade50,
                              //       fontSize: 20,
                              //       fontFamily: 'Ubuntu',
                              //       fontWeight: FontWeight.w700,
                              //     ),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.00,
                                  top: 8.00,
                                  right: 10.00,
                                  bottom: 48.00,
                                ),
                                child: Text(
                                  "choose image",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.grey.shade50,
                                    fontSize: 14,
                                    fontFamily: 'Ubuntu',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 350.0,
                                child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: TextField(
                                    controller: myController[0],
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Name',
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 74, 179, 77),
                                      ),
                                      hintText: 'Name',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 350.0,
                                child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: TextField(
                                    controller: myController[1],
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Price',
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 74, 179, 77),
                                      ),
                                      hintText: 'Price',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 350.0,
                                child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: TextField(
                                    controller: myController[2],
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Description',
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 74, 179, 77),
                                      ),
                                      hintText: 'Description',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 350.0,
                                child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: TextField(
                                    controller: myController[3],
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'category',
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 74, 179, 77),
                                      ),
                                      hintText: 'category',
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 74, 179, 77),
                                ),
                                child: Text('Add'),
                                onPressed: () async {
                                  if (_paths != null) {
                                    //passing file bytes and file name for API call

                                    ApiClient.uploadFile(
                                        _paths.first.bytes,
                                        _paths.first.name,
                                        myController[0].text,
                                        myController[1].text,
                                        myController[2].text,
                                        myController[3].text);
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
