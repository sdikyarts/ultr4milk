import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

// Import widgets
import 'package:ultr4milk/widgets/left-drawer.dart';

// Import page
import 'package:ultr4milk/screens/item_form.dart';

class ProductPage extends StatefulWidget {
  final List<Item> items;

  const ProductPage({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late List<Item> _currentItems; // Initialize late

  @override
  void initState() {
    super.initState();
    _currentItems = widget.items; // Initialize _currentItems with widget.items
  }

  var height, width;

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
                                        "Products",
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
                          itemCount: _currentItems.length,
                          itemBuilder: (context, index) {
                            final item = _currentItems[index];
                            return ProductCard(
                                name: item.name,
                                price: item.price,
                                amount: item.amount,
                                description: item.description,
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

class ProductCard extends StatelessWidget {
  final String name;
  final int price;
  final int amount;
  final String description;

  const ProductCard({
    Key? key,
    required this.name,
    required this.price,
    required this.amount,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(10), // Adjust the margin value for inner containers
        decoration: BoxDecoration(
          color: Color(0xFF91CDEF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Color(0xFF142B44),
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            // Display other details as needed
            Text('Price: $price'),
            Text('Quantity: $amount'),
            Text('Description: $description'),
          ],
        ),
      ),
    );
  }
}