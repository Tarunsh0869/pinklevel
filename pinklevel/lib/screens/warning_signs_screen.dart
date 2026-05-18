import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';
import '../l10n/app_localizations.dart';
import 'normal_vs_abnormal_screen.dart';

class WarningSignsScreen extends StatelessWidget {
  const WarningSignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final warningSigns = [
      _WarningSign(icon: Remix.search_eye_line,    title: l10n.warningSign1Title, description: l10n.warningSign1Desc),
      _WarningSign(icon: Remix.body_scan_line,      title: l10n.warningSign2Title, description: l10n.warningSign2Desc),
      _WarningSign(icon: Remix.focus_3_line,        title: l10n.warningSign3Title, description: l10n.warningSign3Desc),
      _WarningSign(icon: Remix.drop_line,           title: l10n.warningSign4Title, description: l10n.warningSign4Desc),
      _WarningSign(icon: Remix.first_aid_kit_line,  title: l10n.warningSign5Title, description: l10n.warningSign5Desc),
      _WarningSign(icon: Remix.alarm_warning_line,  title: l10n.warningSign6Title, description: l10n.warningSign6Desc),
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
        title: Text(l10n.warningSigns),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: PrimaryButton(
            text: l10n.warningSignsViewNormal,
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const NormalVsAbnormalScreen())),
            icon: Remix.git_branch_line,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.warningSignsTitle,
                  style: Theme.of(context).textTheme.displaySmall),
              const SizedBox(height: 12),
              Text(
                l10n.warningSignsSubtitle,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.textSecondary, height: 1.5),
              ),
              const SizedBox(height: 28),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: warningSigns.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final sign = warningSigns[index];
                  return WarningSignCard(
                    key: ValueKey(sign.title),
                    icon: sign.icon,
                    title: sign.title,
                    description: sign.description,
                  );
                },
              ),
              const SizedBox(height: 28),
              InfoBanner(
                message: l10n.warningSignsBanner,
                icon: Remix.information_line,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _WarningSign {
  final IconData icon;
  final String title;
  final String description;

  const _WarningSign({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class WarningSignCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const WarningSignCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 58,
            width: 58,
            decoration: BoxDecoration(
              color: const Color(0xFFFFEAF4),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: const Color(0xFFE91E63), size: 30),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Color(0xFF2D2D2D),
                        fontSize: 16,
                        fontWeight: FontWeight.w800)),
                const SizedBox(height: 6),
                Text(description,
                    style: const TextStyle(
                        color: Color(0xFF6A6A6A),
                        fontSize: 14,
                        height: 1.45,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
