import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';
import 'assessment_screen.dart';
import 'guide_screen.dart';
import 'warning_signs_screen.dart';
import 'myths_facts_screen.dart';
import 'doctor_visit_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final shouldExit = await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text('Exit App?', style: TextStyle(fontWeight: FontWeight.w800)),
            content: const Text('Are you sure you want to exit?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Exit', style: TextStyle(color: Color(0xFFE91E63), fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        );
        if (shouldExit == true && context.mounted) SystemNavigator.pop();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF8FB),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
          child: SafeArea(
            child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Merged gradient header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 28, 20, 28),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFE91E63), Color(0xFFFF5C93)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hi 👋',
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Ready for your quick self-check?',
                        style: TextStyle(fontSize: 15, color: Colors.white70, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 20),
                      // Start button inside header
                      GestureDetector(
                        onTap: () {
                          HapticFeedback.lightImpact();
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const GuideScreen()));
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFE4EF),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(Remix.play_circle_line, color: Color(0xFFE91E63), size: 26),
                              ),
                              const SizedBox(width: 14),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Start Self-Check Guide',
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Color(0xFF2B2B2B)),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      '5 steps • 2 mins • Private',
                                      style: TextStyle(fontSize: 12, color: Color(0xFF888888)),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(Remix.arrow_right_s_line, color: Color(0xFFE91E63)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
                  child: Text('Quick Actions', style: Theme.of(context).textTheme.headlineSmall),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.95,
                    children: [
                      _HapticIconCard(
                        icon: Remix.checkbox_circle_line,
                        title: 'How to Check',
                        subtitle: 'Self-assessment',
                        elevation: 4,
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AssessmentScreen())),
                      ),
                      _HapticIconCard(
                        icon: Remix.alert_line,
                        title: 'Warning Signs',
                        subtitle: 'What to look for',
                        iconColor: AppTheme.warningOrange,
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WarningSignsScreen())),
                      ),
                      _HapticIconCard(
                        icon: Remix.lightbulb_line,
                        title: 'Myths & Facts',
                        subtitle: 'Get the truth',
                        iconColor: AppTheme.successGreen,
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MythsFactsScreen())),
                      ),
                      _HapticIconCard(
                        icon: Remix.hospital_line,
                        title: 'Doctor Visit',
                        subtitle: 'When to see a doctor',
                        iconColor: AppTheme.darkPink,
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DoctorVisitScreen())),
                      ),
                    ],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 28, 20, 24),
                  child: InfoBanner(
                    message: 'Remember: Self-examination is not a substitute for professional medical checkups.',
                    icon: Remix.information_line,
                  ),
                ),
              ],
            ),
          ),
        ),
        ),
      ),
    );
  }
}

class _HapticIconCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color? iconColor;
  final double elevation;
  final VoidCallback onTap;

  const _HapticIconCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.iconColor,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return IconCard(
      icon: icon,
      title: title,
      subtitle: subtitle,
      iconColor: iconColor,
      elevation: elevation,
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
    );
  }
}
