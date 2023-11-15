import 'package:flutter/material.dart';

// Import pages untuk routing
import 'package:ultr4milk/screens/home.dart';
import 'package:ultr4milk/screens/item_form.dart';
import 'package:ultr4milk/screens/inventory.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFF4F0FF),
            child: Column(
              children: [
                SizedBox(height: 50),
                // TODO: Bagian routing
                // Routing Home
                ListTile(
                  leading: const Icon(
                    Icons.home_rounded,
                    color: Color(0xFF2E2C34),
                    size: 30,
                  ),
                  title: const Text(
                      'Home',
                      style: TextStyle(
                        color: Color(0xFF0E0818),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  // Bagian redirection ke MyHomePage
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                  },
                ),
                SizedBox(height: 20),
                // Routing Purchase
                ListTile(
                  leading: const Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Color(0xFF2E2C34),
                    size: 30,
                  ),
                  title: const Text(
                      'Purchase',
                      style: TextStyle(
                        color: Color(0xFF0E0818),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  // Bagian redirection ke MyHomePage
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                  },
                ),
                SizedBox(height: 20),
                // Routing Add Item
                ListTile(
                  leading: const Icon(
                    Icons.plus_one_rounded,
                    color: Color(0xFF2E2C34),
                    size: 30,
                  ),
                  title: const Text(
                      'Add Items',
                      style: TextStyle(
                        color: Color(0xFF0E0818),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  // Bagian redirection ke MyHomePage
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormPage(updateTotalPoints: (int ) {  },),
                        ));
                  },
                ),
                SizedBox(height: 20),
                // Routing Redeem Item
                ListTile(
                  leading: const Icon(
                    Icons.card_giftcard_rounded,
                    color: Color(0xFF2E2C34),
                    size: 30,
                  ),
                  title: const Text(
                      'Redeem Item',
                      style: TextStyle(
                        color: Color(0xFF0E0818),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  // Bagian redirection ke MyHomePage
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                  },
                ),
                SizedBox(height: 20),
                // Routing Inventory
                ListTile(
                  leading: const Icon(
                    Icons.checklist_rounded,
                    color: Color(0xFF2E2C34),
                    size: 30,
                  ),
                  title: const Text(
                      'Inventory',
                      style: TextStyle(
                        color: Color(0xFF0E0818),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  // Bagian redirection ke MyHomePage
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Inventory(items: [],),
                        ));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}