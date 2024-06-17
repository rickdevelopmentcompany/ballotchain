import 'package:ballotchain/screens/splash_screen.dart';
import 'package:ballotchain/util/api_url.dart';
import 'package:ballotchain/util/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' BallotChain',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
        ],
      ),

      home: SplashScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('BallotChain'),
        backgroundColor: AppConstants.primaryColor,
        // foregroundColor: AppConstants.whiteColor,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
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
              onTap: () {},
            ),
            ListTile(
              title: Text('Vote'),
              leading: Icon(Icons.how_to_vote),
              onTap: () {},
            ),
            ListTile(
              title: Text('Result'),
              leading: Icon(Icons.bar_chart),
              onTap: () {},
            ),
            ListTile(
              title: Text('My Wallet'),
              leading: Icon(Icons.account_balance_wallet),
              onTap: () {},
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () {},
            ),
            ListTile(
              title: Text('Log out'),
              leading: Icon(Icons.logout),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Mikel O',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Welcome back',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[300],
              child: Image.network(ApiUrl.testImageUrl1),
              // child: Text(
              //   'Naija Beats Election 2024: Top Contenders Emerge as Music Icons Vie for Entertainment Crown',
              //   style: TextStyle(fontSize: 16),
              // ),
            ),
            SizedBox(height: 16),
            Text(
              'Featured Elections',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Image.network(ApiUrl.testImageUrl3,height: 150,),
                  // Image.network(ApiUrl.testImageUrl2,height: 150,),
                  // Image.network(ApiUrl.testImageUrl3,height: 150,),
                  ElectionCard(
                    image_url: ApiUrl.testImageUrl3,
                    date: 'Jan 26, 2024',
                  ),
                  ElectionCard(
                    image_url: ApiUrl.testImageUrl2,
                    date: 'Jan 26, 2024',
                  ),
                  ElectionCard(
                    image_url: ApiUrl.testImageUrl3,
                    date: 'Jan 26, 2024',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Popular Category',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElectionCard(
                    image_url: ApiUrl.testImageUrl2,
                    date: 'Jan 26, 2024',
                  ),
                  ElectionCard(
                    image_url: ApiUrl.testImageUrl3,
                    date: 'Jan 26, 2024',
                  ),
                  ElectionCard(
                    image_url: ApiUrl.testImageUrl2,
                    date: 'Jan 26, 2024',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            RecentActivitySection(),
          ],
        ),
      ),
    );
  }
}

class ElectionCard extends StatelessWidget {
  final String image_url;
  final String date;

  ElectionCard({required this.image_url, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 160,
      height: 100,
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(this.image_url,height: 100,),
          // Text(
          //   image_url,
          //   textAlign: TextAlign.center,
          //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          // ),
          // SizedBox(height: 8),
          // Text(
          //   date,
          //   style: TextStyle(fontSize: 12),
          // ),
        ],
      ),
    );
  }
}

class RecentActivitySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Activity',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          ActivityItem(
            activity: 'Wallet Funded',
            points: '+1000 BP',
          ),
          ActivityItem(
            activity: 'Voted',
            points: '-500 BP',
          ),
          ActivityItem(
            activity: 'Wallet Funded',
            points: '+1500 BP',
          ),
        ],
      ),
    );
  }
}

class ActivityItem extends StatelessWidget {
  final String activity;
  final String points;

  ActivityItem({required this.activity, required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(activity),
          Text(points, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
