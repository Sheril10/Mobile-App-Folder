import 'package:flutter/material.dart';
import '../../core/widgets/common_input_field.dart';
import '../../core/widgets/primary_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Column(
                  children: [
                    Text('Signup', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    CommonInputField(label: 'Enter Name:'),
                    CommonInputField(label: 'Enter Email:'),
                    CommonInputField(label: 'Set Password:', isPassword: true),
                    CommonInputField(label: 'Confirm Password:', isPassword: true),
                    CommonInputField(label: 'Phone no. :'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              PrimaryButton(text: 'Sign-up', onPressed: () {
                // Signup logic
              }),
              const SizedBox(height: 40), // Extra space for keyboard comfort
            ],
          ),
        ),
      ),
    );
  }
}