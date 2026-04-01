import 'package:flutter/material.dart';

// ══════════════════════════════════════════════════════════════
//  LAB 5 — Login & Sign Up Screens
//  Your Name: Sheril bobby
//  Date: 11 march 2026
// ══════════════════════════════════════════════════════════════
//
//  INSTRUCTIONS:
//  • Fill in every spot marked with  // TODO
//  • Do NOT change anything else — structure, sizes, and spacing
//    are already set up to match the reference exactly
//  • Navigation between screens is already done for you ✅
//
//  HOW TO RUN:
//  1. Paste this file into  lib/main.dart
//  2. Run:  flutter run
// ══════════════════════════════════════════════════════════════

// ── App-wide color constants — do not change these ────────────
const Color kIndigo = Color(0xFF3F51B5);
const Color kIndigoLight = Color(0xFFE8EAF6);
const Color kTeal = Color(0xFF009688);
const Color kTealLight = Color(0xFFE0F2F1);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kIndigo),
        useMaterial3: false,
      ),
      home: const LoginScreen(),
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  SCREEN 1 — LOGIN
// ══════════════════════════════════════════════════════════════

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers and state — already declared for you
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ────────────────────────────────────────────────────────
      // TODO 1 of 12 — AppBar title and color

      // ────────────────────────────────────────────────────────
      appBar: AppBar(
        title: const Text(
          'Login', // TODO: change to 'Login'
        ),
        backgroundColor:kIndigo, // TODO: change to kIndigo
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),

            // ──────────────────────────────────────────────────
            // TODO 2 of 12 — Hero icon (CircleAvatar)
            // ──────────────────────────────────────────────────
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: kIndigoLight,
                    child: const Icon(Icons.person, size: 36, color: kIndigo),
                  ),               

                  const SizedBox(height: 12),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF303F9F),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Sign in to continue to your account',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ──────────────────────────────────────────────────
            // TODO 3 of 12 — Email TextField styling
            // ──────────────────────────────────────────────────
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(
                  color: kIndigo, // TODO: change to kIndigo
                ),
                hintText: 'Enter your email',
                prefixIcon: const Icon(Icons.email, color: kIndigo), // TODO: change to Icon(Icons.email, color: kIndigo)
                filled: true,
                fillColor: kIndigoLight, // TODO: change to kIndigoLight
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: kIndigo, width: 2),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // ──────────────────────────────────────────────────
            // TODO 4 of 12 — Password TextField: obscureText + suffixIcon
            // ──────────────────────────────────────────────────
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword, // TODO: change to _obscurePassword
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(color: Colors.grey),
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                suffixIcon: IconButton( icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ) , onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                }
              ), 
                //   Icon: Icons.visibility  (when hidden)
                //         Icons.visibility_off  (when visible)
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: kIndigo, width: 2),
                ),
              ),
            ),

            // ──────────────────────────────────────────────────
            // TODO 5 of 12 — Forgot Password text color
            // ──────────────────────────────────────────────────
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: kIndigo, // TODO: change to kIndigo
                    fontSize: 12.5,
                  ),
                ),
              ),
            ),

            // ──────────────────────────────────────────────────
            // TODO 6 of 12 — SwitchListTile: title, value, activeColor, onChanged
            // ──────────────────────────────────────────────────
            Container(
              decoration: BoxDecoration(
                color: kIndigoLight,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFBBBEDD)),
              ),
              child: SwitchListTile(
                title: Text( _rememberMe ? 'Switch is ON' : 'Switch is OFF', // TODO: show 'Switch is ON' or 'Switch is OFF'
                ), // TODO: show 'Switch is ON' or 'Switch is OFF'
                //   based on the value of _rememberMe
                value: _rememberMe, // TODO: change to _rememberMe
                activeColor: kIndigo, // TODO: change to kIndigo
                onChanged: (bool val) {
                  setState(() => _rememberMe = val,);
                  // TODO: call setState to update _rememberMe = val
                },
              ),
            ),

            const SizedBox(height: 20),

            // ──────────────────────────────────────────────────
            // TODO 7 of 12 — Login ElevatedButton: color + label
            // ──────────────────────────────────────────────────
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kIndigo, // TODO: change to kIndigo
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Login', 
                  style: TextStyle(
                    color: Colors.white, // TODO: change to Colors.white
                    fontSize: 15, // TODO: change to 15
                    fontWeight: FontWeight.bold, // TODO: change to FontWeight.bold
                  ),
                  // Also set: color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ✅ Navigation already done — no TODO here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(color: Colors.grey),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignUpScreen()),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: kIndigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  SCREEN 2 — SIGN UP
// ══════════════════════════════════════════════════════════════

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Controllers and state — already declared for you
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _agreeToTerms = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ────────────────────────────────────────────────────────
      // TODO 8 of 12 — AppBar title and color
      // ────────────────────────────────────────────────────────
      appBar: AppBar(
        title: const Text(
          'Create Account', // TODO: change to 'Create Account'
        ),
        backgroundColor: kTeal, // TODO: change to kTeal
        // ✅ Back arrow appears automatically — no TODO needed
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),

            // ──────────────────────────────────────────────────
            // TODO 9 of 12 — Hero icon (CircleAvatar)
            // ──────────────────────────────────────────────────
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: kTealLight,
                    child: const Icon(Icons.person_add, size:36, color:kTeal),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Join Us Today',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00695C),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Create a free account to get started',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ──────────────────────────────────────────────────
            // TODO 10 of 12 — Full Name TextField styling
            // ──────────────────────────────────────────────────
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                labelStyle: const TextStyle(
                  color: kTeal, // TODO: change to kTeal
                ),
                hintText: 'Enter your full name',
                prefixIcon: const Icon(Icons.person, color: kTeal), // TODO: change to Icon(Icons.person, color: kTeal)
                filled: true,
                fillColor: kTealLight, // TODO: change to kTealLight
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: kTeal, // TODO: change to kTeal
                    width: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // ✅ Email TextField — fully done, study this as an example
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: const TextStyle(color: Colors.grey),
                hintText: 'Enter your email',
                prefixIcon: const Icon(Icons.email, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: kTeal, width: 2),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // ──────────────────────────────────────────────────
            // TODO 11 of 12 — Password TextField: obscureText + suffixIcon
            // ──────────────────────────────────────────────────
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(color: Colors.grey),
                hintText: 'Min. 8 characters',
                prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                suffixIcon: IconButton(
                  icon: Icon( _obscurePassword? Icons.visibility: Icons.visibility_off,
                  ),
                  onPressed: (){
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },), // TODO: same IconButton toggle as Login screen
                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: kTeal, width: 2),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // ──────────────────────────────────────────────────
            // TODO 12 of 12 — Checkbox + Create Account button
            // ──────────────────────────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [ Checkbox(
              value: _agreeToTerms,
              activeColor: kTeal,
              onChanged: (bool? val) { setState(() { _agreeToTerms = val!; }); },
              ),
                const Expanded(
                  child: Text(
                    'I agree to the Terms of Service and Privacy Policy',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kTeal, // TODO: change to kTeal
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Create Account', 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ✅ Navigation already done — no TODO here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(color: Colors.grey),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: kTeal, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
