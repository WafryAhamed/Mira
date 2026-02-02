import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';

/// Add Beneficiary Screen - Add a new beneficiary
class AddBeneficiaryScreen extends StatefulWidget {
  const AddBeneficiaryScreen({super.key});

  @override
  State<AddBeneficiaryScreen> createState() => _AddBeneficiaryScreenState();
}

class _AddBeneficiaryScreenState extends State<AddBeneficiaryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _accountController = TextEditingController();
  String _selectedBank = 'Mira Bank';

  final List<String> _banks = [
    'Mira Bank',
    'National Bank',
    'City Bank',
    'Commerce Bank',
    'First Bank',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _accountController.dispose();
    super.dispose();
  }

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
          'Add Beneficiary',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingL),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bank Selection
              Text('Select Bank', style: AppTextStyles.labelLarge),
              const SizedBox(height: AppConstants.paddingS),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(AppConstants.radiusM),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedBank,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    items: _banks.map((bank) {
                      return DropdownMenuItem(
                        value: bank,
                        child: Text(bank, style: AppTextStyles.bodyMedium),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() => _selectedBank = value!);
                    },
                  ),
                ),
              ),
              const SizedBox(height: AppConstants.paddingL),

              // Beneficiary Name
              Text('Beneficiary Name', style: AppTextStyles.labelLarge),
              const SizedBox(height: AppConstants.paddingS),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter full name',
                  filled: true,
                  fillColor: AppColors.accent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(
                    Icons.person_outline_rounded,
                    color: AppColors.textLight,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter beneficiary name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppConstants.paddingL),

              // Account Number
              Text('Account Number', style: AppTextStyles.labelLarge),
              const SizedBox(height: AppConstants.paddingS),
              TextFormField(
                controller: _accountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter account number',
                  filled: true,
                  fillColor: AppColors.accent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(
                    Icons.credit_card_outlined,
                    color: AppColors.textLight,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter account number';
                  }
                  if (value.length < 8) {
                    return 'Account number must be at least 8 digits';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppConstants.paddingXL),

              // Info Box
              Container(
                padding: const EdgeInsets.all(AppConstants.paddingM),
                decoration: BoxDecoration(
                  color: AppColors.info.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppConstants.radiusM),
                  border: Border.all(
                    color: AppColors.info.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline_rounded, color: AppColors.info),
                    const SizedBox(width: AppConstants.paddingM),
                    Expanded(
                      child: Text(
                        'Please verify the account details before saving. Incorrect details may result in failed transfers.',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.info,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingL),
          child: ElevatedButton(
            onPressed: _saveBeneficiary,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusL),
              ),
            ),
            child: Text(
              'Save Beneficiary',
              style: AppTextStyles.buttonMedium.copyWith(
                color: AppColors.textOnPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _saveBeneficiary() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Beneficiary saved successfully'),
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );
      Navigator.pop(context);
    }
  }
}
