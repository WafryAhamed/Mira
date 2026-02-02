import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';

/// Transaction Detail Screen - Shows full transaction details
class TransactionDetailScreen extends StatelessWidget {
  final Map<String, dynamic> transaction;

  const TransactionDetailScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final bool isCredit = transaction['isCredit'] as bool;
    final double amount = transaction['amount'] as double;

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
          'Transaction Details',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingL),
        child: Column(
          children: [
            // Amount Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppConstants.paddingXL),
              decoration: BoxDecoration(
                gradient: isCredit
                    ? const LinearGradient(
                        colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : const LinearGradient(
                        colors: [Color(0xFFE53935), Color(0xFFC62828)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                borderRadius: BorderRadius.circular(AppConstants.radiusXL),
              ),
              child: Column(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        isCredit
                            ? Icons.arrow_downward_rounded
                            : Icons.arrow_upward_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingM),
                  Text(
                    isCredit ? 'Money Received' : 'Money Sent',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingS),
                  Text(
                    '${isCredit ? '+' : '-'}LKR ${amount.toStringAsFixed(2)}',
                    style: AppTextStyles.h1.copyWith(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingM),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(
                        AppConstants.radiusRound,
                      ),
                    ),
                    child: Text(
                      'Completed',
                      style: AppTextStyles.labelMedium.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.paddingXL),

            // Transaction Details
            _buildDetailItem(
              icon: Icons.tag_rounded,
              label: 'Transaction ID',
              value: transaction['id'] as String,
            ),
            _buildDetailItem(
              icon: Icons.calendar_today_rounded,
              label: 'Date & Time',
              value: '${transaction['date']} • 10:30 AM',
            ),
            _buildDetailItem(
              icon: Icons.category_rounded,
              label: 'Category',
              value: (transaction['category'] as String).toUpperCase(),
            ),
            _buildDetailItem(
              icon: Icons.description_rounded,
              label: 'Description',
              value: transaction['description'] as String,
            ),
            _buildDetailItem(
              icon: Icons.account_balance_rounded,
              label: 'Account',
              value: '•••• •••• •••• 7890',
            ),
            _buildDetailItem(
              icon: Icons.check_circle_rounded,
              label: 'Status',
              value: 'Completed',
              valueColor: AppColors.success,
            ),

            const SizedBox(height: AppConstants.paddingXL),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
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
                    icon: const Icon(Icons.share_outlined),
                    label: const Text('Share'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusM,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppConstants.paddingM),
                Expanded(
                  child: OutlinedButton.icon(
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
                    icon: const Icon(Icons.download_outlined),
                    label: const Text('Receipt'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusM,
                        ),
                      ),
                    ),
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
}
