import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';

/// Statement Preview Screen - PDF-style statement view
class StatementPreviewScreen extends StatelessWidget {
  final Map<String, dynamic>? args;

  const StatementPreviewScreen({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    final month = args?['month'] ?? 'January 2024';
    final period = args?['period'] ?? '01 Jan - 31 Jan';

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
          'Statement',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share_rounded, color: AppColors.primary),
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
          ),
          IconButton(
            icon: const Icon(Icons.download_rounded, color: AppColors.primary),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Download feature coming soon'),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Statement Header (PDF-style)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppConstants.paddingL),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(AppConstants.radiusL),
                border: Border.all(color: AppColors.divider),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Bank Logo & Name
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(
                            AppConstants.radiusM,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'M',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppConstants.paddingM),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('MIRA BANK', style: AppTextStyles.h5),
                          Text(
                            'Account Statement',
                            style: AppTextStyles.caption,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.paddingL),
                  const Divider(),
                  const SizedBox(height: AppConstants.paddingM),

                  // Statement Period
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Statement Period',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Text(month, style: AppTextStyles.labelLarge),
                          Text(period, style: AppTextStyles.caption),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Generated On',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Text('02 Feb 2024', style: AppTextStyles.labelLarge),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.paddingL),

            // Account Summary
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
                  Text('Account Summary', style: AppTextStyles.h6),
                  const SizedBox(height: AppConstants.paddingM),
                  _buildSummaryRow('Account Number', '•••• •••• •••• 7890'),
                  _buildSummaryRow('Account Type', 'Savings Account'),
                  _buildSummaryRow('Opening Balance', '\$22,450.00'),
                  _buildSummaryRow('Closing Balance', '\$24,568.00'),
                  const Divider(height: 24),
                  _buildSummaryRow(
                    'Total Credits',
                    '\$5,200.00',
                    isPositive: true,
                  ),
                  _buildSummaryRow(
                    'Total Debits',
                    '\$3,082.00',
                    isNegative: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.paddingL),

            // Transaction List Preview
            Text('Transactions', style: AppTextStyles.h6),
            const SizedBox(height: AppConstants.paddingM),
            ..._mockTransactions.map((txn) => _buildTransactionRow(txn)),
            const SizedBox(height: AppConstants.paddingL),

            // Download Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('PDF download coming soon'),
                      backgroundColor: AppColors.primary,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.download_rounded),
                label: const Text('Download PDF'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.textOnPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radiusL),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value, {
    bool isPositive = false,
    bool isNegative = false,
  }) {
    Color valueColor = AppColors.textPrimary;
    if (isPositive) valueColor = AppColors.success;
    if (isNegative) valueColor = AppColors.error;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            value,
            style: AppTextStyles.labelMedium.copyWith(color: valueColor),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionRow(Map<String, dynamic> txn) {
    final isCredit = txn['isCredit'] as bool;
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingS),
      padding: const EdgeInsets.all(AppConstants.paddingM),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(txn['date'] as String, style: AppTextStyles.caption),
          ),
          Expanded(
            flex: 3,
            child: Text(
              txn['description'] as String,
              style: AppTextStyles.bodySmall,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '${isCredit ? '+' : '-'}\$${txn['amount']}',
              style: AppTextStyles.labelMedium.copyWith(
                color: isCredit ? AppColors.success : AppColors.error,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> get _mockTransactions => [
    {
      'date': '31 Jan',
      'description': 'Salary Credit',
      'amount': '3,500.00',
      'isCredit': true,
    },
    {
      'date': '28 Jan',
      'description': 'Grocery Store',
      'amount': '156.50',
      'isCredit': false,
    },
    {
      'date': '25 Jan',
      'description': 'Electricity Bill',
      'amount': '89.00',
      'isCredit': false,
    },
    {
      'date': '20 Jan',
      'description': 'Online Transfer',
      'amount': '500.00',
      'isCredit': false,
    },
    {
      'date': '15 Jan',
      'description': 'Refund',
      'amount': '75.00',
      'isCredit': true,
    },
    {
      'date': '10 Jan',
      'description': 'Restaurant',
      'amount': '45.80',
      'isCredit': false,
    },
  ];
}
