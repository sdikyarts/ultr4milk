import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

// Import widgets
import 'package:ultr4milk/widgets/left-drawer.dart';
import 'package:ultr4milk/widgets/main-card.dart';

import 'package:ultr4milk/screens/item_form.dart';

// Label di button
class MenuButtons {
  final String name;
  final IconData icon;

  MenuButtons(this.name, this.icon);
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int totalPoints = Points.totalPoints;

  var height, width;

  // Tampilan button di menu memakai label
  final List<MenuButtons> items = [
    MenuButtons("Purchase", Icons.add_shopping_cart_rounded),
    MenuButtons("Add Items", Icons.plus_one_rounded,),
    MenuButtons("Redeem Item", Icons.card_giftcard_rounded),
    MenuButtons("Inventory", Icons.checklist_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      // Tambahkan left drawer sebelum body
      drawer: const LeftDrawer(),

      body: Builder(
          builder: (context) {
            return Stack(
              children: [
                Container(
                  color: Color(0xFF987FE8),
                  height: height,
                  width: width,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(),
                        height: height * 0.35,
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 35,
                                left: 20,
                                right: 20,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // Show drawer
                                      Scaffold.of(context).openDrawer();
                                    },
                                    child: Icon(
                                      Icons.sort_rounded,
                                      color: Color(0xFFF4F0FF),
                                      size: 40,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      final message = "Hello, User!";
                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(SnackBar(
                                            content: Text(message)));
                                    },
                                    child: ProfilePicture(
                                      name: '',
                                      radius: 20,
                                      fontsize: 21,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 30,
                                left: 30,
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Welcome",
                                        style: TextStyle(
                                          color: Color(0xFFF4F0FF),
                                          fontSize: 37,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        "User!",
                                        style: TextStyle(
                                          color: Color(0xFFF4F0FF),
                                          fontSize: 37,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(height: 15,),
                                      Row(
                                        children: [
                                          Text(
                                            "Total Points:",
                                            style: TextStyle(
                                              color: Color(0xFFF4F0FF),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.white30,
                                            ),
                                            height: 30,
                                            child: Padding(
                                              padding: EdgeInsets.all(4), // Adjust the padding as needed
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star_rounded,
                                                    color: Colors.yellow,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 4), // Add spacing between icon and text
                                                  Align(
                                                    alignment: Alignment.centerLeft, // Adjust alignment as needed
                                                    child: Text(
                                                      "$totalPoints", // TOTAL POINTS IS HERE
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 50,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF4F0FF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        // Buttons
                        padding: EdgeInsets.all(20), // Adjust the outer padding value
                        height: height * 0.65,
                        width: width,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.1,
                            mainAxisSpacing: 7.5,
                            crossAxisSpacing: 7.5,
                          ),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return MenuButton(
                              name: item.name,
                              icon: item.icon,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                // Gambar di header:
                Positioned(
                  bottom: height - 296,
                  left: width - 200,
                  child: Image(
                    image: AssetImage('assets/images/milk-drink.png'),
                    height: 200,
                    width: 200,
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}

