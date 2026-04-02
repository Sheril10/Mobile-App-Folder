import 'package:flutter/material.dart';
import 'checkout_screen.dart';

class CartOverlay extends StatelessWidget {
  const CartOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Shopping Cart", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
              ],
            ),
            Row(
              children: [
                Image.asset('assets/images/product_mask.png', height: 80, width: 70),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Kera-Treat Hair Mask", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Rs. 999.00", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    _qtyBtn("-"),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text("1")),
                    _qtyBtn("+"),
                  ],
                )
              ],
            ),
            const Divider(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("999.0 Rs"),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD9D9D9), foregroundColor: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckoutScreen()));
                },
                child: const Text("Checkout"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _qtyBtn(String text) => Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(4)),
    child: Text(text),
  );
}