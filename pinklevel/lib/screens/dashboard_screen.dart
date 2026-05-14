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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text(
              'ऐप बंद करें?',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            content: const Text('क्या आप सच में ऐप बंद करना चाहते हैं?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('रद्द करें'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text(
                  'बंद करें',
                  style: TextStyle(
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
                      colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 255, 255, 255)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'नमस्ते 👋',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'आज आप कैसा महसूस कर रहे हैं?',
                        style: TextStyle(fontSize: 20, color: Color.fromARGB(179, 0, 0, 0), fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 20),
                      // Start button inside header
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical:12),
                        padding: const EdgeInsets.fromLTRB(24, 34, 24, 34),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(233, 30, 140, 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 56,
                              width: 56,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Remix.heart_2_line,
                                color: Color.fromRGBO(233, 30, 140, 1),
                                size: 30,
                              ),
                            ),
                            const SizedBox(height: 18),
                            const Text(
                              'क्या आप स्वयं जांच के लिए\nतैयार हैं?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                height: 1.35,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 14),
                            const Text(
                              'यह एक आसान चरण-दर-चरण गाइड है\nजिसमें लगभग 5 मिनट लगते हैं। घबराने की जरूरत नहीं।',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.45,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 22),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  HapticFeedback.lightImpact();
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const GuideScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color.fromRGBO(233, 30, 140, 1),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'स्वयं जांच शुरू करें',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
                  child: Text('त्वरित विकल्प', style: Theme.of(context).textTheme.headlineSmall),
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
                        title: 'स्वयं मूल्यांकन',
                        subtitle: 'लक्षणों की जांच करें',
                        elevation: 4,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AssessmentScreen(),
                          ),
                        ),
                      ),
                      _HapticIconCard(
                        icon: Remix.alert_line,
                        title: 'चेतावनी संकेत',
                        subtitle: 'किन बातों पर ध्यान दें',
                        iconColor: AppTheme.warningOrange,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const WarningSignsScreen(),
                          ),
                        ),
                      ),
                      _HapticIconCard(
                        icon: Remix.lightbulb_line,
                        title: 'मिथक और तथ्य',
                        subtitle: 'सही जानकारी पाएं',
                        iconColor: AppTheme.successGreen,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const MythsFactsScreen(),
                          ),
                        ),
                      ),
                      _HapticIconCard(
                        icon: Remix.hospital_line,
                        title: 'डॉक्टर विजिट',
                        subtitle: 'डॉक्टर से कब मिलें',
                        iconColor: AppTheme.darkPink,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DoctorVisitScreen(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 28, 20, 24),
                  child: InfoBanner(
                    message: 'याद रखें: स्वयं जांच, डॉक्टर द्वारा की जाने वाली मेडिकल जांच का विकल्प नहीं है।',
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
