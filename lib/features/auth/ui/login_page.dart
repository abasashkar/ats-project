import 'package:flutter/material.dart';
import 'package:resume_pro/core/design/shared/colors.dart';
import 'package:resume_pro/core/design/shared/styles.dart';
import 'package:resume_pro/features/auth/ui/widgets/input_textfield.dart';
import 'package:resume_pro/features/auth/ui/widgets/primary_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ✅ Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // ✅ Password visibility
  bool obscure = true;

  @override
  void dispose() {
    // ✅ Always dispose controllers
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(color: ResumeColors.primaryBlue, borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(width: 12),
                Text("ResumePro", style: ResumeStyles.h2),
              ],
            ),

            const SizedBox(height: 40),

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)]),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome Back!", style: ResumeStyles.h1.copyWith(color: Colors.white)),

                    const SizedBox(height: 35),

                    ResumeInputField(label: "Email", hint: "Email", controller: emailController),

                    const SizedBox(height: 25),

                    ResumeInputField(
                      label: "Password",
                      hint: "Password",
                      obscure: obscure,
                      controller: passwordController,
                      suffixIcon: IconButton(
                        icon: Icon(obscure ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                        onPressed: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 30),

                    ResumePrimaryButton(
                      text: "Login",
                      onPressed: () {
                        print("Email: ${emailController.text}");
                        print("Password: ${passwordController.text}");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
