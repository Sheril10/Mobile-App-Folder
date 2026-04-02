import 'package:flutter/material.dart';
import 'widgets/product_card.dart';
import '../orders_profile/admin_product_list_screen.dart'; // Admin Product Management
import '../orders_profile/admin_orders_screen.dart';       // Admin All Orders
import '../orders_profile/orders_screen.dart';             // Customer My Orders
import '../auth/welcome_screen.dart';                      // For Sign Out

class HomeScreen extends StatelessWidget {
  final bool isAdmin;

  const HomeScreen({super.key, this.isAdmin = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // --- HEADER SECTION ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('The', style: TextStyle(fontSize: 12)),
                      Text('Elegance.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  
                  // Icons visible only for customers
                  if (!isAdmin) ...[
                    IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
                  ],

                  // --- ROLE BASED POPUP MENU ---
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.menu),
                    offset: const Offset(0, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onSelected: (value) {
                      if (value == 'My Orders') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyOrdersScreen()),
                        );
                      } else if (value == 'Add Product') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AdminProductListScreen()),
                        );
                      } else if (value == 'All Orders') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AdminOrdersScreen()),
                        );
                      } else if (value == 'Sign Out') {
                        // Clears navigation history and returns to Welcome Screen
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                          (route) => false,
                        );
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem<String>(
                          enabled: false,
                          child: Text(
                            "Hi! Ebrahim Khan",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Home',
                          child: Text('Home', style: TextStyle(fontSize: 14)),
                        ),
                        
                        // Show Admin features or Customer features
                        if (isAdmin) ...[
                          const PopupMenuItem<String>(
                            value: 'Add Product',
                            child: Text('Add Product', style: TextStyle(fontSize: 14)),
                          ),
                          const PopupMenuItem<String>(
                            value: 'All Orders',
                            child: Text('All Orders', style: TextStyle(fontSize: 14)),
                          ),
                        ] else ...[
                          const PopupMenuItem<String>(
                            value: 'My Orders',
                            child: Text('My Orders', style: TextStyle(fontSize: 14)),
                          ),
                        ],

                        const PopupMenuItem<String>(
                          value: 'Sign Out',
                          child: Text(
                            'Sign Out',
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                        ),
                      ];
                    },
                  ),
                ],
              ),
            ),

            // --- MAIN CONTENT ---
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/banner.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Cosmetics',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          
                          // These would typically be mapped from your product list
                          const ProductCard(
                            title: 'Kera-Treat Hair Mask',
                            price: '999',
                            imagePath: 'assets/images/product_mask.png',
                          ),
                          const ProductCard(
                            title: 'Berry Tint',
                            price: '900',
                            imagePath: 'assets/images/product_tint.png',
                          ),
                        ],
                      ),
                    ),
                    
                    // --- FOOTER ---
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      color: const Color(0xFFD9D9D9),
                      child: const Text(
                        '© 2026 TheElegance. All Rights Reserved.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}