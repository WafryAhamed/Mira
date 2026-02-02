import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';

/// Terms & Conditions Screen - Scrollable legal content
class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.textPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Terms & Conditions',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Last Updated
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppConstants.paddingM),
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.update_rounded,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: AppConstants.paddingS),
                  Text(
                    'Last Updated: January 15, 2024',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.paddingL),

            // Content
            _buildSection(
              '1. Acceptance of Terms',
              'By downloading, installing, or using the Mira Bank mobile application ("App"), you agree to be bound by these Terms and Conditions ("Terms"). If you do not agree to these Terms, please do not use the App.',
            ),
            _buildSection(
              '2. Account Registration',
              'To use certain features of the App, you must register for an account. You agree to:\n\n• Provide accurate, current, and complete information\n• Maintain and promptly update your account information\n• Maintain the security of your password and account\n• Accept responsibility for all activities under your account\n• Notify us immediately of any unauthorized use',
            ),
            _buildSection(
              '3. Services',
              'The App provides the following services:\n\n• Account balance and transaction viewing\n• Fund transfers (internal and external)\n• Bill payments\n• Mobile check deposits\n• Card management\n• Account statements\n\nWe reserve the right to modify, suspend, or discontinue any service at any time.',
            ),
            _buildSection(
              '4. Security',
              'You are responsible for maintaining the confidentiality of your login credentials. You agree not to:\n\n• Share your credentials with anyone\n• Use the App on jailbroken or rooted devices\n• Attempt to bypass security measures\n• Use automated means to access the App',
            ),
            _buildSection(
              '5. Transaction Limits',
              'Daily and monthly transaction limits apply to all accounts. These limits are set based on your account type and may be modified at our discretion. You can view your current limits in the App settings.',
            ),
            _buildSection(
              '6. Fees and Charges',
              'Certain services may be subject to fees. You will be notified of any applicable fees before completing a transaction. Fee schedules are available in the App and on our website.',
            ),
            _buildSection(
              '7. Privacy',
              'Your privacy is important to us. Our collection and use of personal information is governed by our Privacy Policy, which is incorporated into these Terms by reference.',
            ),
            _buildSection(
              '8. Intellectual Property',
              'All content, features, and functionality of the App are owned by Mira Bank and are protected by copyright, trademark, and other intellectual property laws.',
            ),
            _buildSection(
              '9. Limitation of Liability',
              'Mira Bank shall not be liable for any indirect, incidental, special, consequential, or punitive damages resulting from your use of or inability to use the App.',
            ),
            _buildSection(
              '10. Changes to Terms',
              'We reserve the right to modify these Terms at any time. We will notify you of material changes through the App or via email. Your continued use of the App after such changes constitutes acceptance of the new Terms.',
            ),
            _buildSection(
              '11. Contact Information',
              'For questions about these Terms, please contact:\n\nMira Bank Customer Support\nEmail: legal@mirabank.com\nPhone: +1 (800) MIRA-BANK',
            ),
            const SizedBox(height: AppConstants.paddingL),

            // Accept Button (for reference)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppConstants.paddingM),
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                border: Border.all(
                  color: AppColors.success.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle_rounded, color: AppColors.success),
                  const SizedBox(width: AppConstants.paddingS),
                  Expanded(
                    child: Text(
                      'You accepted these terms when you created your account.',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.success,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.h6),
        const SizedBox(height: AppConstants.paddingS),
        Text(
          content,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: AppConstants.paddingL),
      ],
    );
  }
}
