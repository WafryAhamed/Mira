import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';

/// FAQ Screen - Frequently asked questions
class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  int _expandedIndex = -1;

  final List<Map<String, String>> _faqs = [
    {
      'question': 'How do I reset my password?',
      'answer':
          'Go to the login screen and tap "Forgot Password". Enter your registered email or phone number, and we\'ll send you a link to reset your password.',
    },
    {
      'question': 'How do I transfer money to another bank?',
      'answer':
          'From the Home screen, tap "Send Money" > "Other Bank". Add the beneficiary details or select from saved beneficiaries, enter the amount, and confirm the transfer.',
    },
    {
      'question': 'What are the daily transaction limits?',
      'answer':
          'Daily limits vary by account type:\n• Savings Account: \$5,000/day\n• Current Account: \$10,000/day\nYou can request limit increases through Settings.',
    },
    {
      'question': 'How do I add a beneficiary?',
      'answer':
          'Go to Payments > Transfer > Add Beneficiary. Enter the beneficiary\'s name, bank, and account number. Verify with OTP to save.',
    },
    {
      'question': 'Is my money safe with Mira Bank?',
      'answer':
          'Yes! We use bank-grade encryption, two-factor authentication, and real-time fraud monitoring. Your deposits are protected according to Sri Lankan banking regulations.',
    },
    {
      'question': 'How do I enable biometric login?',
      'answer':
          'Go to Profile > Security Settings > Enable Biometrics. Toggle it on and follow the prompts to set up fingerprint or Face ID.',
    },
    {
      'question': 'How can I view my account statements?',
      'answer':
          'From the side drawer, tap "Statements". Select your account and the month you want to view. You can download statements as PDF.',
    },
    {
      'question': 'What do I do if I lose my card?',
      'answer':
          'Immediately block your card through the app: Cards > Select Card > Block Card. Then contact our 24/7 helpline for a replacement.',
    },
    {
      'question': 'How do I change my PIN?',
      'answer':
          'Go to Profile > Security Settings > Change PIN. Enter your current PIN, then your new PIN twice to confirm.',
    },
    {
      'question': 'Are there any fees for transfers?',
      'answer':
          'Same-bank transfers are free. Other-bank transfers may have a small fee depending on the amount and destination. Check the fee before confirming.',
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
            Icons.arrow_back_ios_rounded,
            color: AppColors.textPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'FAQs',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(AppConstants.paddingL),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingM,
                vertical: AppConstants.paddingS,
              ),
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(AppConstants.radiusL),
              ),
              child: Row(
                children: [
                  Icon(Icons.search_rounded, color: AppColors.textLight),
                  const SizedBox(width: AppConstants.paddingS),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search FAQs...',
                        hintStyle: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textLight,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // FAQ List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.paddingL,
              ),
              itemCount: _faqs.length,
              itemBuilder: (context, index) {
                final faq = _faqs[index];
                final isExpanded = _expandedIndex == index;

                return Container(
                  margin: const EdgeInsets.only(bottom: AppConstants.paddingM),
                  decoration: BoxDecoration(
                    color: AppColors.accent,
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                    border: isExpanded
                        ? Border.all(
                            color: AppColors.primary.withValues(alpha: 0.3),
                          )
                        : null,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          faq['question']!,
                          style: AppTextStyles.labelLarge.copyWith(
                            color: isExpanded
                                ? AppColors.primary
                                : AppColors.textPrimary,
                          ),
                        ),
                        trailing: AnimatedRotation(
                          turns: isExpanded ? 0.5 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: isExpanded
                                ? AppColors.primary
                                : AppColors.textLight,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _expandedIndex = isExpanded ? -1 : index;
                          });
                        },
                      ),
                      AnimatedCrossFade(
                        firstChild: const SizedBox.shrink(),
                        secondChild: Padding(
                          padding: const EdgeInsets.fromLTRB(
                            AppConstants.paddingM,
                            0,
                            AppConstants.paddingM,
                            AppConstants.paddingM,
                          ),
                          child: Text(
                            faq['answer']!,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                              height: 1.5,
                            ),
                          ),
                        ),
                        crossFadeState: isExpanded
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 200),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Still need help
          Padding(
            padding: const EdgeInsets.all(AppConstants.paddingL),
            child: Text(
              'Can\'t find what you\'re looking for? Contact our support team.',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
