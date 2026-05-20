import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';
import '../l10n/app_localizations.dart';
import 'assessment_screen.dart' as assess;
import 'guide_screen.dart' as guide;
import 'warning_signs_screen.dart';
import 'myths_facts_screen.dart';
import 'doctor_visit_screen.dart';
import 'language_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final shouldExit = await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text(
              l10n.exitAppTitle,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
            content: Text(l10n.exitAppContent),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(l10n.exitAppCancel),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(
                  l10n.exitAppConfirm,
                  style: const TextStyle(
                    color: Color(0xFFE91E63),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        );
        if (shouldExit == true && context.mounted) SystemNavigator.pop();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF8FB),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.dashboardGreeting,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              Text(
                l10n.dashboardSubtitle,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color.fromARGB(179, 0, 0, 0),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.language, color: Color(0xFFE91E63)),
              tooltip: 'Language / भाषा',
              onPressed: () => showLanguageSheet(context),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final cardRatio = constraints.maxWidth < 360 ? 0.9 : 1.0;
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header / CTA card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                      color: Colors.white,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(20, 22, 20, 22),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(233, 30, 140, 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 48,
                              width: 48,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Remix.heart_2_line,
                                color: Color.fromRGBO(233, 30, 140, 1),
                                size: 26,
                              ),
                            ),
                            const SizedBox(height: 14),
                            Text(
                              l10n.dashboardCTATitle,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                height: 1.3,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              l10n.dashboardCTASubtitle,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 13,
                                height: 1.4,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 18),
                            _PlayButton(
                              label: l10n.dashboardCTAButton,
                              onTap: () {
                                HapticFeedback.lightImpact();
                                Navigator.of(context).push(MaterialPageRoute(
builder: (_) => const guide.GuideScreen()));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Text(l10n.dashboardQuickOptions,
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: cardRatio,
                        children: [
                          _HapticIconCard(
                            icon: Remix.checkbox_circle_line,
                            title: l10n.dashboardAssessmentTitle,
                            subtitle: l10n.dashboardAssessmentSubtitle,
                            onTap: () => Navigator.push(context,
                                MaterialPageRoute(
builder: (_) => const assess.AssessmentScreen())),
                          ),
                          _HapticIconCard(
                            icon: Remix.alert_line,
                            title: l10n.dashboardWarningTitle,
                            subtitle: l10n.dashboardWarningSubtitle,
                            iconColor: AppTheme.warningOrange,
                            onTap: () => Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const WarningSignsScreen())),
                          ),
                          _HapticIconCard(
                            icon: Remix.lightbulb_line,
                            title: l10n.dashboardMythsTitle,
                            subtitle: l10n.dashboardMythsSubtitle,
                            iconColor: AppTheme.successGreen,
                            onTap: () => Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (_) => const MythsFactsScreen())),
                          ),
                          _HapticIconCard(
                            icon: Remix.hospital_line,
                            title: l10n.dashboardDoctorTitle,
                            subtitle: l10n.dashboardDoctorSubtitle,
                            iconColor: AppTheme.darkPink,
                            onTap: () => Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const DoctorVisitScreen())),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: InfoBanner(
                        message: l10n.dashboardInfoBanner,
                        icon: Remix.information_line,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _PlayButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _PlayButton({required this.label, required this.onTap});

  @override
  State<_PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<_PlayButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulse;
  late Animation<double> _ring;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
    _ring = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _pulse, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Pulsing play circle
          SizedBox(
            width: 72,
            height: 72,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Pulse ring
                AnimatedBuilder(
                  animation: _ring,
                  builder: (context, child) => Transform.scale(
                    scale: _ring.value,
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white
                              .withValues(alpha: (1.5 - _ring.value)),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                // Play button circle
                Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: Color.fromRGBO(233, 30, 140, 1),
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
                    const SizedBox(width: 16),
          Expanded(
            child: Text(
              widget.label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HapticIconCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color? iconColor;
  final VoidCallback onTap;

  const _HapticIconCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconCard(
      icon: icon,
      title: title,
      subtitle: subtitle,
      iconColor: iconColor,
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
    );
  }
}
