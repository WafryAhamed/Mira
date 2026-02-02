import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';
import '../../routes/app_routes.dart';

/// Transactions Screen - Full transaction history
class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  int _selectedFilter = 0;
  final List<String> _filters = ['All', 'Income', 'Expense', 'Transfer'];

  List<Map<String, dynamic>> get _filteredTransactions {
    final allTransactions = MockData.transactionHistory;
    switch (_selectedFilter) {
      case 1: // Income
        return allTransactions.where((t) => t['isCredit'] == true).toList();
      case 2: // Expense
        return allTransactions.where((t) => t['isCredit'] == false).toList();
      case 3: // Transfer
        return allTransactions
            .where((t) => t['category'] == 'transfer')
            .toList();
      default:
        return allTransactions;
    }
  }

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
        actions: [
          IconButton(
            icon: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.accent,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.filter_list_rounded,
                  color: AppColors.textPrimary,
                  size: 22,
                ),
              ),
            ),
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.transactionFilter),
          ),
        ],
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
                children: List.generate(_filters.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index < _filters.length - 1 ? 8 : 0,
                    ),
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedFilter = index),
                      child: _buildFilterChip(
                        _filters[index],
                        _selectedFilter == index,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: AppConstants.paddingS),

          // Transaction List
          Expanded(
            child: _filteredTransactions.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.receipt_long_outlined,
                          size: 64,
                          color: AppColors.textLight,
                        ),
                        const SizedBox(height: AppConstants.paddingM),
                        Text(
                          'No transactions found',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingL,
                    ),
                    itemCount: _filteredTransactions.length,
                    itemBuilder: (context, index) {
                      final txn = _filteredTransactions[index];
                      return _buildTransactionItem(context, txn);
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

  Widget _buildTransactionItem(BuildContext context, Map<String, dynamic> txn) {
    final icon = _getTransactionIcon(txn['category'] as String);
    final title = txn['title'] as String;
    final subtitle = txn['description'] as String;
    final amount = txn['amount'] as double;
    final isCredit = txn['isCredit'] as bool;
    final date = txn['date'] as String;

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.transactionDetail,
        arguments: txn,
      ),
      child: Container(
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
            const SizedBox(width: 8),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textLight,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
