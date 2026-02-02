import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';
import '../../providers/onboarding_provider.dart';
import '../../widgets/onboarding_page.dart';
import '../../widgets/custom_button.dart';
import '../../routes/app_routes.dart';

/// Onboarding screen with 3 pages introducing the app
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: AppConstants.pageTurnDuration,
      curve: Curves.easeInOut,
    );
  }

  void _onSkip() {
    Navigator.pushReplacementNamed(context, AppRoutes.getStarted);
  }

  void _onNext(OnboardingProvider provider) {
    if (provider.isLastPage) {
      Navigator.pushReplacementNamed(context, AppRoutes.getStarted);
    } else {
      _goToPage(provider.currentPage + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingProvider(),
      child: Consumer<OnboardingProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
              child: Column(
                children: [
                  // Skip Button
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(AppConstants.paddingM),
                      child: TextButton(
                        onPressed: _onSkip,
                        child: Text(
                          'Skip',
                          style: AppTextStyles.buttonMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Pages
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: MockData.onboardingData.length,
                      onPageChanged: (index) => provider.setPage(index),
                      itemBuilder: (context, index) {
                        final data = MockData.onboardingData[index];
                        return OnboardingPage(
                          title: data['title']!,
                          subtitle: data['subtitle']!,
                          description: data['description']!,
                          illustration: _buildIllustration(index),
                        );
                      },
                    ),
                  ),

                  // Dot Indicator
                  DotIndicator(
                    count: MockData.onboardingData.length,
                    currentIndex: provider.currentPage,
                  ),
                  const SizedBox(height: AppConstants.paddingXL),

                  // Navigation Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingL,
                    ),
                    child: Row(
                      children: [
                        // Back Button (hidden on first page)
                        if (!provider.isFirstPage)
                          Expanded(
                            child: CustomButton(
                              text: 'Back',
                              variant: ButtonVariant.outlined,
                              onPressed: () =>
                                  _goToPage(provider.currentPage - 1),
                            ),
                          ),
                        if (!provider.isFirstPage)
                          const SizedBox(width: AppConstants.paddingM),

                        // Next/Get Started Button
                        Expanded(
                          flex: provider.isFirstPage ? 1 : 1,
                          child: CustomButton(
                            text: provider.isLastPage ? 'Get Started' : 'Next',
                            onPressed: () => _onNext(provider),
                            icon: provider.isLastPage
                                ? null
                                : Icons.arrow_forward_rounded,
                            iconAfterText: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingXL),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildIllustration(int index) {
    // Animated illustration placeholders
    // In production, these would be Lottie animations
    final icons = [
      Icons.account_balance_wallet_rounded,
      Icons.security_rounded,
      Icons.swap_horiz_rounded,
    ];

    final colors = [AppColors.primary, AppColors.success, AppColors.info];

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: colors[index].withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: colors[index].withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(icons[index], size: 72, color: colors[index]),
            ),
          ),
        ),
      ),
    );
  }
}
