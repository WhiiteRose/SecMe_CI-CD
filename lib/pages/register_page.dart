import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sec_me/manager/auth_manager.dart';
import 'package:sec_me/manager/style_manager.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String? passwordError;
  String? confirmPasswordError;

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Le mot de passe est requis';
    }
    RegExp regex =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');
    if (!regex.hasMatch(password)) {
      return 'Le mot de passe doit contenir:\n'
          '- Une majuscule.\n'
          '- Une minuscule.\n'
          '- Un caractère spécial.\n'
          '- 8 caractères.';
    }
    return null;
  }

  String? validateConfirmPassword(String confirmPassword) {
    if (confirmPassword != passwordController.text) {
      return 'Les mots de passe ne correspondent pas';
    }
    return null;
  }

  void register() async {
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    setState(() {
      passwordError = validatePassword(password);
      confirmPasswordError = validateConfirmPassword(confirmPassword);
    });

    if (passwordError == null && confirmPasswordError == null) {
      final user = await AuthManager().register(email, password);
      if (user != null) {
        // ignore: use_build_context_synchronously
        GoRouter.of(context).goNamed('/home');
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: AppColors.errorColor,
            content: Text("Impossible to create a new account"),
          ),
        );
      }
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
              "Welcome !",
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
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "Password",
                hintStyle: const TextStyle(color: AppColors.hinttextColor),
                errorText: passwordError,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: confirmPasswordController,
              style: const TextStyle(color: AppColors.textColor),
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "Confirm Password",
                hintStyle: const TextStyle(color: AppColors.hinttextColor),
                errorText: confirmPasswordError,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: register,
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Register',
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
                const Text("Already have an account ?",
                    style: TextStyle(color: AppColors.textColor)),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).goNamed('login');
                  },
                  child: const Text(
                    'Login',
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
