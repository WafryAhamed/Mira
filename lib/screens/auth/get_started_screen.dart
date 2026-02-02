import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';
import '../../widgets/custom_button.dart';
import '../../routes/app_routes.dart';

/// Get Started screen with Login and Register options
class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingL),
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Logo and Branding
              _buildBranding(),

              const Spacer(flex: 2),

              // Welcome Text
              _buildWelcomeText(),

              const Spacer(flex: 1),

              // Action Buttons
              _buildActionButtons(context),

              const SizedBox(height: AppConstants.paddingL),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBranding() {
    return Column(
      children: [
        // Logo
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'M',
              style: AppTextStyles.h1.copyWith(
                fontSize: 48,
                color: AppColors.textOnPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppConstants.paddingL),

        // App Name
        Text(
          AppConstants.appName,
          style: AppTextStyles.h2.copyWith(
            color: AppColors.textPrimary,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: AppConstants.paddingS),

        // Tagline
        Text(
          AppConstants.appTagline,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      children: [
        Text(
          'Welcome to Mira',
          style: AppTextStyles.h3.copyWith(color: AppColors.textPrimary),
        ),
        const SizedBox(height: AppConstants.paddingS),
        Text(
          'Your trusted partner for digital banking.\nManage your finances with ease and security.',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        // Login Button
        CustomButton(
          text: 'Login',
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.login);
          },
          icon: Icons.login_rounded,
        ),
        const SizedBox(height: AppConstants.paddingM),

        // Register Button
        CustomButton(
          text: 'Create Account',
          variant: ButtonVariant.outlined,
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.register);
          },
          icon: Icons.person_add_rounded,
        ),
        const SizedBox(height: AppConstants.paddingL),

        // Terms and Privacy
        Text.rich(
          TextSpan(
            text: 'By continuing, you agree to our ',
            style: AppTextStyles.caption,
            children: [
              TextSpan(
                text: 'Terms of Service',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextSpan(text: ' and '),
              TextSpan(
                text: 'Privacy Policy',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
