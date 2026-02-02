import 'package:flutter/material.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/auth/get_started_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/auth/otp_screen.dart';
import '../screens/auth/email_verification_screen.dart';
import '../screens/auth/forgot_password_screen.dart';
import '../screens/auth/reset_password_screen.dart';
import '../screens/auth/biometric_login_screen.dart';
import '../screens/auth/logout_success_screen.dart';
import '../screens/main/main_navigation.dart';
import '../screens/accounts/account_list_screen.dart';
import '../screens/accounts/account_details_screen.dart';
import '../screens/accounts/account_statements_screen.dart';
import '../screens/accounts/statement_preview_screen.dart';
// Phase 1C screens
import '../screens/transactions/transaction_filter_screen.dart';
import '../screens/transactions/transaction_detail_screen.dart';
import '../screens/transfer/transfer_options_screen.dart';
import '../screens/transfer/beneficiary_list_screen.dart';
import '../screens/transfer/add_beneficiary_screen.dart';
import '../screens/transfer/transfer_form_screen.dart';
import '../screens/transfer/transfer_confirmation_screen.dart';
import '../screens/transfer/transfer_success_screen.dart';
import '../screens/transfer/transfer_failure_screen.dart';
import '../screens/bills/bill_payment_screen.dart';
import '../screens/bills/bill_payment_form_screen.dart';
import '../screens/bills/bill_payment_confirmation_screen.dart';
import '../screens/bills/bill_payment_success_screen.dart';
import '../screens/qr/qr_payment_screen.dart';
// Phase 1D screens
import '../screens/profile/edit_profile_screen.dart';
import '../screens/security/security_settings_screen.dart';
import '../screens/security/change_password_screen.dart';
import '../screens/security/change_pin_screen.dart';
import '../screens/security/app_lock_screen.dart';
import '../screens/notifications/notifications_screen.dart';
import '../screens/settings/theme_settings_screen.dart';
import '../screens/settings/notification_settings_screen.dart';
// Help & Legal screens
import '../screens/help/help_support_screen.dart';
import '../screens/help/faq_screen.dart';
import '../screens/help/contact_bank_screen.dart';
import '../screens/legal/terms_conditions_screen.dart';
import '../screens/legal/privacy_policy_screen.dart';
import '../screens/about/about_app_screen.dart';
// Common screens
import '../screens/common/loading_screen.dart';
import '../screens/common/empty_state_screen.dart';
import '../screens/common/offline_screen.dart';
import '../screens/common/generic_result_screen.dart';

/// App route names
class AppRoutes {
  AppRoutes._();

  // Auth routes
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String getStarted = '/get-started';
  static const String login = '/login';
  static const String register = '/register';
  static const String otp = '/otp';
  static const String emailVerification = '/email-verification';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String biometricLogin = '/biometric-login';
  static const String logoutSuccess = '/logout-success';
  static const String dashboard = '/dashboard';
  static const String main = '/main';

  // Account routes
  static const String accountList = '/account-list';
  static const String accountDetails = '/account-details';
  static const String accountStatements = '/account-statements';
  static const String statementPreview = '/statement-preview';

  // Transaction routes
  static const String transactionFilter = '/transaction-filter';
  static const String transactionDetail = '/transaction-detail';

  // Transfer routes
  static const String transferOptions = '/transfer-options';
  static const String beneficiaryList = '/beneficiary-list';
  static const String addBeneficiary = '/add-beneficiary';
  static const String transferForm = '/transfer-form';
  static const String transferConfirmation = '/transfer-confirmation';
  static const String transferSuccess = '/transfer-success';
  static const String transferFailure = '/transfer-failure';

  // Bill payment routes
  static const String billPayment = '/bill-payment';
  static const String billPaymentForm = '/bill-payment-form';
  static const String billPaymentConfirmation = '/bill-payment-confirmation';
  static const String billPaymentSuccess = '/bill-payment-success';

  // QR routes
  static const String qrPayment = '/qr-payment';

  // Profile routes
  static const String editProfile = '/edit-profile';

  // Security routes
  static const String securitySettings = '/security-settings';
  static const String changePassword = '/change-password';
  static const String changePin = '/change-pin';
  static const String appLock = '/app-lock';

  // Other routes
  static const String notifications = '/notifications';
  static const String themeSettings = '/theme-settings';
  static const String notificationSettings = '/notification-settings';

  // Help & Support routes
  static const String helpSupport = '/help-support';
  static const String faq = '/faq';
  static const String contactBank = '/contact-bank';

  // Legal routes
  static const String termsConditions = '/terms-conditions';
  static const String privacyPolicy = '/privacy-policy';

  // About route
  static const String aboutApp = '/about-app';

  // System routes
  static const String loading = '/loading';
  static const String emptyState = '/empty-state';
  static const String offline = '/offline';
  static const String genericSuccess = '/generic-success';
  static const String genericFailure = '/generic-failure';

