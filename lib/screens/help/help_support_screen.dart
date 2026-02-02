import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';
import '../../routes/app_routes.dart';

/// Help & Support Screen - Main help hub
class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

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
          'Help & Support',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingM,
                vertical: AppConstants.paddingS,
              ),
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(AppConstants.radiusL),
              ),
              child: Row(
                children: [
                  Icon(Icons.search_rounded, color: AppColors.textLight),
                  const SizedBox(width: AppConstants.paddingS),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for help...',
                        hintStyle: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textLight,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.paddingL),

            // Quick Actions
            Text('Quick Help', style: AppTextStyles.h6),
            const SizedBox(height: AppConstants.paddingM),
            Row(
              children: [
                Expanded(
                  child: _buildQuickAction(
                    context,
                    icon: Icons.question_answer_rounded,
                    label: 'FAQs',
                    onTap: () => Navigator.pushNamed(context, AppRoutes.faq),
                  ),
                ),
                const SizedBox(width: AppConstants.paddingM),
                Expanded(
                  child: _buildQuickAction(
                    context,
                    icon: Icons.phone_rounded,
                    label: 'Contact Us',
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.contactBank),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.paddingL),

            // Help Topics
            Text('Help Topics', style: AppTextStyles.h6),
            const SizedBox(height: AppConstants.paddingM),
            _buildHelpTopic(
              icon: Icons.account_balance_wallet_rounded,
              title: 'Account & Balance',
              subtitle: 'Account info, balance inquiries',
            ),
            _buildHelpTopic(
              icon: Icons.swap_horiz_rounded,
              title: 'Transfers & Payments',
              subtitle: 'Money transfers, bill payments',
            ),
            _buildHelpTopic(
              icon: Icons.credit_card_rounded,
              title: 'Cards',
              subtitle: 'Card management, limits, blocking',
            ),
            _buildHelpTopic(
              icon: Icons.security_rounded,
              title: 'Security',
              subtitle: 'Password, PIN, fraud protection',
            ),
            _buildHelpTopic(
              icon: Icons.phone_android_rounded,
              title: 'Mobile App',
              subtitle: 'App features, troubleshooting',
            ),
            const SizedBox(height: AppConstants.paddingL),

            // Contact Options
            Text('Still need help?', style: AppTextStyles.h6),
            const SizedBox(height: AppConstants.paddingM),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppConstants.paddingL),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(AppConstants.radiusL),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.headset_mic_rounded,
                        color: AppColors.textOnPrimary,
                        size: 28,
                      ),
                      const SizedBox(width: AppConstants.paddingM),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '24/7 Customer Support',
                              style: AppTextStyles.labelLarge.copyWith(
                                color: AppColors.textOnPrimary,
                              ),
                            ),
                            Text(
                              'We\'re here to help anytime',
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.textOnPrimary.withValues(
                                  alpha: 0.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.paddingM),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            AppRoutes.contactBank,
                          ),
                          icon: Icon(
                            Icons.call_rounded,
                            color: AppColors.textOnPrimary,
                          ),
                          label: Text(
                            'Call',
                            style: TextStyle(color: AppColors.textOnPrimary),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: AppColors.textOnPrimary.withValues(
                                alpha: 0.5,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppConstants.paddingM),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            AppRoutes.contactBank,
                          ),
                          icon: Icon(
                            Icons.chat_rounded,
                            color: AppColors.textOnPrimary,
                          ),
                          label: Text(
                            'Chat',
                            style: TextStyle(color: AppColors.textOnPrimary),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: AppColors.textOnPrimary.withValues(
                                alpha: 0.5,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAction(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppConstants.paddingL),
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(AppConstants.radiusL),
        ),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(icon, color: AppColors.primary, size: 28),
              ),
            ),
            const SizedBox(height: AppConstants.paddingS),
            Text(label, style: AppTextStyles.labelMedium),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpTopic({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingS),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
      ),
      child: ListTile(
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
          ),
          child: Center(child: Icon(icon, color: AppColors.primary)),
        ),
        title: Text(title, style: AppTextStyles.labelLarge),
        subtitle: Text(subtitle, style: AppTextStyles.caption),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: AppColors.textLight,
        ),
        onTap: () {},
      ),
    );
  }
}
