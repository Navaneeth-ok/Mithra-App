import 'package:flutter/material.dart';
import 'package:mithra/Screens/Admin/add_stock.dart';
import 'package:mithra/Screens/Admin/add_user.dart';
import 'package:mithra/Screens/Admin/view_request.dart';
import 'package:mithra/Screens/Admin/view_users.dart'; // Import the new page
import 'package:mithra/Screens/Admin/view_stocks_page.dart'; // Import the view_stocks page
import 'package:mithra/components/socal_icon.dart';
import 'package:mithra/constants.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
      body: AdminBody(),
    );
  }
}

class AdminBody extends StatefulWidget {
  const AdminBody({Key? key}) : super(key: key);

  @override
  _AdminBodyState createState() => _AdminBodyState();
}

class _AdminBodyState extends State<AdminBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            "Hi, ADMIN",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Image.asset(
            "assets/images/Admin.png",
            height: 250, // Adjust the height as needed
            width: 250, // Adjust the width as needed
          ),
          SizedBox(height: 20),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: "assets/images/add_user.png",
                      text: "Add User",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AddUserPage();
                            },
                          ),
                        );
                      },
                      key: const Key("SocalIcon_adduser_key"),
                    ),
                    SocalIcon(
                      iconSrc: "assets/images/Add_stock.jpg",
                      text: "Add Stock",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AddStock();
                            },
                          ),
                        );
                      },
                      key: const Key("SocalIcon_addstock_key"),
                    ),
                    SocalIcon(
                      iconSrc: "assets/images/view_request.png",
                      text: "View Request",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ViewRequest();
                            },
                          ),
                        );
                      },
                      key: const Key("SocalIcon_viewrequest_key"),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Add some space between rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: "assets/images/view_users.png",
                      text: "View Users",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ViewUsersPage();
                            },
                          ),
                        );
                      },
                      key: const Key("SocalIcon_viewusers_key"),
                    ),
                    SocalIcon(
                      iconSrc:
                          "assets/images/view_stocks.png", // Add your icon for view stocks
                      text: "View Stocks",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ViewStocksPage();
                            },
                          ),
                        );
                      },
                      key: const Key("SocalIcon_viewstocks_key"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
