import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';

/// Transactions Screen - Full transaction history
class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          'Transactions',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // Filter Chips
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingL,
              vertical: AppConstants.paddingS,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('All', true),
                  const SizedBox(width: 8),
                  _buildFilterChip('Income', false),
                  const SizedBox(width: 8),
                  _buildFilterChip('Expense', false),
                  const SizedBox(width: 8),
                  _buildFilterChip('Transfer', false),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppConstants.paddingS),

          // Transaction List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingL,
              ),
              itemCount: MockData.transactionHistory.length,
              itemBuilder: (context, index) {
                final txn = MockData.transactionHistory[index];
                return _buildTransactionItem(
                  icon: _getTransactionIcon(txn['category'] as String),
                  title: txn['title'] as String,
                  subtitle: txn['description'] as String,
                  amount: txn['amount'] as double,
                  isCredit: txn['isCredit'] as bool,
                  date: txn['date'] as String,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.accent,
        borderRadius: BorderRadius.circular(AppConstants.radiusRound),
      ),
      child: Text(
        label,
        style: AppTextStyles.labelMedium.copyWith(
          color: isSelected ? AppColors.textOnPrimary : AppColors.textSecondary,
        ),
      ),
    );
  }

  IconData _getTransactionIcon(String category) {
    switch (category) {
      case 'income':
        return Icons.attach_money_rounded;
      case 'shopping':
        return Icons.shopping_bag_outlined;
      case 'utilities':
        return Icons.bolt_outlined;
      case 'food':
        return Icons.restaurant_outlined;
      case 'transfer':
        return Icons.swap_horiz_rounded;
      case 'entertainment':
        return Icons.movie_outlined;
      default:
        return Icons.receipt_outlined;
    }
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required double amount,
    required bool isCredit,
    required String date,
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
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
            ),
            child: Center(child: Icon(icon, color: AppColors.textPrimary)),
          ),
          const SizedBox(width: AppConstants.paddingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.labelLarge),
                Text(subtitle, style: AppTextStyles.caption),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${isCredit ? '+' : '-'}\$${amount.toStringAsFixed(2)}',
                style: AppTextStyles.labelLarge.copyWith(
                  color: isCredit ? AppColors.success : AppColors.error,
                ),
              ),
              Text(date, style: AppTextStyles.caption.copyWith(fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }
}
