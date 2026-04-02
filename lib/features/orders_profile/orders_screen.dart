import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, leading: const BackButton(color: Colors.black)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('My Orders', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Order # 43 - 3/30/2026', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  const Divider(height: 30),
                  const Text('Shipping Information', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text('Ebrahim Khan - Lahore, Pakistan'),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Image.asset('assets/images/product_mask.png', height: 60),
                      const SizedBox(width: 15),
                      const Text('Kera-Treat Hair Mask\nQty: 04', style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}