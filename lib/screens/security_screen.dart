

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/app_constant.dart';

class SecurityScreen extends StatefulWidget{
  _securityScreenState createState() => _securityScreenState();
}

class _securityScreenState extends State<SecurityScreen>{
  bool display_password_form = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security'),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Security"),
                    Text("Set a unique password to protect your account")
                  ],
                ),
              ],
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Password"),
                    Text("Set a unique password to protect your account")
                  ],
                ),
               ElevatedButton(
                 onPressed: () {
                   setState(() {
                     display_password_form = true;
                   });
                 },
                 child: Text("Edit", style: TextStyle(color: Colors.white),),
                 style: ButtonStyle(
                   backgroundColor: MaterialStatePropertyAll<Color>(AppConstants.primaryColor),
                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                     RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(8.0),
                     )),
                 ),
               ),

              ],
            ),
            SizedBox(height: 50,),
            display_password_form ? ChangePasswordForm() : SizedBox(),
          ],
        ),
      ),
    );
  }

}



class ChangePasswordForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Old Password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'New Password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add save password logic here
              },
              child: Text('Save password',style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppConstants.primaryColor, // Button background color
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}