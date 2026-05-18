import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';
import '../l10n/app_localizations.dart';

class NormalVsAbnormalScreen extends StatelessWidget {
  const NormalVsAbnormalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final normalItems = [
      l10n.normalItem1,
      l10n.normalItem2,
      l10n.normalItem3,
      l10n.normalItem4,
      l10n.normalItem5,
    ];

    final abnormalItems = [
      l10n.abnormalItem1,
      l10n.abnormalItem2,
      l10n.abnormalItem3,
      l10n.abnormalItem4,
      l10n.abnormalItem5,
      l10n.abnormalItem6,
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryPink,
        foregroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        title: Text(l10n.normalVsAbnormalPageTitle),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.normalVsAbnormalHeading,
                  style: Theme.of(context).textTheme.displaySmall),
              const SizedBox(height: 12),
              Text(
                l10n.normalVsAbnormalSubtitle,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.textSecondary, height: 1.5),
              ),
              const SizedBox(height: 28),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildSection(
                      context: context,
                      title: l10n.normalColumnTitle,
                      icon: Remix.checkbox_circle_line,
                      color: AppTheme.successGreen,
                      items: normalItems,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildSection(
                      context: context,
                      title: l10n.abnormalColumnTitle,
                      icon: Remix.stethoscope_line,
                      color: AppTheme.darkPink,
                      items: abnormalItems,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              InfoBanner(
                message: l10n.normalVsAbnormalBanner,
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
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: color,
                        fontWeight: FontWeight.w800,
                      ),
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
                    child: Text(item,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(height: 1.4)),
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
