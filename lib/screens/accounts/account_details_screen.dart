import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';

/// Account Details Screen - Shows detailed account information
class AccountDetailsScreen extends StatelessWidget {
  final String accountId;

  const AccountDetailsScreen({super.key, required this.accountId});

  @override
  Widget build(BuildContext context) {
    // Find the account from mock data
    final account = MockData.accountList.firstWhere(
      (acc) => acc['id'] == accountId,
      orElse: () => MockData.accountList.first,
    );

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
          'Account Details',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Type Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppConstants.paddingL),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(AppConstants.radiusXL),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.background.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.account_balance_wallet_outlined,
                            color: AppColors.textOnPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(width: AppConstants.paddingM),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              account['type'] as String,
                              style: AppTextStyles.h5.copyWith(
                                color: AppColors.textOnPrimary,
                              ),
                            ),
                            Text(
                              account['maskedNumber'] as String,
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
                  const SizedBox(height: AppConstants.paddingL),
                  Text(
                    'Current Balance',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textOnPrimary.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingXS),
                  Text(
                    '\$${(account['balance'] as double).toStringAsFixed(2)}',
                    style: AppTextStyles.h2.copyWith(
                      color: AppColors.textOnPrimary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.paddingXL),

            // Account Details List
            Text('Account Information', style: AppTextStyles.h5),
            const SizedBox(height: AppConstants.paddingM),

            _buildDetailItem(
              icon: Icons.numbers_rounded,
              label: 'Account Number',
              value: account['accountNumber'] as String,
            ),
            _buildDetailItem(
              icon: Icons.location_city_rounded,
              label: 'Branch Name',
              value: account['branch'] as String,
            ),
            _buildDetailItem(
              icon: Icons.attach_money_rounded,
              label: 'Current Balance',
              value: '\$${(account['balance'] as double).toStringAsFixed(2)}',
            ),
            _buildDetailItem(
              icon: Icons.check_circle_outline_rounded,
              label: 'Account Status',
              value: account['status'] as String,
              valueColor: AppColors.success,
            ),
            _buildDetailItem(
              icon: Icons.calendar_today_rounded,
              label: 'Opened On',
              value: account['openDate'] as String,
            ),
            _buildDetailItem(
              icon: Icons.currency_exchange_rounded,
              label: 'Currency',
              value: account['currency'] as String,
            ),

            const SizedBox(height: AppConstants.paddingXL),

            // Quick Actions
            Text('Quick Actions', style: AppTextStyles.h5),
            const SizedBox(height: AppConstants.paddingM),
            Row(
              children: [
                Expanded(
                  child: _buildActionButton(
                    context,
                    icon: Icons.receipt_long_outlined,
                    label: 'Statement',
                  ),
                ),
                const SizedBox(width: AppConstants.paddingM),
                Expanded(
                  child: _buildActionButton(
                    context,
                    icon: Icons.share_outlined,
                    label: 'Share',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
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
            child: Center(
              child: Icon(icon, color: AppColors.primary, size: 22),
            ),
          ),
          const SizedBox(width: AppConstants.paddingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.caption),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: AppTextStyles.labelLarge.copyWith(
                    color: valueColor ?? AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
  }) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$label feature coming soon'),
            backgroundColor: AppColors.primary,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppConstants.paddingM,
          horizontal: AppConstants.paddingL,
        ),
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(AppConstants.radiusM),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primary, size: 22),
            const SizedBox(width: AppConstants.paddingS),
            Text(
              label,
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
