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
  static const String demoUserName = 'Kasun Perera';
  static const String demoUserPhone = '+94 77 123 4567';
  static const String demoUserNic = '199812345678';

  // Onboarding content
  static const List<Map<String, String>> onboardingData = [
    {
      'title': 'Digital Banking',
      'subtitle': 'Your trusted digital bank in Sri Lanka',
      'description':
          'Manage your finances anytime, anywhere with our secure and intuitive mobile banking platform.',
    },
    {
      'title': 'Secure Transactions',
      'subtitle': 'Your money is safe with us',
      'description':
          'Bank-grade security with biometric authentication and real-time fraud protection for Sri Lankan customers.',
    },
    {
      'title': 'Easy Transfers',
      'subtitle': 'Send money across Sri Lanka instantly',
      'description':
          'Transfer funds instantly to anyone in Sri Lanka, pay bills effortlessly, and manage all your payments in one place.',
    },
  ];

  // Mock transaction data
  static const List<Map<String, dynamic>> transactionHistory = [
    {
      'id': 'TXN001',
      'title': 'Salary Credit',
      'description': 'Salary - Mira Bank',
      'amount': 125000.00,
      'isCredit': true,
      'date': '2026-02-01',
      'category': 'income',
    },
    {
      'id': 'TXN002',
      'title': 'Keells Super',
      'description': 'Shopping Payment',
      'amount': 8500.00,
      'isCredit': false,
      'date': '2026-01-30',
      'category': 'shopping',
    },
    {
      'id': 'TXN003',
      'title': 'CEB Electricity Bill',
      'description': 'Ceylon Electricity Board',
      'amount': 6200.00,
      'isCredit': false,
      'date': '2026-01-28',
      'category': 'utilities',
    },
    {
      'id': 'TXN004',
      'title': 'Ministry of Crab',
      'description': 'Restaurant Payment',
      'amount': 12500.00,
      'isCredit': false,
      'date': '2026-01-27',
      'category': 'food',
    },
    {
      'id': 'TXN005',
      'title': 'Transfer Received',
      'description': 'From Mohamed Ahamed Rizwan',
      'amount': 25000.00,
      'isCredit': true,
      'date': '2026-01-25',
      'category': 'transfer',
    },
    {
      'id': 'TXN006',
      'title': 'Dialog Mobile Reload',
      'description': 'Mobile Top-up',
      'amount': 1500.00,
      'isCredit': false,
      'date': '2026-01-24',
      'category': 'entertainment',
    },
    {
      'id': 'TXN007',
      'title': 'Cargills Food City',
      'description': 'Grocery Shopping',
      'amount': 5800.00,
      'isCredit': false,
      'date': '2026-01-22',
      'category': 'shopping',
    },
    {
      'id': 'TXN008',
      'title': 'Water Bill',
      'description': 'National Water Board',
      'amount': 2200.00,
      'isCredit': false,
      'date': '2026-01-20',
      'category': 'utilities',
    },
  ];

  // Mock account data
  static const List<Map<String, dynamic>> accountList = [
    {
      'id': 'ACC001',
      'type': 'Savings Account',
      'accountNumber': '1234567890',
      'maskedNumber': '•••• •••• •••• 7890',
      'balance': 2456800.00,
      'currency': 'LKR',
      'branch': 'Colombo Main Branch',
      'status': 'Active',
      'openDate': '2024-01-15',
    },
    {
      'id': 'ACC002',
      'type': 'Current Account',
      'accountNumber': '0987654321',
      'maskedNumber': '•••• •••• •••• 4321',
      'balance': 850000.00,
      'currency': 'LKR',
      'branch': 'Kandy Branch',
      'status': 'Active',
      'openDate': '2024-03-20',
    },
  ];

  // Payment categories
  static const List<Map<String, dynamic>> paymentCategories = [
    {'id': 'PAY001', 'name': 'Electricity', 'icon': 'bolt'},
    {'id': 'PAY002', 'name': 'Water', 'icon': 'water_drop'},
    {'id': 'PAY003', 'name': 'Internet', 'icon': 'wifi'},
    {'id': 'PAY004', 'name': 'Phone', 'icon': 'phone_android'},
    {'id': 'PAY005', 'name': 'Insurance', 'icon': 'security'},
    {'id': 'PAY006', 'name': 'Education', 'icon': 'school'},
  ];

  // Recent payees (Multi-religion representation)
  static const List<Map<String, String>> recentPayees = [
    {'name': 'Nimal Fernando', 'account': '•••• 5678'}, // Buddhist/Sinhala
    {'name': 'Mohamed Ahamed Rizwan', 'account': '•••• 9012'}, // Muslim
    {'name': 'Suresh Kumar', 'account': '•••• 3456'}, // Hindu/Tamil
    {'name': 'Fathima Nazeera', 'account': '•••• 7891'}, // Muslim
    {'name': 'Priya Subramaniam', 'account': '•••• 2345'}, // Hindu/Tamil
  ];
}
