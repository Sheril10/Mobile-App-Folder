import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double height; // We use height now to control size easily

  const AppLogo({
    super.key, 
    this.height = 80, // Default size for Login/Signup
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      height: height,
      fit: BoxFit.contain,
      // This handles the error if the file is missing so the app doesn't crash
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.broken_image, size: 50, color: Colors.grey);
      },
    );
  }
}