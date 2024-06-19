import 'package:ballotchain/widgets/floating_button.dart';
import 'package:ballotchain/widgets/side_bar.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../util/api_url.dart';
import '../util/app_constant.dart';
import '../widgets/bottom_navigation_bar.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('BallotChain',
        ),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
        // foregroundColor: AppConstants.whiteColor,
      ),
      drawer: SideBar(),
      bottomNavigationBar: BottomNavBar(position: 0,),
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
            CardLoading(
              height: 15,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              margin: EdgeInsets.only(bottom: 10),
              cardLoadingTheme: CardLoadingTheme.defaultTheme,
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
