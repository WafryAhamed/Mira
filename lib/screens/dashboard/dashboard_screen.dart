import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/custom_button.dart';
import '../../routes/app_routes.dart';

/// Dashboard screen - placeholder for demo after login
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.paddingL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  // Avatar
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

                  // Greeting
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back,',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(user?.fullName ?? 'User', style: AppTextStyles.h4),
                      ],
                    ),
                  ),

                  // Notification Icon
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.notifications_outlined,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.paddingXL),

              // Balance Card
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
                            color: AppColors.textOnPrimary.withValues(
                              alpha: 0.8,
                            ),
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
                          child: Row(
                            children: [
                              const Icon(
                                Icons.visibility_outlined,
                                size: 16,
                                color: AppColors.textOnPrimary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Show',
                                style: AppTextStyles.caption.copyWith(
                                  color: AppColors.textOnPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstants.paddingS),
                    Text(
                      'LKR 2,456,800.00',
                      style: AppTextStyles.h1.copyWith(
                        color: AppColors.textOnPrimary,
                        fontSize: 36,
                      ),
                    ),
                    const SizedBox(height: AppConstants.paddingM),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.success.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.trending_up,
                                size: 14,
                                color: AppColors.success,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '+12.5%',
                                style: AppTextStyles.caption.copyWith(
                                  color: AppColors.success,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'vs last month',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textOnPrimary.withValues(
                              alpha: 0.7,
                            ),
                          ),
                        ),
                      ],
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
                  _buildQuickAction(Icons.send_rounded, 'Send', AppColors.info),
                  _buildQuickAction(
                    Icons.call_received_rounded,
                    'Receive',
                    AppColors.success,
                  ),
                  _buildQuickAction(
                    Icons.receipt_long_rounded,
                    'Bills',
                    AppColors.warning,
                  ),
                  _buildQuickAction(
                    Icons.more_horiz_rounded,
                    'More',
                    AppColors.primary,
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
                    onPressed: () {},
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

              // Transaction List
              _buildTransactionItem(
                icon: Icons.shopping_bag_outlined,
                title: 'Shopping',
                subtitle: 'Keells Super',
                amount: '-LKR 8,500.00',
                isExpense: true,
              ),
              _buildTransactionItem(
                icon: Icons.attach_money_rounded,
                title: 'Salary',
                subtitle: 'Salary - Mira Bank',
                amount: '+LKR 125,000.00',
                isExpense: false,
              ),
              _buildTransactionItem(
                icon: Icons.restaurant_outlined,
                title: 'Food & Dining',
                subtitle: 'Ministry of Crab',
                amount: '-LKR 12,500.00',
                isExpense: true,
              ),
              _buildTransactionItem(
                icon: Icons.bolt_outlined,
                title: 'Utilities',
                subtitle: 'CEB Electricity Bill',
                amount: '-LKR 6,200.00',
                isExpense: true,
              ),

              const SizedBox(height: AppConstants.paddingXL),

              // Logout Button (for demo)
              CustomButton(
                text: 'Logout',
                variant: ButtonVariant.outlined,
                icon: Icons.logout_rounded,
                onPressed: () {
                  authProvider.logout();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.getStarted,
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.background,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textLight,
          currentIndex: 0,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card_rounded),
              label: 'Cards',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz_rounded),
              label: 'Transfer',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppConstants.radiusL),
          ),
          child: Center(child: Icon(icon, color: color, size: 28)),
        ),
        const SizedBox(height: AppConstants.paddingS),
        Text(label, style: AppTextStyles.labelMedium),
      ],
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String amount,
    required bool isExpense,
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
          Text(
            amount,
            style: AppTextStyles.labelLarge.copyWith(
              color: isExpense ? AppColors.error : AppColors.success,
            ),
          ),
        ],
      ),
    );
  }
}
