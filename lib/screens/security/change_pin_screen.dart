import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';

/// Change PIN Screen
class ChangePinScreen extends StatefulWidget {
  const ChangePinScreen({super.key});

  @override
  State<ChangePinScreen> createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinScreen> {
  final List<TextEditingController> _currentPinControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<TextEditingController> _newPinControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<TextEditingController> _confirmPinControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<FocusNode> _currentPinFocusNodes = List.generate(
    4,
    (_) => FocusNode(),
  );
  final List<FocusNode> _newPinFocusNodes = List.generate(
    4,
    (_) => FocusNode(),
  );
  final List<FocusNode> _confirmPinFocusNodes = List.generate(
    4,
    (_) => FocusNode(),
  );

  @override
  void dispose() {
    for (var controller in _currentPinControllers) {
      controller.dispose();
    }
    for (var controller in _newPinControllers) {
      controller.dispose();
    }
    for (var controller in _confirmPinControllers) {
      controller.dispose();
    }
    for (var node in _currentPinFocusNodes) {
      node.dispose();
    }
    for (var node in _newPinFocusNodes) {
      node.dispose();
    }
    for (var node in _confirmPinFocusNodes) {
      node.dispose();
    }
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
          'Change PIN',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current PIN
            Text('Current PIN', style: AppTextStyles.labelLarge),
            const SizedBox(height: AppConstants.paddingM),
            _buildPinInput(
              _currentPinControllers,
              _currentPinFocusNodes,
              _newPinFocusNodes[0],
            ),
            const SizedBox(height: AppConstants.paddingXL),

            // New PIN
            Text('New PIN', style: AppTextStyles.labelLarge),
            const SizedBox(height: AppConstants.paddingM),
            _buildPinInput(
              _newPinControllers,
              _newPinFocusNodes,
              _confirmPinFocusNodes[0],
            ),
            const SizedBox(height: AppConstants.paddingXL),

            // Confirm PIN
            Text('Confirm New PIN', style: AppTextStyles.labelLarge),
            const SizedBox(height: AppConstants.paddingM),
            _buildPinInput(_confirmPinControllers, _confirmPinFocusNodes, null),
            const SizedBox(height: AppConstants.paddingXL),

            // Info
            Container(
              padding: const EdgeInsets.all(AppConstants.paddingM),
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
                border: Border.all(
                  color: AppColors.warning.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline_rounded, color: AppColors.warning),
                  const SizedBox(width: AppConstants.paddingM),
                  Expanded(
                    child: Text(
                      'Your PIN is used for transaction verification. Never share it with anyone.',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.warning,
                      ),
                    ),
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
          child: ElevatedButton(
            onPressed: _changePin,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.radiusL),
              ),
            ),
            child: Text(
              'Update PIN',
              style: AppTextStyles.buttonMedium.copyWith(
                color: AppColors.textOnPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPinInput(
    List<TextEditingController> controllers,
    List<FocusNode> focusNodes,
    FocusNode? nextSectionFocusNode,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          width: 56,
          height: 56,
          margin: EdgeInsets.only(right: index < 3 ? AppConstants.paddingM : 0),
          child: TextFormField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            keyboardType: TextInputType.number,
            maxLength: 1,
            obscureText: true,
            textAlign: TextAlign.center,
            style: AppTextStyles.h4,
            decoration: InputDecoration(
              counterText: '',
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
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (index < 3) {
                  focusNodes[index + 1].requestFocus();
                } else if (nextSectionFocusNode != null) {
                  nextSectionFocusNode.requestFocus();
                } else {
                  focusNodes[index].unfocus();
                }
              } else if (value.isEmpty && index > 0) {
                focusNodes[index - 1].requestFocus();
              }
            },
          ),
        );
      }),
    );
  }

  String _getPin(List<TextEditingController> controllers) {
    return controllers.map((c) => c.text).join();
  }

  void _changePin() {
    final currentPin = _getPin(_currentPinControllers);
    final newPin = _getPin(_newPinControllers);
    final confirmPin = _getPin(_confirmPinControllers);

    if (currentPin.length != 4) {
      _showError('Please enter current PIN');
      return;
    }

    if (newPin.length != 4) {
      _showError('Please enter new PIN');
      return;
    }

    if (newPin != confirmPin) {
      _showError('PINs do not match');
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('PIN changed successfully'),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
    Navigator.pop(context);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
