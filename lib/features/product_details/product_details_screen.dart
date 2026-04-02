import 'package:flutter/material.dart';
import '../cart_checkout/cart_overlay.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;

  const ProductDetailsScreen({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.black)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border, color: Colors.black)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu, color: Colors.black)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumb header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              color: Colors.grey[200],
              child: Text("Home / Cosmetics / $title", style: const TextStyle(fontSize: 12)),
            ),
            
            // Product Image
            Image.asset(imagePath, width: double.infinity, fit: BoxFit.cover),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text("Rs. $price", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 20),

                  // Quantity and Add to Cart Row
                  Row(
                    children: [
                      _quantitySelector(),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD9D9D9),
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => const CartOverlay(),
                            );
                          },
                          child: const Text("Add to Cart", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Detailed Description Text
                  const Text(
                    "Kera-Treat, The Keratin Hair Mask nourishes and restores your hair to the best of its natural ability...",
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 20),
                  const Text("Why Choose The Elegance's Kera-Treat Molecular Repair Keratin Hair Mask?", 
                             style: TextStyle(fontWeight: FontWeight.bold)),
                  _bulletPoint("Deep Nourishment: Penetrates each hair follicle."),
                  _bulletPoint("Strengthens & Restores: Reduces breakage."),
                  _bulletPoint("Hydrating Formula: Replenishes lost moisture."),
                  
                  const SizedBox(height: 20),
                  const Text("Ingredients:", style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text("Hydrolyzed Keratin, Silk Protein, Vitamin E..."),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
            
            // Footer
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
    );
  }

  Widget _quantitySelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          _qtyBtn("-"),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text("1")),
          _qtyBtn("+"),
        ],
      ),
    );
  }

  Widget _qtyBtn(String text) => Text(text, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));

  Widget _bulletPoint(String text) => Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• ", style: TextStyle(fontWeight: FontWeight.bold)),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 13))),
      ],
    ),
  );
}