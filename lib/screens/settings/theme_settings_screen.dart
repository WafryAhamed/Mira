import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';

/// Theme Settings Screen - Light mode display (yellow & white)
class ThemeSettingsScreen extends StatefulWidget {
  const ThemeSettingsScreen({super.key});

  @override
  State<ThemeSettingsScreen> createState() => _ThemeSettingsScreenState();
}

class _ThemeSettingsScreenState extends State<ThemeSettingsScreen> {
  String _selectedTheme = 'light';

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
          'Theme Settings',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Theme', style: AppTextStyles.h5),
            const SizedBox(height: AppConstants.paddingM),

            // Light Theme (Current)
            _buildThemeOption(
              id: 'light',
              title: 'Light Mode',
              subtitle: 'Yellow & White theme (Default)',
              icon: Icons.light_mode_rounded,
              previewColors: [AppColors.primary, AppColors.background],
              isSelected: _selectedTheme == 'light',
            ),

            // System Theme
            _buildThemeOption(
              id: 'system',
              title: 'System Default',
              subtitle: 'Follow system settings',
              icon: Icons.settings_suggest_rounded,
              previewColors: [AppColors.primary, Colors.grey.shade300],
              isSelected: _selectedTheme == 'system',
              isDisabled: true,
            ),

            // Dark Theme (Coming Soon)
            _buildThemeOption(
              id: 'dark',
              title: 'Dark Mode',
              subtitle: 'Coming soon',
              icon: Icons.dark_mode_rounded,
              previewColors: [AppColors.primary, Colors.grey.shade800],
              isSelected: _selectedTheme == 'dark',
              isDisabled: true,
            ),

            const SizedBox(height: AppConstants.paddingXL),

            // Theme Preview
            Text('Preview', style: AppTextStyles.h5),
            const SizedBox(height: AppConstants.paddingM),

            Container(
              padding: const EdgeInsets.all(AppConstants.paddingL),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(AppConstants.radiusL),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.background.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(
                            AppConstants.radiusS,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'M',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppConstants.paddingM),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mira Bank',
                            style: AppTextStyles.labelLarge.copyWith(
                              color: AppColors.textOnPrimary,
                            ),
                          ),
                          Text(
                            'Your trusted partner',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textOnPrimary.withValues(
                                alpha: 0.7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.paddingL),
                  Text(
                    '\$18,568.00',
                    style: AppTextStyles.h2.copyWith(
                      color: AppColors.textOnPrimary,
                    ),
                  ),
                  const SizedBox(height: AppConstants.paddingS),
                  Text(
                    'Total Balance',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textOnPrimary.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppConstants.paddingL),

            // Color Palette
            Text('Color Palette', style: AppTextStyles.labelLarge),
            const SizedBox(height: AppConstants.paddingM),
            Row(
              children: [
                _buildColorSwatch('Primary', AppColors.primary),
                _buildColorSwatch('Background', AppColors.background),
                _buildColorSwatch('Accent', AppColors.accent),
                _buildColorSwatch('Success', AppColors.success),
              ],
            ),

            const SizedBox(height: AppConstants.paddingXL),

            // Info
            Container(
              padding: const EdgeInsets.all(AppConstants.paddingM),
              decoration: BoxDecoration(
                color: AppColors.info.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppConstants.radiusM),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: AppColors.info,
                    size: 20,
                  ),
                  const SizedBox(width: AppConstants.paddingS),
                  Expanded(
                    child: Text(
                      'Dark mode and system theme support coming in future updates',
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
    );
  }

  Widget _buildThemeOption({
    required String id,
    required String title,
    required String subtitle,
    required IconData icon,
    required List<Color> previewColors,
    required bool isSelected,
    bool isDisabled = false,
  }) {
    return GestureDetector(
      onTap: isDisabled
          ? null
          : () {
              setState(() => _selectedTheme = id);
            },
      child: Container(
        margin: const EdgeInsets.only(bottom: AppConstants.paddingM),
        padding: const EdgeInsets.all(AppConstants.paddingM),
        decoration: BoxDecoration(
          color: isDisabled
              ? AppColors.accent.withValues(alpha: 0.5)
              : AppColors.accent,
          borderRadius: BorderRadius.circular(AppConstants.radiusM),
          border: isSelected
              ? Border.all(color: AppColors.primary, width: 2)
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: previewColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(AppConstants.radiusS),
              ),
              child: Center(
                child: Icon(icon, color: AppColors.textOnPrimary, size: 22),
              ),
            ),
            const SizedBox(width: AppConstants.paddingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.labelLarge.copyWith(
                      color: isDisabled
                          ? AppColors.textLight
                          : AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: AppTextStyles.caption.copyWith(
                      color: isDisabled
                          ? AppColors.textLight
                          : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle_rounded, color: AppColors.primary)
            else if (isDisabled)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.textLight.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(AppConstants.radiusRound),
                ),
                child: Text(
                  'Soon',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textLight,
                    fontSize: 10,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSwatch(String name, Color color) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(AppConstants.radiusS),
              border: color == AppColors.background
                  ? Border.all(color: AppColors.divider)
                  : null,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: AppTextStyles.caption.copyWith(fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
