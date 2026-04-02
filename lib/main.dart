import 'package:flutter/material.dart';
// Importing the first screen of the app
import 'features/auth/welcome_screen.dart'; 

void main() {
  runApp(const TheEleganceApp());
}

class TheEleganceApp extends StatelessWidget {
  const TheEleganceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Elegance',
      debugShowCheckedModeBanner: false,
      
      // Setting up the global look of the app
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.black,
        
        // Defining the default font style for the app
        fontFamily: 'Georgia', // Or your preferred elegant font
        
        // Global styling for all ElevatedButtons (Pill shape, Black background)
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        
        // Making the AppBar transparent by default across the app
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        useMaterial3: true,
      ),

      // The app starts here
      home: const WelcomeScreen(), 
    );
  }
}