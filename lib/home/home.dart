import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:database_image/model/model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

File? imagefile;
String? imageString;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IMAGES APPILICATION"),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 163, 203, 199),
            Color.fromARGB(255, 159, 169, 14),
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: imageString == null
                  ? Container(
                      width: 500,
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(40),
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://icon-library.com/images/add-image-icon/add-image-icon-0.jpg",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  : Container(
                      width: 500,
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                          image: MemoryImage(
                            const Base64Decoder()
                                .convert(imageString!),
                          ),fit: BoxFit.cover
                        ),
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(50),
                color: Colors.amber,
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  onPressed: () {
                    takeGallery();
                  },
                  child: const Text('Take Image From Gallery',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//=============== image take from gallery function =====================//
  Future<void> takeGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTempray = File(image.path);

    setState(() {
      imagefile = imageTempray;
    });
    addimage(image);
    log(imagefile.toString());
  }

//================= image converting string function ==================//

  String img = '';

  addimage(XFile pickimage) async {
    if (pickimage == null) {
      return;
    } else {
      final bytes = File(pickimage.path).readAsBytesSync();
      img = base64Encode(bytes);
      imageString=img;
      setState(() {
        
      });
      final imageModel = Imagemodel(images: img);
   // pickImage(imageModel);
    }
  }

  //  pickImage(Imagemodel image) async {
  //   final imagedb = await Hive.openBox<Imagemodel>('Image_db');
  //   imagedb.add(image);
  //   log(imagedb.values.first.toString());
  //   imageString =imagedb.values.first.toString();
  //   setState(() {
      
  //   });
    
  
}
