import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';
import '../../routes/app_routes.dart';

/// Bill Payment Confirmation Screen
class BillPaymentConfirmationScreen extends StatelessWidget {
  final Map<String, dynamic>? args;

  const BillPaymentConfirmationScreen({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    final billType = args?['type'] ?? 'Bill';
    final billNo = args?['billNo'] ?? '';
    final amount = args?['amount'] ?? '0';

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
          'Confirm Payment',
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
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: AppColors.background.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        _getBillIcon(billType),
                        color: AppColors.textOnPrimary,
                        size: 32,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingM),
                  Text(
                    billType,
                    style: AppTextStyles.labelLarge.copyWith(
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

            // Payment Details
            _buildDetailRow('Bill Type', billType),
            _buildDetailRow('Bill Number', billNo),
            _buildDetailRow('Amount', 'LKR $amount'),
            _buildDetailRow('From Account', 'Savings •••• 7890'),
            _buildDetailRow('Payment Fee', 'LKR 0.00'),

            const SizedBox(height: AppConstants.paddingXL),

            // Total
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppConstants.paddingM),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                border: Border.all(color: AppColors.primary),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Amount', style: AppTextStyles.labelLarge),
                  Text(
                    'LKR $amount',
                    style: AppTextStyles.h4.copyWith(color: AppColors.primary),
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
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.billPaymentSuccess,
                    (route) =>
                        route.settings.name == AppRoutes.main ||
                        route.settings.name == AppRoutes.dashboard,
                    arguments: {...?args, 'name': billType},
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size.fromHeight(56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radiusL),
                  ),
                ),
                child: Text(
                  'Confirm Payment',
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

  IconData _getBillIcon(String type) {
    final lower = type.toLowerCase();
    if (lower.contains('electric')) return Icons.bolt_rounded;
    if (lower.contains('water')) return Icons.water_drop_rounded;
    if (lower.contains('mobile')) return Icons.phone_android_rounded;
    if (lower.contains('internet')) return Icons.wifi_rounded;
    if (lower.contains('tv')) return Icons.tv_rounded;
    if (lower.contains('gas')) return Icons.local_gas_station_rounded;
    return Icons.receipt_long_rounded;
  }
}
