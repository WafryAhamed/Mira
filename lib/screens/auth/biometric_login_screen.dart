import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';
import '../../routes/app_routes.dart';

/// Biometric Login Screen - Fingerprint/Face ID prompt (UI only)
class BiometricLoginScreen extends StatefulWidget {
  const BiometricLoginScreen({super.key});

  @override
  State<BiometricLoginScreen> createState() => _BiometricLoginScreenState();
}

class _BiometricLoginScreenState extends State<BiometricLoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleBiometricAuth() async {
    setState(() => _isAuthenticating = true);

    // Simulate biometric authentication
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() => _isAuthenticating = false);
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.main,
        (route) => false,
      );
    }
  }

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

              // Header
              Text(
                'Welcome Back!',
                style: AppTextStyles.h2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.paddingS),
              Text(
                'Use your fingerprint or Face ID to login quickly',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.paddingXL * 2),

              // Biometric Icon with pulse animation
              GestureDetector(
                onTap: _isAuthenticating ? null : _handleBiometricAuth,
                child: AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _isAuthenticating ? _pulseAnimation.value : 1.0,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.3),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: _isAuthenticating
                              ? const CircularProgressIndicator(
                                  color: AppColors.textOnPrimary,
                                  strokeWidth: 3,
                                )
                              : const Icon(
                                  Icons.fingerprint_rounded,
                                  color: AppColors.textOnPrimary,
                                  size: 64,
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppConstants.paddingL),

              Text(
                _isAuthenticating ? 'Authenticating...' : 'Tap to authenticate',
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),

              const Spacer(),

              // Alternative Options
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppConstants.paddingM),
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(AppConstants.radiusL),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(
                            AppConstants.radiusM,
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.dialpad_rounded,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      title: Text('Use PIN', style: AppTextStyles.labelLarge),
                      subtitle: Text(
                        'Enter your 4-digit PIN',
                        style: AppTextStyles.caption,
                      ),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                        color: AppColors.textLight,
                      ),
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.appLock),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(
                            AppConstants.radiusM,
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.password_rounded,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      title: Text(
                        'Use Password',
                        style: AppTextStyles.labelLarge,
                      ),
                      subtitle: Text(
                        'Login with email and password',
                        style: AppTextStyles.caption,
                      ),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                        color: AppColors.textLight,
                      ),
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.login),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppConstants.paddingL),
            ],
          ),
        ),
      ),
    );
  }
}
