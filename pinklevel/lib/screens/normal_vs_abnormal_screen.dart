import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';

class NormalVsAbnormalScreen extends StatelessWidget {
  const NormalVsAbnormalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryPink,
        foregroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        title: const Text('Normal vs Abnormal'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What\'s Normal?',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 12),
              Text(
                'It is important to understand the normal changes in your body so that you can identify the changes that need attention.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppTheme.textSecondary, height: 1.5),
              ),
              const SizedBox(height: 28),
              // Side-by-side comparison
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildSection(
                      context: context,
                      title: 'सामान्य',
                      icon: Remix.checkbox_circle_line,
                      color: AppTheme.successGreen,
                      items: [
                        'दोनों स्तनों के आकार में हल्का अंतर',
                        'पीरियड से पहले हल्की संवेदनशीलता',
                        'हल्की गांठदार या रस्सी जैसी बनावट',
                        'गर्भावस्था के दौरान स्राव',
                        'मासिक चक्र के दौरान आकार में बदलाव',
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildSection(
                      context: context,
                      title: 'डॉक्टर से मिलें',
                      icon: Remix.stethoscope_line,
                      color: AppTheme.darkPink,
                      items: [
                        'नई कठोर या बिना दर्द वाली गांठ',
                        'त्वचा में गड्ढे या सिकुड़न',
                        'निप्पल का अंदर की ओर मुड़ना',
                        'निप्पल से खून जैसा स्राव',
                        'लगातार लालिमा या दाने',
                        'बिना कारण आकार में बदलाव',
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              const InfoBanner(
                message:
                    'You know your body best. If something feels different or wrong, trust your instincts and consult a healthcare professional.',
                icon: Remix.heart_line,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Color color,
    required List<String> items,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 6),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: color,
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Remix.arrow_right_s_line, color: color, size: 18),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.4,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
