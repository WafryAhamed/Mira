import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/app_constants.dart';

/// QR Payment Screen - Scan QR and Show My QR
class QrPaymentScreen extends StatefulWidget {
  const QrPaymentScreen({super.key});

  @override
  State<QrPaymentScreen> createState() => _QrPaymentScreenState();
}

class _QrPaymentScreenState extends State<QrPaymentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
          'QR Payment',
          style: AppTextStyles.h5.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingL,
            ),
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(AppConstants.radiusRound),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppConstants.radiusRound),
              ),
              labelColor: AppColors.textOnPrimary,
              unselectedLabelColor: AppColors.textSecondary,
              labelStyle: AppTextStyles.labelMedium,
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: 'Scan QR'),
                Tab(text: 'My QR'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildScanQrTab(), _buildMyQrTab()],
      ),
    );
  }

  Widget _buildScanQrTab() {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.paddingL),
      child: Column(
        children: [
          const SizedBox(height: AppConstants.paddingXL),
          // Scanner Frame (UI only)
          Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.radiusL),
              border: Border.all(color: AppColors.primary, width: 3),
            ),
            child: Stack(
              children: [
                // Corner decorations
                Positioned(top: 0, left: 0, child: _buildCorner(true, true)),
                Positioned(top: 0, right: 0, child: _buildCorner(true, false)),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: _buildCorner(false, true),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: _buildCorner(false, false),
                ),
                // Center content
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.qr_code_scanner_rounded,
                        size: 64,
                        color: AppColors.primary.withValues(alpha: 0.5),
                      ),
                      const SizedBox(height: AppConstants.paddingM),
                      Text(
                        'Position QR code here',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppConstants.paddingXL),
          Text(
            'Align the QR code within the frame to scan',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppConstants.paddingXL),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildActionButton(Icons.flash_off_rounded, 'Flash'),
              const SizedBox(width: AppConstants.paddingXL),
              _buildActionButton(Icons.photo_library_outlined, 'Gallery'),
            ],
          ),

          const Spacer(),

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
                    'Camera permission required for QR scanning',
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
    );
  }

  Widget _buildMyQrTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.paddingL),
      child: Column(
        children: [
          const SizedBox(height: AppConstants.paddingXL),
          // My QR Code
          Container(
            padding: const EdgeInsets.all(AppConstants.paddingXL),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(AppConstants.radiusXL),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                // QR Code placeholder
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: AppColors.accent,
                    borderRadius: BorderRadius.circular(AppConstants.radiusM),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Icon(
                          Icons.qr_code_2_rounded,
                          size: 160,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            borderRadius: BorderRadius.circular(
                              AppConstants.radiusS,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'M',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppConstants.paddingL),

                // User Info
                Text('Kasun Perera', style: AppTextStyles.h4),
                const SizedBox(height: AppConstants.paddingXS),
                Text(
                  'Savings Account',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppConstants.paddingS),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.accent,
                    borderRadius: BorderRadius.circular(
                      AppConstants.radiusRound,
                    ),
                  ),
                  child: Text(
                    '•••• •••• •••• 7890',
                    style: AppTextStyles.labelMedium,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppConstants.paddingXL),

          // Share Options
          Row(
            children: [
              Expanded(
                child: _buildShareButton(
                  Icons.share_outlined,
                  'Share',
                  AppColors.primary,
                ),
              ),
              const SizedBox(width: AppConstants.paddingM),
              Expanded(
                child: _buildShareButton(
                  Icons.download_outlined,
                  'Save',
                  AppColors.info,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.paddingXL),

          // Instructions
          Container(
            padding: const EdgeInsets.all(AppConstants.paddingM),
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(AppConstants.radiusM),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('How it works', style: AppTextStyles.labelLarge),
                const SizedBox(height: AppConstants.paddingS),
                _buildStep('1', 'Show this QR to the sender'),
                _buildStep('2', 'They scan it with their banking app'),
                _buildStep('3', 'Money is transferred instantly'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCorner(bool isTop, bool isLeft) {
    return SizedBox(
      width: 30,
      height: 30,
      child: CustomPaint(
        painter: CornerPainter(isTop: isTop, isLeft: isLeft),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$label feature coming soon'),
            backgroundColor: AppColors.primary,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.accent,
              shape: BoxShape.circle,
            ),
            child: Center(child: Icon(icon, color: AppColors.primary)),
          ),
          const SizedBox(height: AppConstants.paddingS),
          Text(label, style: AppTextStyles.caption),
        ],
      ),
    );
  }

  Widget _buildShareButton(IconData icon, String label, Color color) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$label feature coming soon'),
            backgroundColor: AppColors.primary,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppConstants.radiusM),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            const SizedBox(width: AppConstants.paddingS),
            Text(
              label,
              style: AppTextStyles.labelMedium.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(String number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.paddingS),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textOnPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppConstants.paddingM),
          Text(text, style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }
}

/// Custom painter for corner decorations
class CornerPainter extends CustomPainter {
  final bool isTop;
  final bool isLeft;

  CornerPainter({required this.isTop, required this.isLeft});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final path = Path();

    if (isTop && isLeft) {
      path.moveTo(0, size.height);
      path.lineTo(0, 0);
      path.lineTo(size.width, 0);
    } else if (isTop && !isLeft) {
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
    } else if (!isTop && isLeft) {
      path.moveTo(0, 0);
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height);
    } else {
      path.moveTo(0, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
