import 'package:flutter/material.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/auth/get_started_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/auth/otp_screen.dart';
import '../screens/auth/email_verification_screen.dart';
import '../screens/main/main_navigation.dart';
import '../screens/accounts/account_list_screen.dart';
import '../screens/accounts/account_details_screen.dart';

/// App route names
class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String getStarted = '/get-started';
  static const String login = '/login';
  static const String register = '/register';
  static const String otp = '/otp';
  static const String emailVerification = '/email-verification';
  static const String dashboard = '/dashboard';
  static const String main = '/main';
  static const String accountList = '/account-list';
  static const String accountDetails = '/account-details';

  /// Generate routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _buildRoute(const SplashScreen(), settings);
      case onboarding:
        return _buildRoute(const OnboardingScreen(), settings);
      case getStarted:
        return _buildRoute(const GetStartedScreen(), settings);
      case login:
        return _buildRoute(const LoginScreen(), settings);
      case register:
        return _buildRoute(const RegisterScreen(), settings);
      case otp:
        return _buildRoute(const OtpScreen(), settings);
      case emailVerification:
        return _buildRoute(const EmailVerificationScreen(), settings);
      case dashboard:
        // Dashboard now routes to main navigation
        return _buildRoute(const MainNavigation(), settings);
      case main:
        return _buildRoute(const MainNavigation(), settings);
      case accountList:
        return _buildRoute(const AccountListScreen(), settings);
      case accountDetails:
        final accountId = settings.arguments as String? ?? 'ACC001';
        return _buildRoute(
          AccountDetailsScreen(accountId: accountId),
          settings,
        );
      default:
        return _buildRoute(const SplashScreen(), settings);
    }
  }

  static PageRouteBuilder _buildRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
