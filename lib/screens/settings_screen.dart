import 'package:ballotchain/screens/notification_setting_screen.dart';
import 'package:ballotchain/screens/profile_screen.dart';
import 'package:ballotchain/screens/security_screen.dart';
import 'package:ballotchain/util/api_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../util/app_constant.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/floating_button.dart';
import '../widgets/side_bar.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
      ),
      drawer: SideBar(),
      bottomNavigationBar: BottomNavBar(position: 3,),
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ProfileSection(),
          SizedBox(height: 36),
          // AccountSection(),
          // SizedBox(height: 16),
          SettingsSection(),
          SizedBox(height: 16),
          Center(
            child: TextButton(
              onPressed: () {
                // Add delete account logic
              },
              child: Text(
                'Log out',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(ApiUrl.profile_url),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Rick De Programmer',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '@rickdeprogrammer',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
              // Edit profile logic
            },
          ),
        ],
      ),
    );
  }
}

class AccountSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Icon(Icons.person, color: Colors.white),
        title: Text(
          'Personal Details',
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PersonalDetailsScreen()),
          );
        },
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 56.0),
        ListTile(
          leading: Icon(Icons.person, color: Colors.black),
          title: Text('Profile', style: TextStyle(color: Colors.black)),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
        ),
        SizedBox(height: 16.0),
        ListTile(
          leading: Icon(Icons.security, color: Colors.black),
          title: Text('Security', style: TextStyle(color: Colors.black)),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecurityScreen()),
            );
          },
        ),
        SizedBox(height: 16.0),
        ListTile(
          leading: Icon(Icons.notifications, color: Colors.black),
          title: Text('Notification', style: TextStyle(color: Colors.black)),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationSettingScreen()),
            );
          },
        ),
        SizedBox(height: 16.0),
        ListTile(
          leading: Icon(Icons.help, color: Colors.black),
          title: Text('Help & Support', style: TextStyle(color: Colors.black)),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HelpSupportScreen()),
            );
          },
        ),
      ],
    );
  }
}

class PersonalDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Details'),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('Personal Details Screen')),
    );
  }
}

class SecuritySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security'),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('Security Screen')),
    );
  }
}

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language'),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('Language Screen')),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('Notification Screen')),
    );
  }
}

class HelpSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.black,
      ),
      body: Center(child: Text('Help & Support Screen')),
    );
  }
}
