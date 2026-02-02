import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';
import '../../routes/app_routes.dart';

/// Bill Payment Screen - Select bill type and pay
class BillPaymentScreen extends StatelessWidget {
  const BillPaymentScreen({super.key});

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
          'Bill Payments',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bill Categories
            Text('Select Bill Type', style: AppTextStyles.h5),
            const SizedBox(height: AppConstants.paddingM),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
              children: [
                _buildBillCategory(
                  context,
                  icon: Icons.bolt_rounded,
                  label: 'Electricity',
                  color: AppColors.warning,
                ),
                _buildBillCategory(
                  context,
                  icon: Icons.water_drop_rounded,
                  label: 'Water',
                  color: AppColors.info,
                ),
                _buildBillCategory(
                  context,
                  icon: Icons.phone_android_rounded,
                  label: 'Mobile',
                  color: AppColors.success,
                ),
                _buildBillCategory(
                  context,
                  icon: Icons.wifi_rounded,
                  label: 'Internet',
                  color: AppColors.primary,
                ),
                _buildBillCategory(
                  context,
                  icon: Icons.tv_rounded,
                  label: 'Cable TV',
                  color: Colors.purple,
                ),
                _buildBillCategory(
                  context,
                  icon: Icons.local_gas_station_rounded,
                  label: 'Gas',
                  color: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: AppConstants.paddingXL),

            // Recent Bills
            Text('Recent Bills', style: AppTextStyles.h5),
            const SizedBox(height: AppConstants.paddingM),
            _buildRecentBill(
              context,
              icon: Icons.bolt_rounded,
              title: 'Ceylon Electricity Board',
              billNo: 'EB-123456',
              amount: '\$89.00',
              color: AppColors.warning,
            ),
            _buildRecentBill(
              context,
              icon: Icons.water_drop_rounded,
              title: 'National Water Board',
              billNo: 'WB-654321',
              amount: '\$32.00',
              color: AppColors.info,
            ),
            _buildRecentBill(
              context,
              icon: Icons.phone_android_rounded,
              title: 'Dialog Mobile',
              billNo: '0771234567',
              amount: '\$15.00',
              color: AppColors.success,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBillCategory(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.billPaymentForm,
        arguments: {'type': label, 'icon': icon, 'color': color},
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(AppConstants.radiusL),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Center(child: Icon(icon, color: color, size: 24)),
            ),
            const SizedBox(height: AppConstants.paddingS),
            Text(label, style: AppTextStyles.labelMedium),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentBill(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String billNo,
    required String amount,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.billPaymentForm,
        arguments: {'type': title, 'billNo': billNo, 'amount': amount},
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
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusS),
              ),
              child: Center(child: Icon(icon, color: color)),
            ),
            const SizedBox(width: AppConstants.paddingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.labelLarge),
                  Text(billNo, style: AppTextStyles.caption),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(amount, style: AppTextStyles.labelLarge),
                Text(
                  'Pay Now',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
