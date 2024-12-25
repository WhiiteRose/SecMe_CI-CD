import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sec_me/manager/auth_manager.dart';
import 'package:sec_me/manager/style_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    final email = emailController.text;
    final password = passwordController.text;
    final user = await AuthManager().login(email, password);
    if (user != null) {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).goNamed('home');
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppColors.errorColor,
          content: Text("Email or Password incorrect"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/logo_secme_2blue.png',
                width: 150, height: 150),
            const SizedBox(height: 20),
            const Text(
              "Welcome Back !",
              style: AppTextStyles.headline1,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              style: const TextStyle(color: AppColors.textColor),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",
                hintStyle: TextStyle(color: AppColors.hinttextColor),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              style: const TextStyle(color: AppColors.textColor),
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",
                hintStyle: TextStyle(color: AppColors.hinttextColor),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: login,
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account ?",
                    style: TextStyle(color: AppColors.textColor)),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).goNamed('register');
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
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
