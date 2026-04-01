import 'package:elegance_app/features/home_products/home_screen.dart';
import 'package:flutter/material.dart';
import 'core/constants/app_constants.dart';
import 'features/auth/login_screen.dart';
import 'features/auth/signup_screen.dart';
import 'features/auth/forgot_password_screen.dart';
import 'features/home_products/product_list_screen.dart';
import 'features/product_details/product_details_screen.dart';
import 'features/cart_checkout/checkout_screen.dart';
import 'features/orders_profile/profile_screen.dart';
import 'features/orders_profile/orders_screen.dart';
import 'features/checkout_status/checkout_success_screen.dart';

void main() {
  runApp(const EleganceApp());
}

class EleganceApp extends StatelessWidget {
  const EleganceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Elegance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'Inter', // Ensure you add this font to pubspec
        scaffoldBackgroundColor: AppColors.background,
      ),
      // Set the initial screen
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/home': (context) => const HomeScreen(),
        '/details': (context) => const ProductDetailsScreen(),
        '/checkout': (context) => const CheckoutScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/orders': (context) => const OrdersScreen(),
        '/product-list': (context) => const ProductListScreen(),  
        '/success': (context) => const SuccessScreen(),
      },
    );
  }
}