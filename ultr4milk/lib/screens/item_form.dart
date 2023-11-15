import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:ultr4milk/screens/products.dart';

// Impor Drawer
import 'package:ultr4milk/widgets/left-drawer.dart';

class FormPage extends StatefulWidget {
  final Function(int) updateTotalPoints;

  const FormPage({
    Key? key,
    required this.updateTotalPoints,
  }) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

// Model Class Item agar semua form yang disubmit masuk ke dynamic list untuk ditampilkan di page lain
class Item {
  final String name;
  final int price;
  final int amount;
  final String description;

  Item(this.name, this.price, this.amount, this.description);
}

class Points {
  static int totalPoints = 0;
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  int _price = 0;
  String _description = "";
  String _imageFilename = '';

  var height, width;

  // Dynamic List untuk menampung semua item yang diinput di form
  static List<Item> items = [];

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
                                        "Add Item",
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
                        child: Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFCCC3E1),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Product Name",
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.blue, // Customize the color for focused border
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none, // Remove border for enabled state
                                          ),
                                        ),
                                        onChanged: (String? value) {
                                          setState(() {
                                            _name = value!;
                                          });
                                        },
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return "Name cannot be empty!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFCCC3E1),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintText: "Price",
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                color: Colors.blue, // Customize the color for focused border
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                              borderSide: BorderSide.none, // Remove border for enabled state
                                            ),
                                          ),
                                          onChanged: (String? value) {
                                            setState(() {
                                              _price = int.parse(value!);
                                            });
                                          },
                                          validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                              return "Price cannot be empty!";
                                            }
                                            if (int.tryParse(value) == null) {
                                              return "Price must be in digits!";
                                            }
                                            return null;
                                          },
                                        )
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFCCC3E1),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Amount",
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.blue, // Customize the color for focused border
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none, // Remove border for enabled state
                                          ),
                                        ),
                                        onChanged: (String? value) {
                                          setState(() {
                                            _amount = int.parse(value!);
                                          });
                                        },
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return "Volume cannot be empty!";
                                          }
                                          if (int.tryParse(value) == null) {
                                            return "Volume must be in digits!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFCCC3E1),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Description",
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.blue, // Customize the color for focused border
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none, // Remove border for enabled state
                                          ),
                                        ),
                                        onChanged: (String? value) {
                                          setState(() {
                                            _description = value!;
                                          });
                                        },
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return "Description cannot be empty!";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                          onTap: () {
                                            if (_formKey.currentState!.validate()) {
                                              void updateProductPage(List<Item> updatedItems) {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) => ProductPage(items: updatedItems),
                                                  ),
                                                );
                                              }
                                              // Buat objek item baru
                                              Item newItem = Item(_name, _price, _amount, _description);

                                              // Tambahkan item ke list
                                              items.add(newItem);

                                              // Match nama produk dengan gambar
                                              _imageFilename = Match.matchName(_name);

                                              // Update total points based on some logic
                                              int calculatedPoints = PointCount()._calculatePoints(_amount, _price, _name);
                                              Points.totalPoints += calculatedPoints;

                                              // Call the callback function to update the total points in Home
                                              widget.updateTotalPoints(calculatedPoints);

                                              // Update ProductPage
                                              updateProductPage(items);

                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                      'Successfully added item!',
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                    ),
                                                    content: SingleChildScrollView(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text('Nama: $_name'),
                                                          // TODO: Munculkan value-value lainnya
                                                          Text('Harga: $_price'),
                                                          Text('Stok: $_amount'),
                                                          Text('Deskripsi: $_description'),

                                                          // Display the image filename
                                                          Text('Image Filename: $_imageFilename'),
                                                        ],
                                                      ),
                                                    ),
                                                    contentPadding: EdgeInsets.fromLTRB(24, 16, 24, 0), // Adjust top and bottom padding
                                                    backgroundColor: Color(0xFFF4F0FF),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(16.0), // Adjust border radius
                                                    ),
                                                    actions: [
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16), // Adjust horizontal and vertical padding for the button
                                                        child: TextButton(
                                                          child: const Text(
                                                            'OK',
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.w700,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          style: ButtonStyle(
                                                            backgroundColor: MaterialStateProperty.all(Color(0xFF37B989)),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                            _formKey.currentState!.reset();
                                          },

                                          child: Container(
                                            height: 35,
                                            width: 110,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF37B989),
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Add Item",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          )
                                      ),
                                    ),
                                  ),
                                ]
                            ),
                          ),
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

class PointCount {
  int _calculatePoints(int amount, int price, String productName) {
    int points = 0;

    if (productName.toLowerCase().contains("1000 ml")) {
      points = 100;
    } else if (productName.toLowerCase().contains("250 ml")) {
      points = 25;
    } else if (productName.toLowerCase().contains("200 ml")) {
      points = 20;
    } else if (productName.toLowerCase().contains("125 ml")) {
      points = 10;
    }

    return points * amount;
  }
}

class Match {
  static String matchName(String productName) {
    Map<String, String> productMatch = {
      "1000 ml Low Fat": "assets/images/um_1000_low-fat.jpg",
      "1000 ml Low Fat Coklat": "assets/images/um_1000_low-fat-coklat.jpg",
      "1000 ml Plain": "assets/images/um_1000_plain.jpg",
      "1000 ml Coklat": "assets/images/um_1000_coklat.jpg",

      "250 ml Low Fat": "assets/images/um_250_low-fat.jpg",
      "250 ml Low Fat Coklat": "assets/images/um_250_low-fat-coklat.jpg",
      "250 ml Plain": "assets/images/um_250_plain.jpg",
      "250 ml Coklat": "assets/images/um_250_coklat.jpg",
      "250 ml Stroberi": "assets/images/um_250_stroberi.jpg",
      "250 ml Moka": "assets/images/um_250_moka.jpg",

      "200 ml Plain": "assets/images/um_200_plain.jpg",
      "200 ml Coklat": "assets/images/um_200_coklat.jpg",
      "200 ml Stroberi": "assets/images/um_200_stroberi.jpg",
      "200 ml Karamel": "assets/images/um_200_karamel.jpg",
      "200 ml Taro": "assets/images/um_200_taro.jpg",

      "125 ml Coklat": "assets/images/um_125_coklat.jpg",
      "125 ml Stroberi": "assets/images/um_125_stroberi.jpg",
    };

    // Convert the product name and keywords to lowercase for case-insensitive matching
    String lowercaseProductName = productName.toLowerCase();

    // Get the matching image filename from the productMatch map
    for (String keyword in productMatch.keys) {
      List<String> keywords = keyword.toLowerCase().split(' ');
      bool containsAllWords = keywords.every((word) => lowercaseProductName.contains(word));
      if (containsAllWords) {
        return productMatch[keyword]!;
      }
    }

    // Return a default image filename if no match is found
    return "assets/images/um_250_plain.jpg";
  }
}