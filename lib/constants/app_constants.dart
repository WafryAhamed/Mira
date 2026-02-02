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

  // ========== 10 COMPREHENSIVE DEMO DATASETS ==========

  // 1️⃣ USER PROFILES DATASET (10 users - Multi-religion)
  static const List<Map<String, dynamic>> userProfiles = [
    // Buddhist/Sinhala
    {
      'name': 'Kasun Perera',
      'nic': '199812345678',
      'phone': '+94 77 123 4567',
      'email': 'kasun.perera@mira.lk',
      'religion': 'Buddhist',
    },
    {
      'name': 'Nimal Fernando',
      'nic': '198756789012',
      'phone': '+94 71 234 5678',
      'email': 'nimal.fernando@mira.lk',
      'religion': 'Buddhist',
    },
    {
      'name': 'Tharindu Silva',
      'nic': '199234567890',
      'phone': '+94 76 345 6789',
      'email': 'tharindu.silva@mira.lk',
      'religion': 'Buddhist',
    },
    {
      'name': 'Chamari Wickramasinghe',
      'nic': '199567890123',
      'phone': '+94 75 456 7890',
      'email': 'chamari.w@mira.lk',
      'religion': 'Buddhist',
    },

    // Muslim
    {
      'name': 'Mohamed Aroos',
      'nic': '198823456789',
      'phone': '+94 77 567 8901',
      'email': 'mohamed.aroos@mira.lk',
      'religion': 'Muslim',
    },
    {
      'name': 'Ahamed Rizwan',
      'nic': '199078901234',
      'phone': '+94 71 678 9012',
      'email': 'ahamed.rizwan@mira.lk',
      'religion': 'Muslim',
    },
    {
      'name': 'Fathima Nazeera',
      'nic': '199389012345',
      'phone': '+94 76 789 0123',
      'email': 'fathima.nazeera@mira.lk',
      'religion': 'Muslim',
    },

    // Hindu/Tamil
    {
      'name': 'Suresh Kumar',
      'nic': '198990123456',
      'phone': '+94 75 890 1234',
      'email': 'suresh.kumar@mira.lk',
      'religion': 'Hindu',
    },
    {
      'name': 'Kavitha Rajan',
      'nic': '199201234567',
      'phone': '+94 77 901 2345',
      'email': 'kavitha.rajan@mira.lk',
      'religion': 'Hindu',
    },
    {
      'name': 'Arunthathy Devi',
      'nic': '199412345678',
      'phone': '+94 71 012 3456',
      'email': 'arunthathy.devi@mira.lk',
      'religion': 'Hindu',
    },
  ];

  // 2️⃣ BANK ACCOUNTS DATASET (10 accounts)
  static const List<Map<String, dynamic>> demoAccounts = [
    {
      'type': 'Savings',
      'number': '1234567890',
      'masked': '•••• 7890',
      'branch': 'Colombo Main',
      'balance': 2456800.00,
      'currency': 'LKR',
    },
    {
      'type': 'Current',
      'number': '0987654321',
      'masked': '•••• 4321',
      'branch': 'Kandy',
      'balance': 850000.00,
      'currency': 'LKR',
    },
    {
      'type': 'Savings',
      'number': '1122334455',
      'masked': '•••• 4455',
      'branch': 'Galle',
      'balance': 1250000.00,
      'currency': 'LKR',
    },
    {
      'type': 'Current',
      'number': '5566778899',
      'masked': '•••• 8899',
      'branch': 'Jaffna',
      'balance': 3200000.00,
      'currency': 'LKR',
    },
    {
      'type': 'Savings',
      'number': '2233445566',
      'masked': '•••• 5566',
      'branch': 'Kurunegala',
      'balance': 980000.00,
      'currency': 'LKR',
    },
    {
      'type': 'Savings',
      'number': '6677889900',
      'masked': '•••• 9900',
      'branch': 'Colombo Main',
      'balance': 1875000.00,
      'currency': 'LKR',
    },
    {
      'type': 'Current',
      'number': '3344556677',
      'masked': '•••• 6677',
      'branch': 'Kandy',
      'balance': 4150000.00,
      'currency': 'LKR',
    },
    {
      'type': 'Savings',
      'number': '7788990011',
      'masked': '•••• 0011',
      'branch': 'Galle',
      'balance': 675000.00,
      'currency': 'LKR',
    },
    {
      'type': 'Current',
      'number': '4455667788',
      'masked': '•••• 7788',
      'branch': 'Colombo Main',
      'balance': 2950000.00,
      'currency': 'LKR',
    },
    {
      'type': 'Savings',
      'number': '8899001122',
      'masked': '•••• 1122',
      'branch': 'Jaffna',
      'balance': 1320000.00,
      'currency': 'LKR',
    },
  ];

  // 3️⃣ BENEFICIARIES DATASET (10 beneficiaries - Multi-religion)
  static const List<Map<String, String>> demoBeneficiaries = [
    {
      'name': 'Nimal Fernando',
      'bank': 'Mira Bank',
      'branch': 'Colombo Main',
      'account': '1234567890',
    },
    {
      'name': 'Mohamed Ahamed Rizwan',
      'bank': 'Mira Bank',
      'branch': 'Kandy',
      'account': '0987654321',
    },
    {
      'name': 'Suresh Kumar',
      'bank': 'People\'s Bank',
      'branch': 'Galle',
      'account': '5678901234',
    },
    {
      'name': 'Fathima Nazeera',
      'bank': 'Commercial Bank',
      'branch': 'Jaffna',
      'account': '4321098765',
    },
    {
      'name': 'Tharindu Silva',
      'bank': 'Bank of Ceylon',
      'branch': 'Kurunegala',
      'account': '1122334455',
    },
    {
      'name': 'Priya Subramaniam',
      'bank': 'People\'s Bank',
      'branch': 'Colombo Main',
      'account': '6677889900',
    },
    {
      'name': 'Kasun Perera',
      'bank': 'Mira Bank',
      'branch': 'Galle',
      'account': '2233445566',
    },
    {
      'name': 'Kavitha Rajan',
      'bank': 'Commercial Bank',
      'branch': 'Kandy',
      'account': '7788990011',
    },
    {
      'name': 'Mohamed Aroos',
      'bank': 'Bank of Ceylon',
      'branch': 'Colombo Main',
      'account': '3344556677',
    },
    {
      'name': 'Chamari Wickramasinghe',
      'bank': 'Mira Bank',
      'branch': 'Jaffna',
      'account': '8899001122',
    },
  ];

  // 4️⃣ BILL PAYMENTS DATASET (10 bills - Sri Lankan providers)
  static const List<Map<String, dynamic>> demoBills = [
    {
      'type': 'Electricity',
      'provider': 'CEB',
      'accountNo': '100123456',
      'amount': 6200.00,
      'dueDate': '2026-02-15',
      'status': 'Pending',
    },
    {
      'type': 'Water',
      'provider': 'Water Board',
      'accountNo': '200234567',
      'amount': 1850.00,
      'dueDate': '2026-02-12',
      'status': 'Pending',
    },
    {
      'type': 'Mobile',
      'provider': 'Dialog',
      'accountNo': '0771234567',
      'amount': 2500.00,
      'dueDate': '2026-02-20',
      'status': 'Paid',
    },
    {
      'type': 'Internet',
      'provider': 'SLT',
      'accountNo': '300345678',
      'amount': 3200.00,
      'dueDate': '2026-02-18',
      'status': 'Pending',
    },
    {
      'type': 'Mobile',
      'provider': 'Mobitel',
      'accountNo': '0712345678',
      'amount': 1950.00,
      'dueDate': '2026-02-25',
      'status': 'Pending',
    },
    {
      'type': 'Electricity',
      'provider': 'CEB',
      'accountNo': '100456789',
      'amount': 8750.00,
      'dueDate': '2026-02-15',
      'status': 'Overdue',
    },
    {
      'type': 'Insurance',
      'provider': 'Ceylinco',
      'accountNo': '400567890',
      'amount': 12000.00,
      'dueDate': '2026-02-28',
      'status': 'Pending',
    },
    {
      'type': 'TV',
      'provider': 'Dialog TV',
      'accountNo': '500678901',
      'amount': 2200.00,
      'dueDate': '2026-02-10',
      'status': 'Paid',
    },
    {
      'type': 'Mobile',
      'provider': 'Hutch',
      'accountNo': '0763456789',
      'amount': 1600.00,
      'dueDate': '2026-02-22',
      'status': 'Pending',
    },
    {
      'type': 'Water',
      'provider': 'Water Board',
      'accountNo': '200789012',
      'amount': 2100.00,
      'dueDate': '2026-02-12',
      'status': 'Pending',
    },
  ];

  // 5️⃣ ACCOUNT STATEMENTS DATASET (10 statements)
  static const List<Map<String, dynamic>> demoStatements = [
    {
      'month': 'January',
      'year': 2026,
      'totalCredit': 320000.00,
      'totalDebit': 103200.00,
      'transactions': 24,
    },
    {
      'month': 'December',
      'year': 2025,
      'totalCredit': 285000.00,
      'totalDebit': 142000.00,
      'transactions': 31,
    },
    {
      'month': 'November',
      'year': 2025,
      'totalCredit': 310000.00,
      'totalDebit': 98500.00,
      'transactions': 28,
    },
    {
      'month': 'October',
      'year': 2025,
      'totalCredit': 295000.00,
      'totalDebit': 127000.00,
      'transactions': 26,
    },
    {
      'month': 'September',
      'year': 2025,
      'totalCredit': 320000.00,
      'totalDebit': 115000.00,
      'transactions': 30,
    },
    {
      'month': 'August',
      'year': 2025,
      'totalCredit': 305000.00,
      'totalDebit': 132000.00,
      'transactions': 29,
    },
    {
      'month': 'July',
      'year': 2025,
      'totalCredit': 315000.00,
      'totalDebit': 108000.00,
      'transactions': 27,
    },
    {
      'month': 'June',
      'year': 2025,
      'totalCredit': 290000.00,
      'totalDebit': 145000.00,
      'transactions': 33,
    },
    {
      'month': 'May',
      'year': 2025,
      'totalCredit': 325000.00,
      'totalDebit': 96000.00,
      'transactions': 25,
    },
    {
      'month': 'April',
      'year': 2025,
      'totalCredit': 300000.00,
      'totalDebit': 122000.00,
      'transactions': 28,
    },
  ];

  // 6️⃣ QR PAYMENTS DATASET (10 records - Sri Lankan merchants)
  static const List<Map<String, dynamic>> demoQRPayments = [
    {
      'merchant': 'Keells Super',
      'location': 'Colombo 03',
      'amount': 8500.00,
      'date': '2026-02-01',
      'status': 'Success',
    },
    {
      'merchant': 'Arpico Supercentre',
      'location': 'Kandy',
      'amount': 12300.00,
      'date': '2026-01-28',
      'status': 'Success',
    },
    {
      'merchant': 'Cargills Food City',
      'location': 'Galle',
      'amount': 5800.00,
      'date': '2026-01-25',
      'status': 'Success',
    },
    {
      'merchant': 'Odel',
      'location': 'Colombo 07',
      'amount': 18500.00,
      'date': '2026-01-22',
      'status': 'Success',
    },
    {
      'merchant': 'Laughs Pharmacy',
      'location': 'Nugegoda',
      'amount': 3200.00,
      'date': '2026-01-20',
      'status': 'Success',
    },
    {
      'merchant': 'Abans Showroom',
      'location': 'Maharagama',
      'amount': 45000.00,
      'date': '2026-01-18',
      'status': 'Success',
    },
    {
      'merchant': 'Softlogic',
      'location': 'Mount Lavinia',
      'amount': 32000.00,
      'date': '2026-01-15',
      'status': 'Success',
    },
    {
      'merchant': 'Ministry of Crab',
      'location': 'Colombo Fort',
      'amount': 15000.00,
      'date': '2026-01-12',
      'status': 'Success',
    },
    {
      'merchant': 'Kapruka Online',
      'location': 'Online',
      'amount': 6500.00,
      'date': '2026-01-10',
      'status': 'Success',
    },
    {
      'merchant': 'Daraz Pickup Point',
      'location': 'Dehiwala',
      'amount': 9800.00,
      'date': '2026-01-08',
      'status': 'Success',
    },
  ];

  // 7️⃣ HELP & SUPPORT DATASET (10 FAQs - Sri Lankan banking context)
  static const List<Map<String, String>> demoHelpFAQs = [
    {
      'question': 'What are the daily transaction limits?',
      'answer':
          'Daily limits vary by account type:\\n• Savings Account: LKR 500,000/day\\n• Current Account: LKR 1,000,000/day\\nYou can request limit increases through Settings.',
    },
    {
      'question': 'How do I add a beneficiary?',
      'answer':
          'Go to Send Money > Add Beneficiary and enter their account details. You can add beneficiaries from any Sri Lankan bank.',
    },
    {
      'question': 'What is the CEB bill payment process?',
      'answer':
          'Select Pay Bills > Electricity > CEB, enter your account number and confirm payment. Payments are processed instantly.',
    },
    {
      'question': 'How to reset my PIN?',
      'answer':
          'Go to Settings > Security > Change PIN. You will need to verify with OTP sent to your registered mobile number.',
    },
    {
      'question': 'Can I transfer to other Sri Lankan banks?',
      'answer':
          'Yes, you can transfer to any bank in Sri Lanka using SLIPS (Sri Lanka Interbank Payment System) instantly.',
    },
    {
      'question': 'What are the charges for Dialog mobile reloads?',
      'answer':
          'Mobile top-ups are free for amounts below LKR 5,000. A nominal fee of LKR 10 applies for larger amounts.',
    },
    {
      'question': 'How to download my account statement?',
      'answer':
          'Go to Accounts > Select Account > View Statement > Download PDF. You can download statements for up to 12 months.',
    },
    {
      'question': 'Is there a fee for QR payments?',
      'answer':
          'No, all QR payments at supported merchants (Keells, Cargills, Arpico, etc.) are completely free of charge.',
    },
    {
      'question': 'How do I contact customer support?',
      'answer':
          'Call our 24/7 hotline: +94 11 234 5678 or use in-app chat. Email support available at help@mira.lk',
    },
    {
      'question': 'What should I do if I forget my password?',
      'answer':
          'Click "Forgot Password" on the login screen and follow the OTP verification process using your registered mobile number.',
    },
  ];

  // 8️⃣ SECURITY LOGS DATASET (10 logs)
  static const List<Map<String, dynamic>> demoSecurityLogs = [
    {
      'event': 'Login Success',
      'device': 'Samsung Galaxy A54',
      'location': 'Colombo',
      'timestamp': '2026-02-02 18:45:23',
      'status': 'Success',
    },
    {
      'event': 'PIN Changed',
      'device': 'Samsung Galaxy A54',
      'location': 'Colombo',
      'timestamp': '2026-02-01 14:30:12',
      'status': 'Success',
    },
    {
      'event': 'Logout',
      'device': 'Samsung Galaxy A54',
      'location': 'Colombo',
      'timestamp': '2026-02-01 09:15:45',
      'status': 'Success',
    },
    {
      'event': 'Failed Login Attempt',
      'device': 'Unknown',
      'location': 'Kandy',
      'timestamp': '2026-01-31 22:18:33',
      'status': 'Blocked',
    },
    {
      'event': 'App Lock Triggered',
      'device': 'Samsung Galaxy A54',
      'location': 'Galle',
      'timestamp': '2026-01-30 16:22:18',
      'status': 'Security',
    },
    {
      'event': 'Biometric Auth Success',
      'device': 'Samsung Galaxy A54',
      'location': 'Colombo',
      'timestamp': '2026-01-29 08:10:55',
      'status': 'Success',
    },
    {
      'event': 'Password Reset',
      'device': 'iPhone 14',
      'location': 'Jaffna',
      'timestamp': '2026-01-28 11:45:30',
      'status': 'Success',
    },
    {
      'event': 'Session Timeout',
      'device': 'Samsung Galaxy A54',
      'location': 'Colombo',
      'timestamp': '2026-01-27 18:30:00',
      'status': 'Info',
    },
    {
      'event': 'Large Transaction Alert',
      'device': 'Samsung Galaxy A54',
      'location': 'Kurunegala',
      'timestamp': '2026-01-26 13:22:45',
      'status': 'Alert',
    },
    {
      'event': 'Login Success',
      'device': 'Xiaomi Redmi Note',
      'location': 'Negombo',
      'timestamp': '2026-01-25 07:55:12',
      'status': 'Success',
    },
  ];

  // 9️⃣ NOTIFICATIONS DATASET (10 notifications - Multi-religion names)
  static const List<Map<String, dynamic>> demoNotifications = [
    {
      'type': 'transaction',
      'title': 'Payment Received',
      'message': 'You received LKR 25,000.00 from Fathima Nazeera',
      'time': '2 min ago',
      'isRead': false,
    },
    {
      'type': 'transaction',
      'title': 'Bill Payment Successful',
      'message': 'CEB electricity bill of LKR 6,200.00 paid successfully',
      'time': '3 hours ago',
      'isRead': true,
    },
    {
      'type': 'security',
      'title': 'New Login',
      'message': 'Login from Samsung Galaxy A54 in Colombo',
      'time': '1 day ago',
      'isRead': true,
    },
    {
      'type': 'transaction',
      'title': 'Transfer Completed',
      'message': 'Transferred LKR 50,000.00 to Suresh Kumar',
      'time': '3 days ago',
      'isRead': true,
    },
    {
      'type': 'alert',
      'title': 'Low Balance Alert',
      'message': 'Your Savings Account balance is below LKR 10,000.00',
      'time': '5 days ago',
      'isRead': true,
    },
    {
      'type': 'transaction',
      'title': 'Salary Credit',
      'message': 'Salary of LKR 125,000.00 credited to your account',
      'time': '1 week ago',
      'isRead': true,
    },
    {
      'type': 'security',
      'title': 'PIN Changed',
      'message': 'Your transaction PIN was changed successfully',
      'time': '1 week ago',
      'isRead': true,
    },
    {
      'type': 'transaction',
      'title': 'QR Payment',
      'message': 'Paid LKR 8,500.00 at Keells Super Colombo 03',
      'time': '2 weeks ago',
      'isRead': true,
    },
    {
      'type': 'alert',
      'title': 'Bill Due Soon',
      'message': 'Your Dialog bill of LKR 2,500.00 is due on 20th Feb',
      'time': '2 weeks ago',
      'isRead': true,
    },
    {
      'type': 'transaction',
      'title': 'Transfer Received',
      'message': 'Received LKR 15,000.00 from Mohamed Ahamed Rizwan',
      'time': '3 weeks ago',
      'isRead': true,
    },
  ];

  // 🔟 TRANSACTION HISTORY EXPANDED (10 transactions - already exists, kept for reference)
  // This is dataset #10 - the existing transactionHistory serves as the 10th dataset
}
