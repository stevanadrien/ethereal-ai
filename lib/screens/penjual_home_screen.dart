import 'package:flutter/material.dart';
import 'package:pic_2_plate_ai/screens/add_product_card.dart';
import 'package:pic_2_plate_ai/widgets/penjual_filter_bottom_sheet.dart';
import '../models/product.dart';
import '../widgets/penjual_product_card.dart';
import '../widgets/penjual_filter_bottom_sheet.dart'; // Import the filter bottom sheet
import '../models/filter.dart';
import 'package:flutter/services.dart';
 // Import the AddProductScreen

class PenjualHomeScreen extends StatefulWidget {
  @override
  _PenjualHomeScreenState createState() => _PenjualHomeScreenState();
}

class _PenjualHomeScreenState extends State<PenjualHomeScreen> {
  final List<Product> products = [
    Product(
      id: 'p1',
      title: 'Product 1',
      description: 'Description of Product 1',
      price: 30000,
      imageUrl: 'https://via.placeholder.com/150',
      expirationDate: '2024-12-31', // Use string date
      distance: '2 km away',
      foodType: 'Vegetarian',
      location: 'Jakarta, Indonesia',
      priceRange: 'Medium',
      stok: 10,// Add this line
    ),
    Product(
      id: 'p2',
      title: 'Product 2',
      description: 'Description of Product 2',
      price: 19999,
      imageUrl: 'https://via.placeholder.com/150',
      expirationDate: '2024-11-15', // Use string date
      distance: '5 km away',
      foodType: 'Non-Vegetarian',
      location: 'Bandung, Indonesia',
      priceRange: 'Low',
      stok: 10,// Add this line
    ),
    // Add more products as needed
  ];


  List<Product> _filteredProducts = [];
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load products (e.g., from a network or database)
    loadProducts();
  }

  void loadProducts() {
    // Load your products here and set the initial state
    setState(() {
      _filteredProducts = products;
    });
  }

  void _showPenjualFilterBottomSheet() {
    // Extract unique food types from the products
    final foodTypes = products.map((product) => product.foodType).toSet().toList();

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return PenjualFilterBottomSheet(
          onFilterApplied: (filter) {
            setState(() {
              // Apply filter logic here
              _filteredProducts = products.where((product) {
                return (filter.priceRanges == 'All' || filter.priceRanges == product.priceRange) &&
                    (filter.foodTypes.contains(product.foodType));
              }).toList();
            });
          },
          availableFoodTypes: foodTypes, // Pass the food types to the filter bottom sheet
        );
      },
    );
  }

  void _filterProducts(String query) {
    setState(() {
      _filteredProducts = products.where((product) {
        return product.title.toLowerCase().contains(query.toLowerCase()) ||
            product.description.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  Future<bool> _onWillPop() async {
    // Custom back navigation logic
    // For example, show a confirmation dialog
    final shouldExit = await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Exit'),
        content: Text('Are you sure you want to exit?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
        ],
      ),
    );
    return shouldExit ?? false;
  }

  void _removeProduct(String productId) {
    setState(() {
      _filteredProducts.removeWhere((product) => product.id == productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[800], // Changed from Colors.green[800] to Colors.yellow[800]
          centerTitle: true,
          title: Text(
            'Food Rescue',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.black, // Changed from Colors.white to Colors.black
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Row for the Store Button, Location Text Box, and Chat Button
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Store Button with Store Icon
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white, // Changed from Colors.yellow[200] to Colors.white
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.shopping_cart, color: Colors.black),
                        onPressed: () {
                          // Navigate to Store Screen
                          Navigator.pushNamed(context, '/shopping');
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    // Location Text Box
                    Expanded(
                      child: Container(
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white, // Changed from Colors.yellow[200] to Colors.white
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: TextField(
                          controller: _locationController,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.w600, // Semi-bold
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enter your location...',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black54,
                            ),
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            // Handle location input change if necessary
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    // Chat Button
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white, // Changed from Colors.yellow[200] to Colors.white
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.chat, color: Colors.black),
                        onPressed: () {
                          // Navigate to Chat Screen
                          Navigator.pushNamed(context, '/penjualchat');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // Filter Button
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    // Filter Button
                    Container(
                      height: 40,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white, // Changed from Colors.yellow[200] to Colors.white
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(Icons.filter_list, color: Colors.black),
                          onPressed: () => _showPenjualFilterBottomSheet(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    // Search Bar
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white, // Changed from Colors.yellow[200] to Colors.white
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: TextField(
                          controller: _searchController,
                          onChanged: _filterProducts,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.w600, // Semi-bold
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search products...',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black54,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true, // Prevents scrolling
                  physics: NeverScrollableScrollPhysics(), // Prevents scrolling
                  itemCount: _filteredProducts.length,
                  itemBuilder: (context, index) {
                    return PenjualProductCard(
                      product: _filteredProducts[index],
                      index: index, // Pass the index here
                      onRemove: () => _removeProduct(_filteredProducts[index].id),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigate to AddProductScreen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProductCard(),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
