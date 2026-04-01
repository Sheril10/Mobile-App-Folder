import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/widgets/primary_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(icon: const Icon(Icons.favorite_border, color: Colors.black), onPressed: () {}),
          IconButton(icon: const Icon(Icons.share, color: Colors.black), onPressed: () {}),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                "https://via.placeholder.com/300", // Replace with kera_mask.png
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimens.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Kera-Treat Hair Mask", style: AppTextStyles.screenHeading),
                  const SizedBox(height: 8),
                  const Text("Rs. 999", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryButton)),
                  const SizedBox(height: 20),
                  const Text("Description", style: AppTextStyles.productTitle),
                  const SizedBox(height: 8),
                  const Text(
                    "Our Kera-Treat Hair Mask is designed to deeply nourish and repair damaged hair. Infused with keratin and natural oils, it restores shine and strength from root to tip.",
                    style: AppTextStyles.body,
                  ),
                  const SizedBox(height: 20),
                  const Text("Ingredients", style: AppTextStyles.productTitle),
                  const BulletPoint(text: "Hydrolyzed Keratin"),
                  const BulletPoint(text: "Argan Oil & Shea Butter"),
                  const BulletPoint(text: "Vitamin E"),
                  const SizedBox(height: 30),
                  PrimaryButton(text: "Add to Cart", onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.circle, size: 6, color: AppColors.textHint),
          const SizedBox(width: 10),
          Text(text, style: AppTextStyles.body),
        ],
      ),
    );
  }
}