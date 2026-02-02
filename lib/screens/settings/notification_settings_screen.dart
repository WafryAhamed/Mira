import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';

/// Notification Settings Screen - Toggle notification preferences
class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool _transactionAlerts = true;
  bool _securityAlerts = true;
  bool _promotions = false;
  bool _accountUpdates = true;
  bool _billReminders = true;
  bool _loginAlerts = true;
  bool _emailNotifications = true;
  bool _smsNotifications = false;
  bool _pushNotifications = true;

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
          'Notification Settings',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Transaction Notifications
            Text('Transaction Alerts', style: AppTextStyles.h6),
            const SizedBox(height: AppConstants.paddingM),
            _buildToggleCard(
              icon: Icons.payments_rounded,
              title: 'Transaction Alerts',
              subtitle: 'Get notified for all transactions',
              value: _transactionAlerts,
              onChanged: (v) => setState(() => _transactionAlerts = v),
            ),
            _buildToggleCard(
              icon: Icons.account_balance_rounded,
              title: 'Account Updates',
              subtitle: 'Balance changes and account activity',
              value: _accountUpdates,
              onChanged: (v) => setState(() => _accountUpdates = v),
            ),
            _buildToggleCard(
              icon: Icons.receipt_long_rounded,
              title: 'Bill Reminders',
              subtitle: 'Upcoming bill payment reminders',
              value: _billReminders,
              onChanged: (v) => setState(() => _billReminders = v),
            ),
            const SizedBox(height: AppConstants.paddingL),

            // Security Notifications
            Text('Security Alerts', style: AppTextStyles.h6),
            const SizedBox(height: AppConstants.paddingM),
            _buildToggleCard(
              icon: Icons.security_rounded,
              title: 'Security Alerts',
              subtitle: 'Suspicious activity and security warnings',
              value: _securityAlerts,
              onChanged: (v) => setState(() => _securityAlerts = v),
            ),
            _buildToggleCard(
              icon: Icons.login_rounded,
              title: 'Login Alerts',
              subtitle: 'New device and login notifications',
              value: _loginAlerts,
              onChanged: (v) => setState(() => _loginAlerts = v),
            ),
            const SizedBox(height: AppConstants.paddingL),

            // Promotional
            Text('Promotions & Offers', style: AppTextStyles.h6),
            const SizedBox(height: AppConstants.paddingM),
            _buildToggleCard(
              icon: Icons.local_offer_rounded,
              title: 'Promotions',
              subtitle: 'Special offers and promotional messages',
              value: _promotions,
              onChanged: (v) => setState(() => _promotions = v),
            ),
            const SizedBox(height: AppConstants.paddingL),

            // Notification Channels
            Text('Notification Channels', style: AppTextStyles.h6),
            const SizedBox(height: AppConstants.paddingM),
            _buildToggleCard(
              icon: Icons.notifications_rounded,
              title: 'Push Notifications',
              subtitle: 'Receive push notifications on your device',
              value: _pushNotifications,
              onChanged: (v) => setState(() => _pushNotifications = v),
            ),
            _buildToggleCard(
              icon: Icons.email_rounded,
              title: 'Email Notifications',
              subtitle: 'Receive alerts via email',
              value: _emailNotifications,
              onChanged: (v) => setState(() => _emailNotifications = v),
            ),
            _buildToggleCard(
              icon: Icons.sms_rounded,
              title: 'SMS Notifications',
              subtitle: 'Receive alerts via SMS',
              value: _smsNotifications,
              onChanged: (v) => setState(() => _smsNotifications = v),
            ),
            const SizedBox(height: AppConstants.paddingL),

            // Info Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppConstants.paddingM),
              decoration: BoxDecoration(
                color: AppColors.info.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                border: Border.all(
                  color: AppColors.info.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: AppColors.info,
                    size: 20,
                  ),
                  const SizedBox(width: AppConstants.paddingS),
                  Expanded(
                    child: Text(
                      'Security alerts cannot be disabled for your account safety.',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.info,
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

  Widget _buildToggleCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingM),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppConstants.paddingM,
          vertical: AppConstants.paddingXS,
        ),
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
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primary,
          activeTrackColor: AppColors.primary.withValues(alpha: 0.3),
        ),
      ),
    );
  }
}
