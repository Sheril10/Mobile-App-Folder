import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/widgets/primary_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Thank You For Placing Your Order!", 
                textAlign: TextAlign.center,
                style: AppTextStyles.screenHeading,
              ),
              const SizedBox(height: 16),
              const Text("Will send you notification when it reaches your location.",
                textAlign: TextAlign.center,
                style: AppTextStyles.hint,
              ),
              const SizedBox(height: 40),
              PrimaryButton(
                text: "Ok", 
                backgroundColor: AppColors.primaryButton,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}