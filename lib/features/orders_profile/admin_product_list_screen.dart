import 'package:flutter/material.dart';

class AdminProductListScreen extends StatefulWidget {
  const AdminProductListScreen({super.key});

  @override
  State<AdminProductListScreen> createState() => _AdminProductListScreenState();
}

class _AdminProductListScreenState extends State<AdminProductListScreen> {
  // Mock data for the product list
  List<Map<String, dynamic>> products = [
    {
      "title": "Kera-Treat",
      "description": "Kera-Treat, The Keratin Hair Mask nourishes and restores your hair to the best of its natural ability...",
      "price": "999",
      "public": true,
      "status": "Available",
      "category": "Cosmetics",
    }
  ];

  // Function to show Add/Update Modal
  void _showProductForm({int? index}) {
    bool isUpdate = index != null;
    final titleController = TextEditingController(text: isUpdate ? products[index]["title"] : "");
    final descController = TextEditingController(text: isUpdate ? products[index]["description"] : "");
    final priceController = TextEditingController(text: isUpdate ? products[index]["price"] : "");
    bool isVisible = isUpdate ? products[index]["public"] : true;
    bool inStock = isUpdate ? (products[index]["status"] == "Available") : true;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(isUpdate ? "Update Product" : "Add New Product", 
                 style: const TextStyle(fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _textField("Title", titleController),
                _textField("Description", descController, maxLines: 3),
                Row(
                  children: [
                    Expanded(child: _textField("Category", TextEditingController(text: "Cosmetics"))),
                    const SizedBox(width: 10),
                    Expanded(child: _textField("Price", priceController)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    OutlinedButton(onPressed: () {}, child: const Text("Choose File")),
                    const SizedBox(width: 10),
                    const Text("No File Chosen", style: TextStyle(fontSize: 10)),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Visible"),
                    Switch(value: isVisible, onChanged: (val) => setModalState(() => isVisible = val)),
                    const Text("In Stock"),
                    Switch(value: inStock, onChanged: (val) => setModalState(() => inStock = val)),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
              onPressed: () {
                setState(() {
                  final productData = {
                    "title": titleController.text,
                    "description": descController.text,
                    "price": priceController.text,
                    "public": isVisible,
                    "status": inStock ? "Available" : "Out of Stock",
                    "category": "Cosmetics",
                  };
                  if (isUpdate) {
                    products[index] = productData;
                  } else {
                    products.add(productData);
                  }
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Product List", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                        ElevatedButton(
                          onPressed: () => _showProductForm(),
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7B81FF)),
                          child: const Text("Add Product"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ...products.asMap().entries.map((entry) => _productItem(entry.value, entry.key)),
                  ],
                ),
              ),
            ),
            _footer(),
          ],
        ),
      ),
    );
  }

  Widget _productItem(Map<String, dynamic> product, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              onPressed: () => setState(() => products.removeAt(index)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              child: const Text("Delete", style: TextStyle(fontSize: 12)),
            ),
          ),
          GestureDetector(
            onTap: () => _showProductForm(index: index),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product["title"], style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(product["description"], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 10),
                Text("Price: Rs. ${product["price"]}", style: const TextStyle(fontWeight: FontWeight.bold)),
                Text("Public: ${product["public"] ? 'Yes' : 'No'}", 
                     style: TextStyle(color: product["public"] ? Colors.red : Colors.grey)),
                Text("Status: ${product["status"]}", 
                     style: TextStyle(color: product["status"] == "Available" ? Colors.red : Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
      ),
    );
  }

  Widget _header() => Padding(
    padding: const EdgeInsets.all(15),
    child: Row(children: [
      const Text("The\nElegance.", style: TextStyle(fontWeight: FontWeight.bold)),
      const Spacer(),
      const Icon(Icons.search),
      const SizedBox(width: 15),
      const Icon(Icons.menu),
    ]),
  );

  Widget _footer() => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(15),
    color: const Color(0xFFD9D9D9),
    child: const Text('© 2026 TheElegance. All Rights Reserved.', textAlign: TextAlign.center, style: TextStyle(fontSize: 10)),
  );
}