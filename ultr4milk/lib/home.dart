import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
//import 'package:css_colors/css_colors.dart';

// Label di button
class MenuButtons {
  final String name;
  final IconData icon;

  MenuButtons(this.name, this.icon);
}

class Home extends StatelessWidget {
  var height, width;

  // Tampilan button di menu memakai label
  final List<MenuButtons> items = [
    MenuButtons("Purchase", Icons.add_shopping_cart_rounded),
    MenuButtons("Add Items", Icons.plus_one_rounded,),
    MenuButtons("Logout", Icons.logout_rounded),
    MenuButtons("Inventory", Icons.checklist_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
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
                                final message = "You pressed the sidebar!";
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(SnackBar(
                                      content: Text(message)));
                              },
                              child: Icon(
                                Icons.sort_rounded,
                                color: Colors.white,
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
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "User!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    Text(
                                      "Total Points:",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white38,
                                      ),
                                      height: 28,
                                      child: Padding(
                                        padding: EdgeInsets.all(4), // Adjust the padding as needed
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star_rounded,
                                              color: Colors.yellow,
                                              size: 18,
                                            ),
                                            SizedBox(width: 4), // Add spacing between icon and text
                                            Align(
                                              alignment: Alignment.centerLeft, // Adjust alignment as needed
                                              child: Text(
                                                "0",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
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
                      return InkWell(
                        onTap: () {
                          final message = "You pressed ${item.name} button!";
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                                content: Text(message)));
                        },
                        child: Container(
                          margin: EdgeInsets.all(10), // Adjust the margin value for inner containers
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                item.icon,
                                size: 40,
                                color: Colors.black87,
                              ),
                              SizedBox(height: 10,),
                              Text(
                                item.name,
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center, // Align the text to the center
                                overflow: TextOverflow.ellipsis, // Truncate long text
                              ),
                            ]
                          ),
                        ),
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
      ),
    );
  }
}
