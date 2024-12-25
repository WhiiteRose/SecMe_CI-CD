import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sec_me/manager/style_manager.dart';
import 'package:sec_me/pages/feedback_page.dart';
import 'package:sec_me/pages/home_page.dart';
import 'package:sec_me/pages/login_page.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sec_me/pages/register_page.dart';

void main() {
  runApp(
    BetterFeedback(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalFeedbackLocalizationsDelegate(),
      ],
      localeOverride: const Locale('fr'),
      theme: FeedbackThemeData(
        background: Colors.grey,
        feedbackSheetColor: Colors.grey[50]!,
        drawColors: [
          Colors.red,
          Colors.green,
          Colors.blue,
          Colors.yellow,
        ],
      ),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: "/login",
  routes: <RouteBase>[
    GoRoute(
        name: "home",
        path: "/home",
        builder: (context, state) {
          return const HomePage();
        }),
    GoRoute(
        name: "login",
        path: "/login",
        builder: (context, state) {
          return const LoginPage();
        }),
    GoRoute(
        name: "feedback",
        path: "/feedback",
        builder: (context, state) {
          return const FeedbackPage();
        }),
    GoRoute(
      name: 'register',
      path: '/register',
      builder: (context, state) {
        return const RegisterPage();
      },
    )
  ],
);
