import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/widgets/common_input_field.dart';
import '../../core/widgets/primary_button.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("CHECKOUT"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Shipping Information", style: AppTextStyles.productTitle),
            const SizedBox(height: 16),
            const CommonInputField(label: "Full Name", hint: "Name"),
            const SizedBox(height: 12),
            const CommonInputField(label: "Phone Number", hint: "Phone"),
            const SizedBox(height: 12),
            const CommonInputField(label: "Email", hint: "Email"),
            const SizedBox(height: 12),
            const CommonInputField(label: "Address", hint: "Full Address"),
            const SizedBox(height: 24),
            
            const Text("Payment", style: AppTextStyles.productTitle),
            const SizedBox(height: 12),
            // Mock Payment Selectors
            _buildPaymentOption("Cash On Delivery (COD)", true),
            _buildPaymentOption("Card Payment", false),
            
            const SizedBox(height: 32),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Amount:", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Rs. 1,250", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              text: "Place Order", 
              backgroundColor: AppColors.primaryButton, 
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String title, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? AppColors.primaryButton : Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(isSelected ? Icons.radio_button_checked : Icons.radio_button_off, color: AppColors.primaryButton),
          const SizedBox(width: 12),
          Text(title),
        ],
      ),
    );
  }
}