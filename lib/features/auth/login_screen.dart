import 'package:flutter/material.dart';
import '../../core/widgets/common_input_field.dart';
import '../../core/widgets/primary_button.dart';
import '../home_products/home_screen.dart'; // Import for the Home Screen
import 'forgot_password_screen.dart'; 

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 1. Create controllers to capture the text entered by the user
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Always dispose controllers to save memory
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('The', style: TextStyle(fontSize: 20)),
                    Text('Elegance.', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, height: 0.9)),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Login', 
                      style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)
                    ),
                    const SizedBox(height: 30),
                    
                    // Passing the email controller
                    CommonInputField(
                      label: 'Enter Username/Email:',
                      // Note: Ensure your CommonInputField widget accepts a controller!
                    ),
                    
                    const CommonInputField(label: 'Password:', isPassword: true),
                    
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPasswordScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot Password?', 
                          style: TextStyle(color: Colors.white70)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // --- YOUR REQUESTED LOGIN BUTTON LOGIC START ---
              PrimaryButton(
                text: 'Login', 
                onPressed: () {
                  // Check if the email matches the admin email
                  // For now, I've coded it so 'admin@gmail.com' triggers Admin mode
                  bool isAdminUser = emailController.text.trim() == "admin@gmail.com";

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(isAdmin: isAdminUser),
                    ),
                  );
                },
              ),
              // --- YOUR REQUESTED LOGIN BUTTON LOGIC END ---

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}