import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sec_me/manager/style_manager.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).go('/home'),
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
    );
  }
}
