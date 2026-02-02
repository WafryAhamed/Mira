import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';
import '../../routes/app_routes.dart';

/// Account Statements List Screen - Monthly statements
class AccountStatementsScreen extends StatelessWidget {
  final String? accountId;

  const AccountStatementsScreen({super.key, this.accountId});

  static const List<Map<String, dynamic>> _statements = [
    {
      'month': 'January 2024',
      'period': '01 Jan - 31 Jan',
      'transactions': 24,
      'size': '156 KB',
    },
    {
      'month': 'December 2023',
      'period': '01 Dec - 31 Dec',
      'transactions': 31,
      'size': '203 KB',
    },
    {
      'month': 'November 2023',
      'period': '01 Nov - 30 Nov',
      'transactions': 18,
      'size': '124 KB',
    },
    {
      'month': 'October 2023',
      'period': '01 Oct - 31 Oct',
      'transactions': 27,
      'size': '178 KB',
    },
    {
      'month': 'September 2023',
      'period': '01 Sep - 30 Sep',
      'transactions': 22,
      'size': '145 KB',
    },
    {
      'month': 'August 2023',
      'period': '01 Aug - 31 Aug',
      'transactions': 19,
      'size': '132 KB',
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
            Icons.arrow_back_ios_rounded,
            color: AppColors.textPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Account Statements',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Account Info Header
          Container(
            margin: const EdgeInsets.all(AppConstants.paddingL),
            padding: const EdgeInsets.all(AppConstants.paddingM),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(AppConstants.radiusL),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.background.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.account_balance_wallet_rounded,
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
                        'Savings Account',
                        style: AppTextStyles.labelLarge.copyWith(
                          color: AppColors.textOnPrimary,
                        ),
                      ),
                      Text(
                        '•••• •••• •••• 7890',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textOnPrimary.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Year Selector
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingL,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('2024', style: AppTextStyles.h5),
                IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(AppConstants.radiusM),
                    ),
                    child: const Icon(
                      Icons.calendar_month_rounded,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Year selector coming soon'),
                        backgroundColor: AppColors.primary,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: AppConstants.paddingS),

          // Statements List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingL,
              ),
              itemCount: _statements.length,
              itemBuilder: (context, index) {
                final statement = _statements[index];
                return _buildStatementItem(
                  context,
                  month: statement['month'] as String,
                  period: statement['period'] as String,
                  transactions: statement['transactions'] as int,
                  size: statement['size'] as String,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatementItem(
    BuildContext context, {
    required String month,
    required String period,
    required int transactions,
    required String size,
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
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppConstants.radiusM),
          ),
          child: const Center(
            child: Icon(Icons.description_rounded, color: AppColors.primary),
          ),
        ),
        title: Text(month, style: AppTextStyles.labelLarge),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(period, style: AppTextStyles.caption),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.receipt_long_rounded,
                  size: 14,
                  color: AppColors.textLight,
                ),
                const SizedBox(width: 4),
                Text(
                  '$transactions transactions',
                  style: AppTextStyles.caption.copyWith(fontSize: 11),
                ),
                const SizedBox(width: 12),
                Icon(
                  Icons.folder_rounded,
                  size: 14,
                  color: AppColors.textLight,
                ),
                const SizedBox(width: 4),
                Text(size, style: AppTextStyles.caption.copyWith(fontSize: 11)),
              ],
            ),
          ],
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: AppColors.textLight,
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.statementPreview,
            arguments: {'month': month, 'period': period},
          );
        },
      ),
    );
  }
}
