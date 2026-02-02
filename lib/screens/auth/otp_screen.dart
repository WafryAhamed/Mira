import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/otp_input.dart';
import '../../routes/app_routes.dart';

/// OTP Verification screen with countdown timer
class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _otp = '';
  bool _hasError = false;
  int _remainingSeconds = AppConstants.otpResendSeconds;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _remainingSeconds = AppConstants.otpResendSeconds;
    _canResend = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        timer.cancel();
      }
    });
  }

  String get _formattedTime {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  Future<void> _handleVerify(AuthProvider authProvider) async {
    if (_otp.length < AppConstants.otpLength) {
      setState(() {
        _hasError = true;
      });
      return;
    }

    final success = await authProvider.verifyOtp(_otp);
    if (success && mounted) {
      Navigator.pushNamed(context, AppRoutes.emailVerification);
    } else {
      setState(() {
        _hasError = true;
      });
    }
  }

  Future<void> _handleResend(AuthProvider authProvider) async {
    if (!_canResend) return;

    final success = await authProvider.resendOtp();
    if (success) {
      _startTimer();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('OTP sent successfully!'),
            backgroundColor: AppColors.success,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.textPrimary,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppConstants.paddingL),
              child: Column(
                children: [
                  const SizedBox(height: AppConstants.paddingXL),

                  // Icon
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.lock_outline_rounded,
                        size: 48,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingXL),

                  // Title
                  Text(
                    'Verify Your Phone',
                    style: AppTextStyles.h3,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppConstants.paddingS),

                  // Subtitle
                  Text(
                    'We have sent a 6-digit verification code to your phone number',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppConstants.paddingXL),

                  // OTP Input
                  OtpInput(
                    length: AppConstants.otpLength,
                    hasError: _hasError,
                    onCompleted: (otp) {
                      setState(() {
                        _otp = otp;
                        _hasError = false;
                      });
                    },
                    onChanged: (otp) {
                      setState(() {
                        _otp = otp;
                        _hasError = false;
                      });
                    },
                  ),

                  // Error Message
                  if (_hasError || authProvider.errorMessage != null) ...[
                    const SizedBox(height: AppConstants.paddingM),
                    Text(
                      authProvider.errorMessage ??
                          'Invalid OTP. Please try again.',
                      style: AppTextStyles.error,
                      textAlign: TextAlign.center,
                    ),
                  ],
                  const SizedBox(height: AppConstants.paddingXL),

                  // Timer
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingM,
                      vertical: AppConstants.paddingS,
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
                        Icon(
                          Icons.timer_outlined,
                          size: 18,
                          color: _canResend
                              ? AppColors.textLight
                              : AppColors.primary,
                        ),
                        const SizedBox(width: AppConstants.paddingS),
                        Text(
                          _canResend ? 'Code expired' : _formattedTime,
                          style: AppTextStyles.labelMedium.copyWith(
                            color: _canResend
                                ? AppColors.textLight
                                : AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingXL),

                  // Verify Button
                  CustomButton(
                    text: 'Verify',
                    isLoading: authProvider.isLoading,
                    onPressed: () => _handleVerify(authProvider),
                  ),
                  const SizedBox(height: AppConstants.paddingM),

                  // Resend OTP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive the code? ",
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      GestureDetector(
                        onTap: _canResend
                            ? () => _handleResend(authProvider)
                            : null,
                        child: Text(
                          'Resend',
                          style: AppTextStyles.labelLarge.copyWith(
                            color: _canResend
                                ? AppColors.primary
                                : AppColors.textLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.paddingXL),

                  // Demo OTP Info
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppConstants.paddingM),
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(AppConstants.radiusM),
                      border: Border.all(color: AppColors.divider),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.info_outline_rounded,
                              color: AppColors.primary,
                              size: 18,
                            ),
                            const SizedBox(width: AppConstants.paddingS),
                            Text(
                              'Demo OTP: ${MockData.demoOtp}',
                              style: AppTextStyles.labelMedium.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Use any 6-digit code or the demo code above',
                          style: AppTextStyles.caption,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
