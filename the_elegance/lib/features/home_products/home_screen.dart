import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import 'widgets/product_card.dart';
import '../../core/widgets/app_logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.white,
            elevation: 0,
            // Mini logo for the AppBar
            title: const AppLogo(height: 35),
            centerTitle: false,
            actions: [
              IconButton(icon: const Icon(Icons.notifications_none, color: Colors.black), onPressed: () {}),
              IconButton(
                icon: const Icon(Icons.person_outline, color: Colors.black), 
                onPressed: () => Navigator.pushNamed(context, '/profile')
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for cosmetics...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 180,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/images/banner.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Categories and Grid follow...
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Categories", style: AppTextStyles.productTitle),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/product-list'),
                    child: const Text("View All", style: TextStyle(color: AppColors.primaryButton)),
                  ),
                ],
              ),
            ),
          ),
          // Horizontal List and Grid
          SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCategoryChip("All", true),
                  _buildCategoryChip("Skin Care", false),
                  _buildCategoryChip("Hair Care", false),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/details'),
                  child: const ProductCard(
                    title: "Kera-Treat Mask",
                    price: "999",
                    imageUrl: "assets/images/product_mask.png",
                  ),
                ),
                childCount: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.dark : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Center(child: Text(label, style: TextStyle(color: isSelected ? Colors.white : AppColors.textMain))),
    );
  }
}