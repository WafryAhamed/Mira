import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';
import '../../routes/app_routes.dart';

/// Beneficiary List Screen - List of saved beneficiaries
class BeneficiaryListScreen extends StatelessWidget {
  const BeneficiaryListScreen({super.key});

  static const List<Map<String, String>> _beneficiaries = [
    {'name': 'Nimal Fernando', 'account': '1234567890', 'bank': 'Mira Bank'},
    {'name': 'Saman Jayasinghe', 'account': '0987654321', 'bank': 'Mira Bank'},
    {
      'name': 'Chamari Wickramasinghe',
      'account': '5678901234',
      'bank': 'People\'s Bank',
    },
    {
      'name': 'Tharindu Silva',
      'account': '4321098765',
      'bank': 'Commercial Bank',
    },
  ];

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
          'Select Beneficiary',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded, color: AppColors.primary),
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.addBeneficiary),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(AppConstants.paddingL),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search_rounded, color: AppColors.textLight),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search beneficiary',
                        hintStyle: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textLight,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Beneficiary List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingL,
              ),
              itemCount: _beneficiaries.length,
              itemBuilder: (context, index) {
                final beneficiary = _beneficiaries[index];
                return _buildBeneficiaryItem(
                  context,
                  name: beneficiary['name']!,
                  account: beneficiary['account']!,
                  bank: beneficiary['bank']!,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.addBeneficiary),
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add_rounded, color: AppColors.textOnPrimary),
        label: Text(
          'Add New',
          style: AppTextStyles.buttonMedium.copyWith(
            color: AppColors.textOnPrimary,
          ),
        ),
      ),
    );
  }

  Widget _buildBeneficiaryItem(
    BuildContext context, {
    required String name,
    required String account,
    required String bank,
  }) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.transferForm,
        arguments: {
          'type': 'beneficiary',
          'name': name,
          'account': account,
          'bank': bank,
        },
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
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  name.substring(0, 1).toUpperCase(),
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
                  const SizedBox(height: 4),
                  Text(
                    '${_maskAccount(account)} • $bank',
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: AppColors.textLight),
          ],
        ),
      ),
    );
  }

  String _maskAccount(String account) {
    if (account.length > 4) {
      return '•••• ${account.substring(account.length - 4)}';
    }
    return account;
  }
}
