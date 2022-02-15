import 'dart:io';

import 'package:blog_app_flutter/components/round_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  File? _imagePath;
  final imagePicker = ImagePicker();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future getImageFromGallery() async {
    final selectedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if(selectedImage != null) {
        _imagePath = File(selectedImage.path);
      }else{
        print('No image is selected');
      }
    });
  }

  Future getImageFromCamera() async {
    final selectedImage = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if(selectedImage != null) {
        _imagePath = File(selectedImage.path);
      }else{
        print('No image is selected');
      }
    });
  }


  void showAlertDialog(mContext) {
    showDialog(
      context: mContext,
      builder: (BuildContext context){
        return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
            ),
          content: Container(
            height: 120,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    getImageFromCamera();
                    Navigator.pop(context);
                  },
                  child: const ListTile(
                    leading: Icon(Icons.camera),
                    title: Text('Camera'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    getImageFromGallery();
                    Navigator.pop(context);
                  },
                  child: const ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Gallery'),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload New Post'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  showAlertDialog(context);
                },
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .2,
                    width: MediaQuery.of(context).size.width * 1,
                    child: _imagePath != null
                        ? ClipRect(
                            child: Image.file(
                              _imagePath!.absolute,
                              height: 100,
                              width: 100,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10)),
                            width: 100,
                            height: 100,
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.green,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        hintText: 'Enter title here',
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                        labelStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                      ),
                      validator: (value) {
                        return value!.isEmpty ? 'Please enter the title' : null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: descriptionController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        hintText: 'Enter description here',
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                        labelStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.normal),
                      ),
                      validator: (value) {
                        return value!.isEmpty
                            ? 'Please enter the description'
                            : null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: RoundButton(
                        btnName: 'Post',
                        btnOnPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
