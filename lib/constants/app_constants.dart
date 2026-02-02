/// App-wide constants for Mira Banking App
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'Mira';
  static const String appTagline = 'Modern Banking, Simplified';
  static const String appVersion = '1.0.0';

  // Animation Durations
  static const Duration splashDuration = Duration(seconds: 3);
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration pageTurnDuration = Duration(milliseconds: 400);

  // OTP
  static const int otpLength = 6;
  static const int otpResendSeconds = 60;

  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 32;
  static const int phoneNumberLength = 10;
  static const int nicLength = 12;

  // Spacing
  static const double paddingXS = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXL = 32.0;
  static const double paddingXXL = 48.0;

  // Border Radius
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 24.0;
  static const double radiusRound = 100.0;

  // Icon Sizes
  static const double iconS = 16.0;
  static const double iconM = 24.0;
  static const double iconL = 32.0;
  static const double iconXL = 48.0;

  // Button Heights
  static const double buttonHeightS = 40.0;
  static const double buttonHeightM = 48.0;
  static const double buttonHeightL = 56.0;

  // Input Heights
  static const double inputHeight = 56.0;

  // Onboarding
  static const int onboardingPageCount = 3;
}

/// Mock data for demo purposes
class MockData {
  MockData._();

  // Demo credentials
  static const String demoEmail = 'demo@mira.com';
  static const String demoAccountNumber = '1234567890';
  static const String demoPassword = 'Demo@123';
  static const String demoOtp = '123456';

  // Demo user
  static const String demoUserName = 'John Doe';
  static const String demoUserPhone = '0771234567';
  static const String demoUserNic = '200012345678';

  // Onboarding content
  static const List<Map<String, String>> onboardingData = [
    {
      'title': 'Digital Banking',
      'subtitle': 'Experience the future of banking',
      'description':
          'Manage your finances anytime, anywhere with our secure and intuitive mobile banking platform.',
    },
    {
      'title': 'Secure Transactions',
      'subtitle': 'Your money is safe with us',
      'description':
          'Bank-grade security with biometric authentication and real-time fraud protection for all your transactions.',
    },
    {
      'title': 'Easy Transfers',
      'subtitle': 'Send money in seconds',
      'description':
          'Transfer funds instantly to anyone, pay bills effortlessly, and manage all your payments in one place.',
    },
  ];
}
