import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Profile", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Header
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFEEEEEE),
              child: Icon(Icons.person, size: 50, color: AppColors.dark),
            ),
            const SizedBox(height: 16),
            const Text("Elegance User", style: AppTextStyles.screenHeading),
            const Text("user@elegance.com", style: AppTextStyles.hint),
            const SizedBox(height: 32),

            // Profile Options List
            _buildProfileItem(Icons.shopping_bag_outlined, "My Orders", () {
              Navigator.pushNamed(context, '/orders');
            }),
            _buildProfileItem(Icons.location_on_outlined, "Shipping Address", () {}),
            _buildProfileItem(Icons.payment_outlined, "Payment Methods", () {}),
            _buildProfileItem(Icons.settings_outlined, "Settings", () {}),
            const Divider(indent: 20, endIndent: 20),
            _buildProfileItem(Icons.logout, "Logout", () {
              // Clears stack and goes back to login
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            }, isDestructive: true),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, VoidCallback onTap, {bool isDestructive = false}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: isDestructive ? Colors.red : AppColors.dark),
      title: Text(
        title,
        style: TextStyle(
          color: isDestructive ? Colors.red : AppColors.textMain,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    );
  }
}