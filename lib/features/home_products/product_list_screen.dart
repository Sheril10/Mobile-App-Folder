import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import 'widgets/product_card.dart';
import '../cart_checkout/cart_overlay.dart';
import '../../core/widgets/app_logo.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const AppLogo(height: 30),
        centerTitle: false,
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.black), onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => const CartOverlay(),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.black), 
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/banner.png'), 
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text("Cosmetics", style: AppTextStyles.screenHeading),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.72,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 4, 
              itemBuilder: (context, index) {
                bool isEven = index % 2 == 0;
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/details'),
                  child: ProductCard(
                    title: isEven ? "Kera-Treat Hair Mask" : "Berry Tint",
                    price: isEven ? "999" : "800",
                    imagePath: isEven 
                        ? "assets/images/product_mask.png" 
                        : "assets/images/product_tint.png",
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}