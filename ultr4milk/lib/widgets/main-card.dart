import 'package:flutter/material.dart';

// Import pages untuk routing
import 'package:ultr4milk/screens/item_form.dart';
import 'package:ultr4milk/screens/inventory.dart';

class MenuButton extends StatelessWidget {
  final String name;
  final IconData icon;

  MenuButton({required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (name == "Add Items") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormPage(updateTotalPoints: (int ) {  },)),
          );
        } else if (name == "Inventory") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Inventory(items: [],)),
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