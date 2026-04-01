import 'package:flutter/material.dart';
import '../../core/widgets/common_input_field.dart';
import '../../core/widgets/primary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Transparent AppBar allows for a back button without breaking the design
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
                    const Text('Login', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 30),
                    const CommonInputField(label: 'Enter Username/Email:'),
                    const CommonInputField(label: 'Password:', isPassword: true),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Add forgot password navigation here later
                        },
                        child: const Text('Forgot Password?', style: TextStyle(color: Colors.white70)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              PrimaryButton(text: 'Login', onPressed: () {
                // Login logic
              }),
              const SizedBox(height: 20), // Bottom padding for scroll
            ],
          ),
        ),
      ),
    );
  }
}