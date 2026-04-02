import 'package:flutter/material.dart';

class CommonInputField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextEditingController? controller; // Add this line

  const CommonInputField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.controller, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller, // Add this line
          obscureText: isPassword,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFD9D9D9),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}