import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';
import '../../routes/app_routes.dart';

/// Notifications Screen - Transaction and security alerts
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  static const List<Map<String, dynamic>> _notifications = [
    {
      'type': 'transaction',
      'title': 'Payment Received',
      'message': 'You received LKR 25,000.00 from Fathima Nazeera', // Muslim
      'time': '2 min ago',
      'isRead': false,
    },
    {
      'type': 'security',
      'title': 'New Login Detected',
      'message': 'New login from Windows device',
      'time': '1 hour ago',
      'isRead': false,
    },
    {
      'type': 'transaction',
      'title': 'Bill Payment Successful',
      'message': 'CEB electricity bill of LKR 6,200.00 paid',
      'time': '3 hours ago',
      'isRead': true,
    },
    {
      'type': 'promo',
      'title': 'New Offer Available',
      'message': 'Get 2% cashback on utility payments',
      'time': '1 day ago',
      'isRead': true,
    },
    {
      'type': 'security',
      'title': 'Password Changed',
      'message': 'Your password was changed successfully',
      'time': '2 days ago',
      'isRead': true,
    },
    {
      'type': 'transaction',
      'title': 'Transfer Completed',
      'message': 'Transferred LKR 50,000.00 to Suresh Kumar', // Hindu/Tamil
      'time': '3 days ago',
      'isRead': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.textPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notifications',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,

        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings_outlined,
              color: AppColors.textPrimary,
            ),
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.notificationSettings),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: _notifications.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(AppConstants.paddingL),
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return _buildNotificationItem(notification);
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: 80,
            color: AppColors.textLight,
          ),
          const SizedBox(height: AppConstants.paddingL),
          Text('No Notifications', style: AppTextStyles.h5),
          const SizedBox(height: AppConstants.paddingS),
          Text(
            'You\'re all caught up!',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    final type = notification['type'] as String;
    final isRead = notification['isRead'] as bool;

    IconData icon;
    Color iconColor;

    switch (type) {
      case 'transaction':
        icon = Icons.account_balance_wallet_outlined;
        iconColor = AppColors.success;
        break;
      case 'security':
        icon = Icons.security_outlined;
        iconColor = AppColors.warning;
        break;
      case 'promo':
        icon = Icons.local_offer_outlined;
        iconColor = AppColors.info;
        break;
      default:
        icon = Icons.notifications_outlined;
        iconColor = AppColors.primary;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingM),
      padding: const EdgeInsets.all(AppConstants.paddingM),
      decoration: BoxDecoration(
        color: isRead
            ? AppColors.accent
            : AppColors.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border: isRead
            ? null
            : Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
            ),
            child: Center(child: Icon(icon, color: iconColor)),
          ),
          const SizedBox(width: AppConstants.paddingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        notification['title'] as String,
                        style: AppTextStyles.labelLarge.copyWith(
                          fontWeight: isRead
                              ? FontWeight.normal
                              : FontWeight.bold,
                        ),
                      ),
                    ),
                    if (!isRead)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  notification['message'] as String,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  notification['time'] as String,
                  style: AppTextStyles.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