  /// Generate routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Auth routes
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
      case forgotPassword:
        return _buildRoute(const ForgotPasswordScreen(), settings);
      case resetPassword:
        return _buildRoute(const ResetPasswordScreen(), settings);
      case biometricLogin:
        return _buildRoute(const BiometricLoginScreen(), settings);
      case logoutSuccess:
        return _buildRoute(const LogoutSuccessScreen(), settings);
      case dashboard:
        return _buildRoute(const MainNavigation(), settings);
      case main:
        return _buildRoute(const MainNavigation(), settings);

      // Account routes
      case accountList:
        return _buildRoute(const AccountListScreen(), settings);
      case accountDetails:
        final accountId = settings.arguments as String? ?? 'ACC001';
        return _buildRoute(
          AccountDetailsScreen(accountId: accountId),
          settings,
        );
      case accountStatements:
        final accountId = settings.arguments as String?;
        return _buildRoute(
          AccountStatementsScreen(accountId: accountId),
          settings,
        );
      case statementPreview:
        final args = settings.arguments as Map<String, dynamic>?;
        return _buildRoute(StatementPreviewScreen(args: args), settings);

      // Transaction routes
      case transactionFilter:
        return _buildRoute(const TransactionFilterScreen(), settings);
      case transactionDetail:
        final transaction = settings.arguments as Map<String, dynamic>? ?? {};
        return _buildRoute(
          TransactionDetailScreen(transaction: transaction),
          settings,
        );

      // Transfer routes
      case transferOptions:
        return _buildRoute(const TransferOptionsScreen(), settings);
      case beneficiaryList:
        return _buildRoute(const BeneficiaryListScreen(), settings);
      case addBeneficiary:
        return _buildRoute(const AddBeneficiaryScreen(), settings);
      case transferForm:
        final args = settings.arguments as Map<String, dynamic>?;
        return _buildRoute(TransferFormScreen(args: args), settings);
      case transferConfirmation:
        final args = settings.arguments as Map<String, dynamic>?;
        return _buildRoute(TransferConfirmationScreen(args: args), settings);
      case transferSuccess:
        final args = settings.arguments as Map<String, dynamic>?;
        return _buildRoute(TransferSuccessScreen(args: args), settings);
      case transferFailure:
        final args = settings.arguments as Map<String, dynamic>?;
        return _buildRoute(TransferFailureScreen(args: args), settings);

      // Bill payment routes
      case billPayment:
        return _buildRoute(const BillPaymentScreen(), settings);
      case billPaymentForm:
        final args = settings.arguments as Map<String, dynamic>?;
        return _buildRoute(BillPaymentFormScreen(args: args), settings);
      case billPaymentConfirmation:
        final args = settings.arguments as Map<String, dynamic>?;
        return _buildRoute(BillPaymentConfirmationScreen(args: args), settings);
      case billPaymentSuccess:
        final args = settings.arguments as Map<String, dynamic>?;
        return _buildRoute(BillPaymentSuccessScreen(args: args), settings);

      // QR routes
      case qrPayment:
        return _buildRoute(const QrPaymentScreen(), settings);

      // Profile routes
      case editProfile:
        return _buildRoute(const EditProfileScreen(), settings);

      // Security routes
      case securitySettings:
        return _buildRoute(const SecuritySettingsScreen(), settings);
      case changePassword:
        return _buildRoute(const ChangePasswordScreen(), settings);
      case changePin:
        return _buildRoute(const ChangePinScreen(), settings);
      case appLock:
        return _buildRoute(const AppLockScreen(), settings);

      // Other routes
      case notifications:
        return _buildRoute(const NotificationsScreen(), settings);
      case themeSettings:
        return _buildRoute(const ThemeSettingsScreen(), settings);
      case notificationSettings:
        return _buildRoute(const NotificationSettingsScreen(), settings);

      // Help & Support routes
      case helpSupport:
        return _buildRoute(const HelpSupportScreen(), settings);
      case faq:
        return _buildRoute(const FaqScreen(), settings);
      case contactBank:
        return _buildRoute(const ContactBankScreen(), settings);

      // Legal routes
      case termsConditions:
        return _buildRoute(const TermsConditionsScreen(), settings);
      case privacyPolicy:
        return _buildRoute(const PrivacyPolicyScreen(), settings);

      // About route
      case aboutApp:
        return _buildRoute(const AboutAppScreen(), settings);

      // System routes
      case loading:
        final message = settings.arguments as String?;
        return _buildRoute(LoadingScreen(message: message), settings);
      case emptyState:
        return _buildRoute(const EmptyStateScreen(), settings);
      case offline:
        return _buildRoute(const OfflineScreen(), settings);
      case genericSuccess:
        return _buildRoute(const GenericSuccessScreen(), settings);
      case genericFailure:
        return _buildRoute(const GenericFailureScreen(), settings);

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
