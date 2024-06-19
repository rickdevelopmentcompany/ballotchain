import 'package:ballotchain/util/app_constant.dart';
import 'package:ballotchain/widgets/side_bar.dart';
import 'package:ballotchain/widgets/bottom_navigation_bar.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/floating_button.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
        backgroundColor: AppConstants.primaryColor,
        foregroundColor: Colors.white,
      ),
      drawer: SideBar(),
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(position: 0,),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Balance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0XFF03211A),
                    Color(0XFF3C0A0A),
                  ],
                  // stops: [0.75,0.2]
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '10,000 Ballot Points (BP)',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 12),
                  Center(
                    child:ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Add fund wallet logic
                          showCupertinoModalSheet(
                            fullscreenDialog: true,
                            context: context,
                            builder: (context) => SelectPaymentScreen(),
                          );
                        },
                        child: Text('Fund Wallet'),
                      )
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Text(
            //   'Vote Points Conversion',
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            // SizedBox(height: 8),
            // Container(
            //   padding: EdgeInsets.all(16.0),
            //   decoration: BoxDecoration(
            //     color: Colors.grey[200],
            //     borderRadius: BorderRadius.circular(8.0),
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text('100 Ballot Points = 20 Votes'),
            //       Text('500 Ballot Points = 100 Votes'),
            //       Text('2,500 Ballot Points = 500 Votes'),
            //       Text('5,000 Ballot Points = 1,000 Votes'),
            //       Text('25,000 Ballot Points = 5,000 Votes'),
            //       Text('50,000 Ballot Points = 10,000 Votes'),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 16),
            Text(
              'Recent Activity',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Column(
              children: [
                for (int i = 0; i < 5; i++)
                  i % 2 == 0
                      ? ActivityItem(
                    activity: 'Wallet Funded',
                    points: '+ $i,000 BP',
                  )
                      : ActivityItem(
                    activity: 'Wallet Funded',
                    points: '-$i,000 BP', // Different points for odd items
                  ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Upcoming Activity',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Column(
              children: [
                for(int i =0; i < 5; i++)
                  i % 2 == 0
                      ? ActivityItem(
                    activity: 'Wallet Funded',
                    points: '+10,000 BP',
                  ) : ActivityItem(
                activity: 'Wallet Funded',
                points: '+10,000 BP',
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}

class BookDetailsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text("card");
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
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(255, 193, 7, 0.3)
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.compare_arrows,
                  color: Color.fromARGB(255, 193, 7,7),
                  ),
                ),
              ),
              SizedBox(width: 8,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(activity),
                  SizedBox(height: 10,),
                  Text(
                    '12:00 AM',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  )
                ],
              ),
            ],
          ),
          Text(points,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                color: Colors.green,
              )
          ),
        ],
      ),
    );
  }
}



class SelectPaymentScreen extends StatefulWidget {
  @override
  _SelectPaymentScreenState createState() => _SelectPaymentScreenState();
}

class _SelectPaymentScreenState extends State<SelectPaymentScreen> {
  String _selectedPaymentMethod = 'PayStack';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Select Payment Method'),
        trailing: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(CupertinoIcons.clear_thick),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildPaymentOption(
                title: 'PayStack',
                value: 'PayStack',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
              SizedBox(height: 6.0),
              buildPaymentOption(
                title: 'Bitpay',
                value: 'Bitpay',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
              SizedBox(height: 22.0),
              CupertinoButton.filled(
                child: Text('Continue'),
                onPressed: () {
                  // Add your continue logic here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPaymentOption({
    required String title,
    required String value,
    required String groupValue,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey[300]!,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            value == 'PayStack' ? 'assets/paystack.png' : 'assets/bitpay.png',
            height: 24.0,
            width: 24.0,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          Radio<String>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            activeColor: Color(0xFF002A5B),
          ),
        ],
      ),
    );
  }
}
