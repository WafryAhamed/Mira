import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/app_drawer.dart';
import '../../routes/app_routes.dart';

/// Home Screen - Main dashboard after login
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;

    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded, color: AppColors.textPrimary),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
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
                  Icons.notifications_outlined,
                  color: AppColors.textPrimary,
                  size: 22,
                ),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.notifications);
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Section
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      user?.fullName.substring(0, 1).toUpperCase() ?? 'U',
                      style: AppTextStyles.h3.copyWith(
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
                      Text(
                        _getGreeting(),
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text(user?.fullName ?? 'User', style: AppTextStyles.h4),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.paddingXL),

            // Account Balance Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppConstants.paddingL),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(AppConstants.radiusXL),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Balance',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textOnPrimary.withValues(alpha: 0.8),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.background.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(
                            AppConstants.radiusRound,
                          ),
                        ),
                        child: Text(
                          'Savings',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textOnPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.paddingS),
                  Text(
                    '\$24,568.00',
                    style: AppTextStyles.h1.copyWith(
                      color: AppColors.textOnPrimary,
                      fontSize: 36,
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingS),
                  Text(
                    'Account: •••• •••• •••• 7890',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textOnPrimary.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.paddingXL),

            // Quick Actions
            Text('Quick Actions', style: AppTextStyles.h5),
            const SizedBox(height: AppConstants.paddingM),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildQuickAction(
                  context,
                  icon: Icons.send_rounded,
                  label: 'Send Money',
                  color: AppColors.info,
                  route: AppRoutes.transferOptions,
                ),
                _buildQuickAction(
                  context,
                  icon: Icons.receipt_long_rounded,
                  label: 'Pay Bills',
                  color: AppColors.warning,
                  route: AppRoutes.billPayment,
                ),
                _buildQuickAction(
                  context,
                  icon: Icons.qr_code_scanner_rounded,
                  label: 'Scan QR',
                  color: AppColors.success,
                  route: AppRoutes.qrPayment,
                ),
              ],
            ),
            const SizedBox(height: AppConstants.paddingXL),

            // Recent Transactions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Transactions', style: AppTextStyles.h5),
                TextButton(
                  onPressed: () {
                    // Navigate to transactions tab
                  },
                  child: Text(
                    'See All',
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.paddingS),

            // Transaction List (first 5)
            ...MockData.transactionHistory
                .take(5)
                .map(
                  (txn) => _buildTransactionItem(
                    icon: _getTransactionIcon(txn['category'] as String),
                    title: txn['title'] as String,
                    subtitle: txn['description'] as String,
                    amount: txn['amount'] as double,
                    isCredit: txn['isCredit'] as bool,
                    date: txn['date'] as String,
                  ),
                ),
          ],
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

  Widget _buildQuickAction(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    String? route,
  }) {
    return GestureDetector(
      onTap: () {
        if (route != null) {
          Navigator.pushNamed(context, route);
        }
      },
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppConstants.radiusL),
            ),
            child: Center(child: Icon(icon, color: color, size: 28)),
          ),
          const SizedBox(height: AppConstants.paddingS),
          Text(
            label,
            style: AppTextStyles.labelMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
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
