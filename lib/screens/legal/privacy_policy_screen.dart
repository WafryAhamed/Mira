import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';

/// Privacy Policy Screen - Data usage explanation
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
          'Privacy Policy',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppConstants.paddingL),
              decoration: BoxDecoration(
                color: AppColors.info.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusL),
                border: Border.all(
                  color: AppColors.info.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.shield_rounded, color: AppColors.info, size: 32),
                  const SizedBox(width: AppConstants.paddingM),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Privacy Matters',
                          style: AppTextStyles.labelLarge,
                        ),
                        Text(
                          'We are committed to protecting your personal information',
                          style: AppTextStyles.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.paddingL),

            // Last Updated
            Text(
              'Effective Date: January 15, 2024',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppConstants.paddingL),

            // Content
            _buildSection(
              '1. Information We Collect',
              'We collect information you provide directly to us:\n\n'
                  '• Personal Information: Name, email, phone, address, date of birth, government ID\n'
                  '• Financial Information: Account numbers, transaction history, payment details\n'
                  '• Device Information: Device type, operating system, unique device identifiers\n'
                  '• Usage Information: Features used, time spent, navigation patterns',
            ),
            _buildSection(
              '2. How We Use Your Information',
              'We use the information we collect to:\n\n'
                  '• Provide, maintain, and improve our services\n'
                  '• Process transactions and send related information\n'
                  '• Send security alerts and account notifications\n'
                  '• Detect and prevent fraud and unauthorized access\n'
                  '• Comply with legal and regulatory requirements',
            ),
            _buildSection(
              '3. Information Sharing',
              'We may share your information with:\n\n'
                  '• Service Providers: Companies that perform services on our behalf\n'
                  '• Financial Partners: Banks and payment processors to complete transactions\n'
                  '• Legal Requirements: When required by law or to protect rights\n'
                  '• Business Transfers: In connection with mergers or acquisitions\n\n'
                  'We do NOT sell your personal information to third parties.',
            ),
            _buildSection(
              '4. Data Security',
              'We implement industry-standard security measures:\n\n'
                  '• 256-bit SSL encryption for data transmission\n'
                  '• Multi-factor authentication\n'
                  '• Regular security audits and penetration testing\n'
                  '• Secure data centers with 24/7 monitoring\n'
                  '• Employee access controls and training',
            ),
            _buildSection(
              '5. Your Rights',
              'You have the right to:\n\n'
                  '• Access: Request a copy of your personal data\n'
                  '• Correction: Request correction of inaccurate data\n'
                  '• Deletion: Request deletion of your data (subject to legal requirements)\n'
                  '• Portability: Receive your data in a portable format\n'
                  '• Opt-out: Unsubscribe from marketing communications',
            ),
            _buildSection(
              '6. Data Retention',
              'We retain your personal information for as long as your account is active or as needed to provide services. We may retain certain information for legal, regulatory, or legitimate business purposes.',
            ),
            _buildSection(
              '7. Cookies and Tracking',
              'Our app may use cookies and similar technologies to:\n\n'
                  '• Remember your preferences\n'
                  '• Analyze app usage patterns\n'
                  '• Improve our services\n\n'
                  'You can manage cookie preferences in your device settings.',
            ),
            _buildSection(
              '8. Children\'s Privacy',
              'Our services are not directed to individuals under 18. We do not knowingly collect personal information from children. If you believe we have collected information from a child, please contact us.',
            ),
            _buildSection(
              '9. Changes to This Policy',
              'We may update this Privacy Policy from time to time. We will notify you of any material changes via email or through the App.',
            ),
            _buildSection(
              '10. Contact Us',
              'If you have questions about this Privacy Policy:\n\n'
                  'Email: privacy@mirabank.com\n'
                  'Phone: +1 (800) MIRA-BANK\n'
                  'Mail: Mira Bank, Privacy Office\n'
                  '123 Banking Street, Financial District\n'
                  'New York, NY 10001',
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
