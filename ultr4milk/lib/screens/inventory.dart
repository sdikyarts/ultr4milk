import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

// Import widgets
import 'package:ultr4milk/widgets/left-drawer.dart';

// Import page
// Import pages untuk routing
import 'package:ultr4milk/screens/home.dart';
import 'package:ultr4milk/screens/products.dart';

import 'package:ultr4milk/screens/item_form.dart';

class InventoryButtons {
  final String name;
  final IconData icon;

  InventoryButtons(this.name, this.icon);
}

class Inventory extends StatefulWidget {
  final List<Item> items;

  Inventory({required this.items});

  @override
  _InventoryState createState() => _InventoryState();
}


class _InventoryState extends State<Inventory> {
  var height, width;

  final List<InventoryButtons> buttons = [
    InventoryButtons("Products", Icons.local_drink_rounded),
    InventoryButtons("Photocards", Icons.card_membership_rounded),
  ];

  List<Item> _currentItems = [];

  @override
  void initState() {
    super.initState();
    _currentItems = widget.items;
  }

  void updateItems(List<Item> updatedItems) {
    setState(() {
      _currentItems.clear(); // Clear the existing items
      _currentItems.addAll(updatedItems); // Add the updated items
    });
  }

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
                        height: height * 0.25,
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
                                        "Inventory",
                                        style: TextStyle(
                                          color: Color(0xFFF4F0FF),
                                          fontSize: 37,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
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
                        height: height * 0.75,
                        width: width,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 2.0,
                            mainAxisSpacing: 7.5,
                            crossAxisSpacing: 7.5,
                          ),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: buttons.length,
                          itemBuilder: (context, index) {
                            final item = buttons[index];
                            return InventoryButton(
                              name: item.name,
                              icon: item.icon,
                              items: _currentItems, // Pass the current items to InventoryButton
                              updateProductPage: updateItems, // Pass updateItems method
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}

class InventoryButton extends StatelessWidget {
  final String name;
  final IconData icon;
  final List<Item> items; // Receive items list
  final Function(List<Item>) updateProductPage; // Function to update ProductPage items

  InventoryButton({
    required this.name,
    required this.icon,
    required this.items,
    required this.updateProductPage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (name == "Products") {
          updateProductPage(items); // Pass the items to update
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductPage(
                items: items, // Pass the updateProductPage function
              ),
            ),
          );

        } else if (name == "Photocards") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.all(10), // Adjust the margin value for inner containers
        decoration: BoxDecoration(
          color: Color(0xFF91CDEF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Color(0xFF142B44),
            ),
            SizedBox(height: 10,),
            Text(
              name,
              style: TextStyle(
                color: Color(0xFF142B44),
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center, // Align the text to the center
            ),
          ],
        ),
      ),
    );
  }
}

