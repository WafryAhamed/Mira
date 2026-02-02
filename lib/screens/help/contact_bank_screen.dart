import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';

/// Contact Bank Screen - Call/Email options
class ContactBankScreen extends StatelessWidget {
  const ContactBankScreen({super.key});

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
          'Contact Us',
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
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(AppConstants.radiusL),
              ),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.background.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.headset_mic_rounded,
                        color: AppColors.textOnPrimary,
                        size: 40,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingM),
                  Text(
                    'We\'re Here to Help',
                    style: AppTextStyles.h5.copyWith(
                      color: AppColors.textOnPrimary,
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingXS),
                  Text(
                    '24/7 Customer Support',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textOnPrimary.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.paddingL),

            // Contact Options
            Text('Contact Options', style: AppTextStyles.h6),
            const SizedBox(height: AppConstants.paddingM),
            _buildContactOption(
              context,
              icon: Icons.phone_rounded,
              title: 'Phone Support',
              subtitle: '+1 (800) MIRA-BANK',
              detail: 'Available 24/7',
              color: AppColors.success,
            ),
            _buildContactOption(
              context,
              icon: Icons.email_rounded,
              title: 'Email Support',
              subtitle: 'support@mirabank.com',
              detail: 'Response within 24 hours',
              color: AppColors.info,
            ),
            _buildContactOption(
              context,
              icon: Icons.chat_rounded,
              title: 'Live Chat',
              subtitle: 'Chat with our agents',
              detail: 'Available 24/7',
              color: AppColors.primary,
            ),
            _buildContactOption(
              context,
              icon: Icons.videocam_rounded,
              title: 'Video Call',
              subtitle: 'Schedule a video call',
              detail: 'Mon-Fri, 9 AM - 6 PM',
              color: AppColors.warning,
            ),
            const SizedBox(height: AppConstants.paddingL),

            // Social Media
            Text('Follow Us', style: AppTextStyles.h6),
            const SizedBox(height: AppConstants.paddingM),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSocialButton(Icons.facebook_rounded, 'Facebook'),
                _buildSocialButton(Icons.camera_alt_rounded, 'Instagram'),
                _buildSocialButton(Icons.alternate_email_rounded, 'Twitter'),
                _buildSocialButton(Icons.link_rounded, 'LinkedIn'),
              ],
            ),
            const SizedBox(height: AppConstants.paddingL),

            // Branch Locator
            Text('Visit Us', style: AppTextStyles.h6),
            const SizedBox(height: AppConstants.paddingM),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppConstants.paddingM),
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(AppConstants.radiusL),
              ),
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppConstants.radiusM),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.location_on_rounded,
                        color: AppColors.primary,
                        size: 28,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppConstants.paddingM),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Find a Branch/ATM',
                          style: AppTextStyles.labelLarge,
                        ),
                        Text(
                          'Locate nearest branch or ATM',
                          style: AppTextStyles.caption,
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.textLight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String detail,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingM),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(AppConstants.paddingM),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
          ),
          child: Center(child: Icon(icon, color: color)),
        ),
        title: Text(title, style: AppTextStyles.labelLarge),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle, style: AppTextStyles.bodySmall),
            Text(detail, style: AppTextStyles.caption.copyWith(color: color)),
          ],
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: AppColors.textLight,
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$title feature coming soon'),
              backgroundColor: color,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.accent,
            shape: BoxShape.circle,
          ),
          child: Center(child: Icon(icon, color: AppColors.primary)),
        ),
        const SizedBox(height: 4),
        Text(label, style: AppTextStyles.caption.copyWith(fontSize: 10)),
      ],
    );
  }
}
