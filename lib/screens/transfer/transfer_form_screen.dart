import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';
import '../../routes/app_routes.dart';

/// Transfer Form Screen - Enter transfer amount and remark
class TransferFormScreen extends StatefulWidget {
  final Map<String, dynamic>? args;

  const TransferFormScreen({super.key, this.args});

  @override
  State<TransferFormScreen> createState() => _TransferFormScreenState();
}

class _TransferFormScreenState extends State<TransferFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _remarkController = TextEditingController();
  String _selectedFromAccount = 'Savings •••• 7890';

  @override
  void dispose() {
    _amountController.dispose();
    _remarkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final beneficiaryName = widget.args?['name'] ?? 'Own Account';
    final beneficiaryAccount = widget.args?['account'] ?? 'Current •••• 4321';
    final isOwnAccount = widget.args?['type'] == 'own';

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
          'Transfer Details',
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
              // From Account
              Text('From Account', style: AppTextStyles.labelLarge),
              const SizedBox(height: AppConstants.paddingS),
              Container(
                padding: const EdgeInsets.all(AppConstants.paddingM),
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(AppConstants.radiusM),
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusS,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.account_balance_wallet_rounded,
                          color: AppColors.textOnPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppConstants.paddingM),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _selectedFromAccount,
                            style: AppTextStyles.labelLarge,
                          ),
                          Text(
                            'Balance: LKR 2,456,800.00',
                            style: AppTextStyles.caption,
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.textLight,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppConstants.paddingL),

              // To Account/Beneficiary
              Text(
                'To ${isOwnAccount ? "Account" : "Beneficiary"}',
                style: AppTextStyles.labelLarge,
              ),
              const SizedBox(height: AppConstants.paddingS),
              Container(
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
                        color: AppColors.info.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusS,
                        ),
                      ),
                      child: Center(
                        child: isOwnAccount
                            ? const Icon(
                                Icons.account_balance_rounded,
                                color: AppColors.info,
                              )
                            : Text(
                                beneficiaryName.substring(0, 1),
                                style: AppTextStyles.h5.copyWith(
                                  color: AppColors.info,
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
                            beneficiaryName,
                            style: AppTextStyles.labelLarge,
                          ),
                          Text(
                            isOwnAccount
                                ? 'Current •••• 4321'
                                : '•••• ${beneficiaryAccount.substring(beneficiaryAccount.length - 4)}',
                            style: AppTextStyles.caption,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppConstants.paddingL),

              // Amount
              Text('Amount', style: AppTextStyles.labelLarge),
              const SizedBox(height: AppConstants.paddingS),
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                style: AppTextStyles.h3,
                decoration: InputDecoration(
                  hintText: '0.00',
                  prefixText: 'LKR ',
                  prefixStyle: AppTextStyles.h3.copyWith(
                    color: AppColors.textLight,
                  ),
                  filled: true,
                  fillColor: AppColors.accent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter amount';
                  }
                  final amount = double.tryParse(value);
                  if (amount == null || amount <= 0) {
                    return 'Please enter a valid amount';
                  }
                  if (amount > 2456800) {
                    return 'Insufficient balance';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppConstants.paddingL),

              // Remark
              Text('Remark (Optional)', style: AppTextStyles.labelLarge),
              const SizedBox(height: AppConstants.paddingS),
              TextFormField(
                controller: _remarkController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Add a note for this transfer',
                  filled: true,
                  fillColor: AppColors.accent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: AppConstants.paddingXL),

              // Quick Amount Buttons
              Text('Quick Amount', style: AppTextStyles.labelLarge),
              const SizedBox(height: AppConstants.paddingS),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildQuickAmountButton('10000'),
                  _buildQuickAmountButton('25000'),
                  _buildQuickAmountButton('50000'),
                  _buildQuickAmountButton('100000'),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingL),
          child: ElevatedButton(
            onPressed: _proceedToConfirmation,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusL),
              ),
            ),
            child: Text(
              'Continue',
              style: AppTextStyles.buttonMedium.copyWith(
                color: AppColors.textOnPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAmountButton(String amount) {
    return GestureDetector(
      onTap: () {
        _amountController.text = amount;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(AppConstants.radiusRound),
        ),
        child: Text(amount, style: AppTextStyles.labelMedium),
      ),
    );
  }

  void _proceedToConfirmation() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(
        context,
        AppRoutes.transferConfirmation,
        arguments: {
          ...?widget.args,
          'amount': _amountController.text,
          'remark': _remarkController.text,
          'fromAccount': _selectedFromAccount,
        },
      );
    }
  }
}
