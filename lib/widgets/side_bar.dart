import 'package:ballotchain/screens/dashboard.dart';
import 'package:ballotchain/screens/results_screen.dart';
import 'package:ballotchain/screens/settings_screen.dart';
import 'package:ballotchain/screens/vote_screen.dart';
import 'package:ballotchain/util/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/wallet_screen.dart';

class SideBar extends StatefulWidget {
  sideBarState createState() => sideBarState();
}


  class sideBarState extends State<SideBar> {

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: AppConstants.primaryColor,
            ),
            accountName: Text('Mikel O'),
            accountEmail: Text('mikel.o@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('M'),
            ),
          ),
          ListTile(
            title: Text('Overview'),
            leading: Icon(Icons.dashboard),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()));
            },
          ),
          ListTile(
            title: Text('Vote'),
            leading: Icon(Icons.how_to_vote),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VoteScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Result'),
            leading: Icon(Icons.bar_chart),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultScreen()),
              );
            },
          ),
          ListTile(
            title: Text('My Wallet'),
            leading: Icon(Icons.account_balance_wallet),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WalletScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Vote Conversion'),
            leading: Icon(Icons.add_chart_outlined),
            onTap: () {},
          ),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Log out'),
            leading: Icon(Icons.logout),
            onTap: () {},
          ),
        ],
      ),
    );
}
}