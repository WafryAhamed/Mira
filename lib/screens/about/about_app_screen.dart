import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';

/// About App Screen - App version and developer details
class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

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
          'About',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingL),
        child: Column(
          children: [
            const SizedBox(height: AppConstants.paddingL),

            // App Icon & Name
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'M',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppConstants.paddingL),

            Text('Mira Bank', style: AppTextStyles.h3),
            const SizedBox(height: AppConstants.paddingXS),
            Text(
              'Your Digital Banking Partner',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppConstants.paddingM),

            // Version Badge
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingL,
                vertical: AppConstants.paddingS,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusL),
              ),
              child: Text(
                'Version 1.0.0 (Build 1)',
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: AppConstants.paddingXL),

            // App Info Cards
            _buildInfoCard(
              icon: Icons.code_rounded,
              title: 'Developed By',
              subtitle: 'Mira Bank Development Team',
            ),
            _buildInfoCard(
              icon: Icons.flutter_dash_rounded,
              title: 'Built With',
              subtitle: 'Flutter & Dart',
            ),
            _buildInfoCard(
              icon: Icons.copyright_rounded,
              title: 'Copyright',
              subtitle: '© 2024 Mira Bank Ltd. All rights reserved.',
            ),
            _buildInfoCard(
              icon: Icons.verified_rounded,
              title: 'License',
              subtitle: 'Licensed under Mira Bank EULA',
            ),
            const SizedBox(height: AppConstants.paddingL),

            // Features Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppConstants.paddingL),
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(AppConstants.radiusL),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Features', style: AppTextStyles.h6),
                  const SizedBox(height: AppConstants.paddingM),
                  _buildFeatureRow(
                    Icons.account_balance_wallet_rounded,
                    'Account Management',
                  ),
                  _buildFeatureRow(Icons.swap_horiz_rounded, 'Fund Transfers'),
                  _buildFeatureRow(Icons.receipt_long_rounded, 'Bill Payments'),
                  _buildFeatureRow(
                    Icons.qr_code_scanner_rounded,
                    'QR Payments',
                  ),
                  _buildFeatureRow(
                    Icons.security_rounded,
                    'Bank-Grade Security',
                  ),
                  _buildFeatureRow(
                    Icons.fingerprint_rounded,
                    'Biometric Login',
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.paddingL),

            // Rate & Share
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Opening app store...'),
                          backgroundColor: AppColors.primary,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.star_rounded),
                    label: const Text('Rate App'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusL,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppConstants.paddingM),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Share feature coming soon'),
                          backgroundColor: AppColors.primary,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.share_rounded),
                    label: const Text('Share App'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusL,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.paddingXL),

            // Footer
            Text(
              'Made with ❤️ for FYP 2024',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppConstants.paddingL),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingM),
      padding: const EdgeInsets.all(AppConstants.paddingM),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
            ),
            child: Center(child: Icon(icon, color: AppColors.primary)),
          ),
          const SizedBox(width: AppConstants.paddingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.caption),
                Text(subtitle, style: AppTextStyles.labelMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.paddingS),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.primary),
          const SizedBox(width: AppConstants.paddingS),
          Text(text, style: AppTextStyles.bodySmall),
        ],
      ),
    );
  }
}
