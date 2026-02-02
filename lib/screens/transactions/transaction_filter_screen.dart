import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';

/// Transaction Filter Screen - Filter transactions by date, amount, type
class TransactionFilterScreen extends StatefulWidget {
  const TransactionFilterScreen({super.key});

  @override
  State<TransactionFilterScreen> createState() =>
      _TransactionFilterScreenState();
}

class _TransactionFilterScreenState extends State<TransactionFilterScreen> {
  DateTime? _startDate;
  DateTime? _endDate;
  double _minAmount = 0;
  double _maxAmount = 10000;
  String _selectedType = 'All';

  final List<String> _transactionTypes = ['All', 'Credit', 'Debit', 'Transfer'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Filter Transactions',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _resetFilters,
            child: Text(
              'Reset',
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Range
            Text('Date Range', style: AppTextStyles.h5),
            const SizedBox(height: AppConstants.paddingM),
            Row(
              children: [
                Expanded(
                  child: _buildDatePicker(
                    label: 'From',
                    date: _startDate,
                    onTap: () => _selectDate(true),
                  ),
                ),
                const SizedBox(width: AppConstants.paddingM),
                Expanded(
                  child: _buildDatePicker(
                    label: 'To',
                    date: _endDate,
                    onTap: () => _selectDate(false),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.paddingXL),

            // Amount Range
            Text('Amount Range', style: AppTextStyles.h5),
            const SizedBox(height: AppConstants.paddingM),
            Container(
              padding: const EdgeInsets.all(AppConstants.paddingM),
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${_minAmount.toInt()}',
                        style: AppTextStyles.labelLarge,
                      ),
                      Text(
                        '\$${_maxAmount.toInt()}',
                        style: AppTextStyles.labelLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.paddingS),
                  RangeSlider(
                    values: RangeValues(_minAmount, _maxAmount),
                    min: 0,
                    max: 10000,
                    divisions: 100,
                    activeColor: AppColors.primary,
                    inactiveColor: AppColors.divider,
                    onChanged: (values) {
                      setState(() {
                        _minAmount = values.start;
                        _maxAmount = values.end;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppConstants.paddingXL),

            // Transaction Type
            Text('Transaction Type', style: AppTextStyles.h5),
            const SizedBox(height: AppConstants.paddingM),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: _transactionTypes.map((type) {
                final isSelected = _selectedType == type;
                return GestureDetector(
                  onTap: () => setState(() => _selectedType = type),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : AppColors.accent,
                      borderRadius: BorderRadius.circular(
                        AppConstants.radiusRound,
                      ),
                    ),
                    child: Text(
                      type,
                      style: AppTextStyles.labelMedium.copyWith(
                        color: isSelected
                            ? AppColors.textOnPrimary
                            : AppColors.textSecondary,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingL),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context, {
                'startDate': _startDate,
                'endDate': _endDate,
                'minAmount': _minAmount,
                'maxAmount': _maxAmount,
                'type': _selectedType,
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusL),
              ),
            ),
            child: Text(
              'Apply Filters',
              style: AppTextStyles.buttonMedium.copyWith(
                color: AppColors.textOnPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker({
    required String label,
    required DateTime? date,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppConstants.paddingM),
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(AppConstants.radiusM),
        ),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today_outlined,
              color: AppColors.primary,
              size: 20,
            ),
            const SizedBox(width: AppConstants.paddingS),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.caption),
                Text(
                  date != null
                      ? '${date.day}/${date.month}/${date.year}'
                      : 'Select',
                  style: AppTextStyles.labelMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _selectDate(bool isStart) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.textOnPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  void _resetFilters() {
    setState(() {
      _startDate = null;
      _endDate = null;
      _minAmount = 0;
      _maxAmount = 10000;
      _selectedType = 'All';
    });
  }
}
