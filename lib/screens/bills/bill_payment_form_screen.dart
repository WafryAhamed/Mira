import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';
import '../../routes/app_routes.dart';

/// Bill Payment Form Screen - Enter bill details and pay
class BillPaymentFormScreen extends StatefulWidget {
  final Map<String, dynamic>? args;

  const BillPaymentFormScreen({super.key, this.args});

  @override
  State<BillPaymentFormScreen> createState() => _BillPaymentFormScreenState();
}

class _BillPaymentFormScreenState extends State<BillPaymentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _billNoController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _billNoController.text = widget.args?['billNo'] ?? '';
    final amount =
        widget.args?['amount']?.toString().replaceAll('\$', '') ?? '';
    _amountController.text = amount;
  }

  @override
  void dispose() {
    _billNoController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final billType = widget.args?['type'] ?? 'Bill';

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
          '$billType Payment',
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
              // Bill Type Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppConstants.paddingL),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(AppConstants.radiusL),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.background.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(
                          AppConstants.radiusM,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          _getBillIcon(billType),
                          color: AppColors.textOnPrimary,
                          size: 28,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppConstants.paddingM),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          billType,
                          style: AppTextStyles.h5.copyWith(
                            color: AppColors.textOnPrimary,
                          ),
                        ),
                        Text(
                          'Bill Payment',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textOnPrimary.withValues(
                              alpha: 0.8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppConstants.paddingXL),

              // Bill Number
              Text('Bill Number / Account', style: AppTextStyles.labelLarge),
              const SizedBox(height: AppConstants.paddingS),
              TextFormField(
                controller: _billNoController,
                decoration: InputDecoration(
                  hintText: 'Enter bill number',
                  filled: true,
                  fillColor: AppColors.accent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(
                    Icons.receipt_outlined,
                    color: AppColors.textLight,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter bill number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppConstants.paddingL),

              // Amount
              Text('Amount', style: AppTextStyles.labelLarge),
              const SizedBox(height: AppConstants.paddingS),
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '0.00',
                  prefixText: '\$ ',
                  filled: true,
                  fillColor: AppColors.accent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                    borderSide: BorderSide.none,
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
                  return null;
                },
              ),
              const SizedBox(height: AppConstants.paddingL),

              // From Account
              Text('Pay From', style: AppTextStyles.labelLarge),
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
                            'Savings •••• 7890',
                            style: AppTextStyles.labelLarge,
                          ),
                          Text(
                            'Balance: \$18,568.00',
                            style: AppTextStyles.caption,
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.check_circle_rounded,
                      color: AppColors.primary,
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
            onPressed: _proceedToConfirmation,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusL),
              ),
            ),
            child: Text(
              'Pay Now',
              style: AppTextStyles.buttonMedium.copyWith(
                color: AppColors.textOnPrimary,
              ),
            ),
          ),
        ),
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

  void _proceedToConfirmation() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(
        context,
        AppRoutes.billPaymentConfirmation,
        arguments: {
          ...?widget.args,
          'billNo': _billNoController.text,
          'amount': _amountController.text,
        },
      );
    }
  }
}
