import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';
import '../../routes/app_routes.dart';

/// App Lock Screen - PIN or Biometric unlock after inactivity
class AppLockScreen extends StatefulWidget {
  const AppLockScreen({super.key});

  @override
  State<AppLockScreen> createState() => _AppLockScreenState();
}

class _AppLockScreenState extends State<AppLockScreen> {
  final List<String> _enteredPin = [];
  final int _pinLength = 4;
  bool _isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingL),
          child: Column(
            children: [
              const Spacer(),

              // Logo
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(AppConstants.radiusL),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'M',
                    style: AppTextStyles.h1.copyWith(
                      color: AppColors.textOnPrimary,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppConstants.paddingXL),

              // Title
              Text('Welcome Back', style: AppTextStyles.h3),
              const SizedBox(height: AppConstants.paddingS),
              Text(
                'Enter your PIN to continue',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppConstants.paddingXL),

              // PIN Dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_pinLength, (index) {
                  final isFilled = index < _enteredPin.length;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 16,
                    height: 16,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: _isError
                          ? AppColors.error
                          : (isFilled ? AppColors.primary : Colors.transparent),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _isError ? AppColors.error : AppColors.primary,
                        width: 2,
                      ),
                    ),
                  );
                }),
              ),
              if (_isError) ...[
                const SizedBox(height: AppConstants.paddingM),
                Text(
                  'Incorrect PIN. Please try again.',
                  style: AppTextStyles.caption.copyWith(color: AppColors.error),
                ),
              ],

              const Spacer(),

              // Number Pad
              _buildNumberPad(),
              const SizedBox(height: AppConstants.paddingL),

              // Biometric Option
              GestureDetector(
                onTap: _useBiometric,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.accent,
                    borderRadius: BorderRadius.circular(
                      AppConstants.radiusRound,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.fingerprint_rounded, color: AppColors.primary),
                      const SizedBox(width: AppConstants.paddingS),
                      Text(
                        'Use Biometrics',
                        style: AppTextStyles.labelMedium.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppConstants.paddingL),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberPad() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNumberKey('1'),
            _buildNumberKey('2'),
            _buildNumberKey('3'),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNumberKey('4'),
            _buildNumberKey('5'),
            _buildNumberKey('6'),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNumberKey('7'),
            _buildNumberKey('8'),
            _buildNumberKey('9'),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionKey(Icons.backspace_outlined, _deleteDigit),
            _buildNumberKey('0'),
            _buildActionKey(Icons.check_rounded, _submitPin, isSubmit: true),
          ],
        ),
      ],
    );
  }

  Widget _buildNumberKey(String digit) {
    return GestureDetector(
      onTap: () => _addDigit(digit),
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          color: AppColors.accent,
          shape: BoxShape.circle,
        ),
        child: Center(child: Text(digit, style: AppTextStyles.h3)),
      ),
    );
  }

  Widget _buildActionKey(
    IconData icon,
    VoidCallback onTap, {
    bool isSubmit = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          color: isSubmit ? AppColors.primary : AppColors.accent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            color: isSubmit ? AppColors.textOnPrimary : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }

  void _addDigit(String digit) {
    if (_enteredPin.length < _pinLength) {
      setState(() {
        _isError = false;
        _enteredPin.add(digit);
      });

      if (_enteredPin.length == _pinLength) {
        _verifyPin();
      }
    }
  }

  void _deleteDigit() {
    if (_enteredPin.isNotEmpty) {
      setState(() {
        _isError = false;
        _enteredPin.removeLast();
      });
    }
  }

  void _submitPin() {
    if (_enteredPin.length == _pinLength) {
      _verifyPin();
    }
  }

  void _verifyPin() {
    final pin = _enteredPin.join();
    // Demo: correct PIN is 1234
    if (pin == '1234') {
      Navigator.pushReplacementNamed(context, AppRoutes.main);
    } else {
      setState(() {
        _isError = true;
        _enteredPin.clear();
      });
    }
  }

  void _useBiometric() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Biometric authentication coming soon'),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
