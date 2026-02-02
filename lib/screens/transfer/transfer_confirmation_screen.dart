import 'package:flutter/material.dart';
import 'dart:math';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';
import '../../routes/app_routes.dart';

/// Transfer Confirmation Screen - Review and confirm transfer
class TransferConfirmationScreen extends StatelessWidget {
  final Map<String, dynamic>? args;

  const TransferConfirmationScreen({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    final beneficiaryName = args?['name'] ?? 'Own Account';
    final amount = args?['amount'] ?? '0';
    final remark = args?['remark'] ?? '';
    final isOwnAccount = args?['type'] == 'own';

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
          'Confirm Transfer',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingL),
        child: Column(
          children: [
            // Amount Display
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppConstants.paddingXL),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(AppConstants.radiusXL),
              ),
              child: Column(
                children: [
                  Text(
                    'Transfer Amount',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textOnPrimary.withValues(alpha: 0.8),
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingS),
                  Text(
                    'LKR $amount',
                    style: AppTextStyles.h1.copyWith(
                      color: AppColors.textOnPrimary,
                      fontSize: 42,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.paddingXL),

            // Transfer Details
            _buildDetailRow('From', 'Savings •••• 7890'),
            _buildDetailRow(
              'To',
              isOwnAccount ? 'Current •••• 4321' : beneficiaryName,
            ),
            if (!isOwnAccount)
              _buildDetailRow('Bank', args?['bank'] ?? 'Mira Bank'),
            _buildDetailRow('Transfer Fee', 'LKR 0.00'),
            if (remark.isNotEmpty) _buildDetailRow('Remark', remark),

            const SizedBox(height: AppConstants.paddingXL),

            // Security Notice
            Container(
              padding: const EdgeInsets.all(AppConstants.paddingM),
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                border: Border.all(
                  color: AppColors.warning.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.security_rounded, color: AppColors.warning),
                  const SizedBox(width: AppConstants.paddingM),
                  Expanded(
                    child: Text(
                      'Please verify all details before confirming. This action cannot be undone.',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.warning,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingL),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => _confirmTransfer(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size.fromHeight(56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radiusL),
                  ),
                ),
                child: Text(
                  'Confirm Transfer',
                  style: AppTextStyles.buttonMedium.copyWith(
                    color: AppColors.textOnPrimary,
                  ),
                ),
              ),
              const SizedBox(height: AppConstants.paddingM),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(56),
                  side: const BorderSide(color: AppColors.textLight),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radiusL),
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: AppTextStyles.buttonMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingM),
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingM,
        vertical: AppConstants.paddingM,
      ),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.caption),
          Flexible(
            child: Text(
              value,
              style: AppTextStyles.labelLarge,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  void _confirmTransfer(BuildContext context) {
    // Simulate random success/failure for demo
    final isSuccess = Random().nextDouble() > 0.2; // 80% success rate

    Navigator.pushNamedAndRemoveUntil(
      context,
      isSuccess ? AppRoutes.transferSuccess : AppRoutes.transferFailure,
      (route) =>
          route.settings.name == AppRoutes.main ||
          route.settings.name == AppRoutes.dashboard,
      arguments: args,
    );
  }
}
