import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';
import '../../routes/app_routes.dart';

/// Transfer Options Screen - Select transfer type
class TransferOptionsScreen extends StatelessWidget {
  const TransferOptionsScreen({super.key});

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
          'Transfer Money',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Transfer Type', style: AppTextStyles.h5),
            const SizedBox(height: AppConstants.paddingM),

            _buildTransferOption(
              context,
              icon: Icons.account_balance_wallet_rounded,
              title: 'Own Account',
              subtitle: 'Transfer between your accounts',
              color: AppColors.primary,
              onTap: () => Navigator.pushNamed(
                context,
                AppRoutes.transferForm,
                arguments: {'type': 'own'},
              ),
            ),
            _buildTransferOption(
              context,
              icon: Icons.account_balance_rounded,
              title: 'Same Bank',
              subtitle: 'Transfer to Mira Bank accounts',
              color: AppColors.info,
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.beneficiaryList),
            ),
            _buildTransferOption(
              context,
              icon: Icons.swap_horiz_rounded,
              title: 'Other Bank',
              subtitle: 'Transfer to other bank accounts',
              color: AppColors.success,
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.beneficiaryList),
            ),

            const SizedBox(height: AppConstants.paddingXL),

            // Recent Transfers
            Text('Recent Transfers', style: AppTextStyles.h5),
            const SizedBox(height: AppConstants.paddingM),
            _buildRecentTransfer(
              name: 'Nimal Fernando',
              account: '•••• 5678',
              amount: 'LKR 25,000',
            ),
            _buildRecentTransfer(
              name: 'Saman Jayasinghe',
              account: '•••• 9012',
              amount: 'LKR 15,000',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransferOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppConstants.paddingM),
        padding: const EdgeInsets.all(AppConstants.paddingL),
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(AppConstants.radiusL),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
              ),
              child: Center(child: Icon(icon, color: color, size: 28)),
            ),
            const SizedBox(width: AppConstants.paddingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.h5),
                  const SizedBox(height: 4),
                  Text(subtitle, style: AppTextStyles.caption),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: AppColors.textLight),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentTransfer({
    required String name,
    required String account,
    required String amount,
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
              gradient: AppColors.primaryGradient,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                name.substring(0, 1),
                style: AppTextStyles.h5.copyWith(
                  color: AppColors.textOnPrimary,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppConstants.paddingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextStyles.labelLarge),
                Text(account, style: AppTextStyles.caption),
              ],
            ),
          ),
          Text(amount, style: AppTextStyles.labelLarge),
        ],
      ),
    );
  }
}
