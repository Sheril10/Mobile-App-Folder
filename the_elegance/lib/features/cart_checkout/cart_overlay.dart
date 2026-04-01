import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

class CartOverlay extends StatelessWidget {
  const CartOverlay({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => const CartOverlay(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Shopping Cart", style: AppTextStyles.productTitle),
              IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
            ],
          ),
          const Divider(),
          ListTile(
            leading: Image.network("https://via.placeholder.com/50"),
            title: const Text("Kera-Treat Hair Mask"),
            subtitle: const Text("Rs. 999 x 1"),
            trailing: const Text("Rs. 999", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Spacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Subtotal:", style: AppTextStyles.body),
              Text("Rs. 999", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.dark, padding: const EdgeInsets.all(16)),
              onPressed: () => Navigator.pushNamed(context, '/checkout'),
              child: const Text("Checkout", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}