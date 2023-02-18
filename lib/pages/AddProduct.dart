import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../profile/network/network.dart';

var bytes;

class AddProductPage extends StatefulWidget {
  AddProductPage({Key key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  List<TextEditingController> myController =
      List.generate(6, (i) => TextEditingController());

  // String title;

  // String path;

  // File imageFile;
  // bool pickedBool = false;
  // Uint8List pickedFileBytes;

  // _getFromGallery() async {
  //   // * Pick a File
  //   FilePickerResult result = await FilePicker.platform.pickFiles();

  //   if (result != null) {
  //     // * cast it to bytes
  //     List<int> bytes = result.files.single.bytes.cast();
  //     print(bytes);
  //     // * Get its name, will use it later.
  //     var name = result.files.single.name;
  //     print(name);
  //     // * Send it to method that will make HTTP request.
  //     await uploadPhoto(bytes, name);

  //     setState(() {
  //       myController[5].text = result.files.first.name.toString();
  //     });

  //     // var picked = await FilePicker.platform.pickFiles();
  //     // if (picked != null) {
  //     //   // print(picked.files.first.path);
  //     //   bytes = picked.files.first.bytes;
  //     //   print(bytes);
  //     //   print(picked.files.first.name);

  //     //   setState(() {
  //     //     myController[5].text = picked.files.first.name.toString();
  //     //   });

  //     // imageFile = File(picked.files.first.path);
  //   }

  //   // FilePickerResult result = await FilePicker.platform.pickFiles();
  //   // print(result.toString());
  //   // // print(result.files);
  //   // print("Path: " + result.files[0].path);
  //   // print("Name: " + result.files[0].name);

  //   // get file
  //   // final results = await FilePicker.platform
  //   //     .pickFiles(type: FileType.any, allowMultiple: false);

  //   // if (result != null && result.files.isNotEmpty) {
  //   //   final fileBytes = result.files.first.bytes;
  //   //   final fileName = result.files.first.name;
  //   //   print(fileBytes);
  //   //   print(fileName);
  //   //   // upload file
  //   //   // await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes);
  //   // }

  //   // File file = File(result?.files.single.path ?? " ");

  //   // // path = "";
  //   // if (file != null) {
  //   //   // setState(() {
  //   //   //   picked = true;
  //   //   /// Checking if the file is null or not.
  //   //   // });
  //   //   // showPopUp(imageFile.path);
  //   //   path = file.path;
  //   // }
  // }

  List<PlatformFile> _paths;

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
      print('Unsupported operation' + e.toString());
    } catch (e) {
      print(e.toString());
    }
    setState(() {});
  }

  // String text = "No Value Entered";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Products'),
        backgroundColor: Color.fromARGB(255, 74, 179, 77),
      ),
      body: SingleChildScrollView(
        child: Expanded(
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
                        color: Colors.green,
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
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10.00,
                              top: 16.00,
                              right: 10.00,
                            ),
                            child: Text(
                              "Add Picture",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.grey.shade50,
                                fontSize: 20,
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
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
                          SizedBox(
                            width: 350.0,
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: TextField(
                                controller: myController[4],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'image',
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 74, 179, 77),
                                  ),
                                  hintText: 'image',
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 74, 179, 77),
                            ),
                            child: Text('Add'),
                            onPressed: () async {

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
      ),
    );
  }
}
