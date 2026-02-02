import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';
import '../../routes/app_routes.dart';

/// Account List Screen - Shows all user accounts
class AccountListScreen extends StatelessWidget {
  const AccountListScreen({super.key});

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
          'My Accounts',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(AppConstants.paddingL),
        itemCount: MockData.accountList.length,
        itemBuilder: (context, index) {
          final account = MockData.accountList[index];
          return _buildAccountCard(
            context,
            type: account['type'] as String,
            maskedNumber: account['maskedNumber'] as String,
            balance: account['balance'] as double,
            currency: account['currency'] as String,
            accountId: account['id'] as String,
          );
        },
      ),
    );
  }

  Widget _buildAccountCard(
    BuildContext context, {
    required String type,
    required String maskedNumber,
    required double balance,
    required String currency,
    required String accountId,
  }) {
    final isSavings = type.toLowerCase().contains('savings');

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.accountDetails,
          arguments: accountId,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: AppConstants.paddingM),
        padding: const EdgeInsets.all(AppConstants.paddingL),
        decoration: BoxDecoration(
          gradient: isSavings
              ? AppColors.primaryGradient
              : const LinearGradient(
                  colors: [Color(0xFF4A4A4A), Color(0xFF2D2D2D)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          borderRadius: BorderRadius.circular(AppConstants.radiusXL),
          boxShadow: [
            BoxShadow(
              color: isSavings
                  ? AppColors.primary.withValues(alpha: 0.3)
                  : Colors.black.withValues(alpha: 0.2),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  type,
                  style: AppTextStyles.labelLarge.copyWith(
                    color: isSavings ? AppColors.textOnPrimary : Colors.white,
                  ),
                ),
                Icon(
                  isSavings
                      ? Icons.savings_outlined
                      : Icons.account_balance_outlined,
                  color: isSavings
                      ? AppColors.textOnPrimary.withValues(alpha: 0.7)
                      : Colors.white.withValues(alpha: 0.7),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.paddingM),
            Text(
              maskedNumber,
              style: AppTextStyles.bodyMedium.copyWith(
                color: isSavings
                    ? AppColors.textOnPrimary.withValues(alpha: 0.8)
                    : Colors.white.withValues(alpha: 0.8),
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: AppConstants.paddingM),
            Text(
              'Available Balance',
              style: AppTextStyles.caption.copyWith(
                color: isSavings
                    ? AppColors.textOnPrimary.withValues(alpha: 0.7)
                    : Colors.white.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: AppConstants.paddingXS),
            Text(
              '\$${balance.toStringAsFixed(2)}',
              style: AppTextStyles.h3.copyWith(
                color: isSavings ? AppColors.textOnPrimary : Colors.white,
              ),
            ),
            const SizedBox(height: AppConstants.paddingM),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'View Details',
                  style: AppTextStyles.labelMedium.copyWith(
                    color: isSavings ? AppColors.textOnPrimary : Colors.white,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: isSavings ? AppColors.textOnPrimary : Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
