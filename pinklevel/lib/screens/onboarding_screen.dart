import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';
import '../l10n/app_localizations.dart';
import 'dashboard_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;
  int _currentPage = 0;

  static const _pageCount = 3;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fadeAnim =
        CurvedAnimation(parent: _animController, curve: Curves.easeIn);
    _slideAnim =
        Tween<Offset>(begin: const Offset(0.1, 0), end: Offset.zero).animate(
            CurvedAnimation(parent: _animController, curve: Curves.easeOut));
    _animController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animController.dispose();
    super.dispose();
  }

  void _goToDashboard() {
    HapticFeedback.lightImpact();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const DashboardScreen()),
    );
  }

  void _next() {
    HapticFeedback.lightImpact();
    if (_currentPage < _pageCount - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _goToDashboard();
    }
  }

  void _onPageChanged(int i) {
    setState(() => _currentPage = i);
    _animController.reset();
    _animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final pages = [
      _OnboardingPage(
        icon: Remix.heart_pulse_line,
        title: l10n.onboarding1Title,
        description: l10n.onboarding1Desc,
      ),
      _OnboardingPage(
        icon: Remix.search_eye_line,
        title: l10n.onboarding2Title,
        description: l10n.onboarding2Desc,
      ),
      _OnboardingPage(
        icon: Remix.shield_check_line,
        title: l10n.onboarding3Title,
        description: l10n.onboarding3Desc,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: _goToDashboard,
                child: Text(
                  l10n.onboardingSkip,
                  style: TextStyle(
                    color: AppTheme.primaryPink,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  final page = pages[index];
                  final screenHeight = MediaQuery.of(context).size.height;
                  final iconSize = screenHeight < 600 ? 90.0 : 130.0;
                  final iconInnerSize = screenHeight < 600 ? 40.0 : 60.0;
                  final verticalSpacing = screenHeight < 600 ? 16.0 : 40.0;
                  final horizontalPadding = 32.0;

                  return FadeTransition(
                    opacity: _fadeAnim,
                    child: SlideTransition(
                      position: _slideAnim,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: 16,
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: MediaQuery.of(context).size.height * 0.5,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: iconSize,
                                height: iconSize,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFE91E63),
                                      Color(0xFFFF5C93)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppTheme.primaryPink
                                          .withOpacity(0.3),
                                      blurRadius: 24,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Icon(page.icon,
                                    size: iconInnerSize, color: Colors.white),
                              ),
                              SizedBox(height: verticalSpacing),
                              Text(
                                page.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                      fontSize: screenHeight < 600 ? 22 : null,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                page.description,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: AppTheme.textSecondary,
                                      height: 1.6,
                                      fontSize: screenHeight < 600 ? 14 : null,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                24,
                0,
                24,
                MediaQuery.of(context).size.height < 600 ? 16 : 32,
              ),
              child: Column(
                children: [
                  StepIndicator(
                      currentStep: _currentPage, totalSteps: pages.length),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    text: _currentPage == pages.length - 1
                        ? l10n.onboardingGetStarted
                        : l10n.onboardingNext,
                    onPressed: _next,
                    icon: _currentPage == pages.length - 1
                        ? Remix.rocket_line
                        : Remix.arrow_right_line,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPage {
  final IconData icon;
  final String title;
  final String description;

  const _OnboardingPage({
    required this.icon,
    required this.title,
    required this.description,
  });
}
