import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';

/// Empty State Screen/Widget - No data available
class EmptyStateScreen extends StatelessWidget {
  final String? title;
  final String? message;
  final IconData? icon;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const EmptyStateScreen({
    super.key,
    this.title,
    this.message,
    this.icon,
    this.buttonText,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: EmptyStateWidget(
        title: title ?? 'No Data Found',
        message: message ?? 'There is no data to display at this time.',
        icon: icon ?? Icons.inbox_rounded,
        buttonText: buttonText,
        onButtonPressed: onButtonPressed,
      ),
    );
  }
}

/// Reusable Empty State Widget
class EmptyStateWidget extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const EmptyStateWidget({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
    this.buttonText,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(icon, color: AppColors.primary, size: 48),
              ),
            ),
            const SizedBox(height: AppConstants.paddingL),

            // Title
            Text(title, style: AppTextStyles.h5, textAlign: TextAlign.center),
            const SizedBox(height: AppConstants.paddingS),

            // Message
            Text(
              message,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),

            // Optional Button
            if (buttonText != null && onButtonPressed != null) ...[
              const SizedBox(height: AppConstants.paddingL),
              ElevatedButton(
                onPressed: onButtonPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingXL,
                    vertical: AppConstants.paddingM,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radiusL),
                  ),
                ),
                child: Text(
                  buttonText!,
                  style: AppTextStyles.buttonMedium.copyWith(
                    color: AppColors.textOnPrimary,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// No Transactions Empty State
class NoTransactionsWidget extends StatelessWidget {
  const NoTransactionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyStateWidget(
      title: 'No Transactions',
      message:
          'You don\'t have any transactions yet. Start by making a transfer or payment.',
      icon: Icons.receipt_long_rounded,
    );
  }
}

/// No Beneficiaries Empty State
class NoBeneficiariesWidget extends StatelessWidget {
  final VoidCallback? onAddPressed;

  const NoBeneficiariesWidget({super.key, this.onAddPressed});

  @override
  Widget build(BuildContext context) {
    return EmptyStateWidget(
      title: 'No Beneficiaries',
      message: 'Add your first beneficiary to start making transfers.',
      icon: Icons.people_rounded,
      buttonText: 'Add Beneficiary',
      onButtonPressed: onAddPressed,
    );
  }
}

/// No Notifications Empty State
class NoNotificationsWidget extends StatelessWidget {
  const NoNotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyStateWidget(
      title: 'No Notifications',
      message: 'You\'re all caught up! No new notifications at this time.',
      icon: Icons.notifications_off_rounded,
    );
  }
}
