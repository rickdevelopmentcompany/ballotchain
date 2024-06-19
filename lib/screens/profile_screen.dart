import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../util/api_url.dart';
import '../util/app_constant.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: _image == null
                              ? NetworkImage(ApiUrl.profile_url)
                              : FileImage(_image!) as ImageProvider,
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: _pickImage,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Name',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Full Name',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Email',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                    SizedBox(height: 26),
                    Text(
                      'Phone Number',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Phone Number',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: SizedBox(  // Wrap ElevatedButton with SizedBox to make it full width
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // onPressed callback function
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(AppConstants.primaryColor),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                          child: Text("Update Profile"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
