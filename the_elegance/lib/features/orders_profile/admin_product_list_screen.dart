import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

class AdminProductListScreen extends StatelessWidget {
  const AdminProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Inventory", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box, color: AppColors.primaryButton),
            onPressed: () => _showProductDialog(context, "Add New Product"),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.inventory_2, color: AppColors.dark),
              title: const Text("Kera-Treat Hair Mask"),
              subtitle: const Text("Price: Rs. 999 | Stock: 45"),
              trailing: TextButton(
                onPressed: () => _showProductDialog(context, "Update Product"),
                child: const Text("Edit"),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showProductDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(decoration: InputDecoration(hintText: "Product Name")),
            SizedBox(height: 10),
            TextField(decoration: InputDecoration(hintText: "Price"), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("Save")),
        ],
      ),
    );
  }
}