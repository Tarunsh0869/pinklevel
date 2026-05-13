import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key});

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  int _currentStep = 0;

  final List<_GuideStep> _steps = const [
    _GuideStep(
      icon: Remix.eye_line,
      title: 'Visual Inspection',
      description:
          'Stand in front of a mirror with your arms at your sides. Look for any changes in breast size, shape, or symmetry. Check for skin dimpling, puckering, or changes in the nipple.',
    ),
    _GuideStep(
      icon: Remix.hand_heart_line,
      title: 'Arms Raised',
      description:
          'Raise both arms above your head and look for the same changes. This position can reveal dimpling or changes not visible otherwise.',
    ),
    _GuideStep(
      icon: Remix.drop_line,
      title: 'Check for Discharge',
      description:
          'Gently squeeze each nipple and check for any discharge. Any unusual discharge, especially bloody or clear fluid, should be reported to your doctor.',
    ),
    _GuideStep(
      icon: Remix.hotel_bed_line,
      title: 'Lying Down Exam',
      description:
          'Lie down and place your right hand behind your head. Use your left hand to feel your right breast using small circular motions. Cover the entire breast from armpit to sternum.',
    ),
    _GuideStep(
      icon: Remix.hand_sanitizer_line,
      title: 'Standing Exam',
      description:
          'Repeat the circular motion exam while standing or sitting. Many women find it easiest to do this in the shower. Use the pads of your fingers, not the tips.',
    ),
  ];

  void _next() {
    if (_currentStep < _steps.length - 1) {
      HapticFeedback.lightImpact();
      setState(() => _currentStep++);
    } else {
      Navigator.pop(context);
    }
  }

  void _prev() {
    if (_currentStep > 0) {
      HapticFeedback.lightImpact();
      setState(() => _currentStep--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final step = _steps[_currentStep];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryPink,
        foregroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        title: const Text('Self-Exam Guide'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              StepIndicator(
                currentStep: _currentStep,
                totalSteps: _steps.length,
              ),
              const SizedBox(height: 8),
              Text(
                'Step ${_currentStep + 1} of ${_steps.length}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),
              Expanded(
                child: GestureDetector(
                  onHorizontalDragEnd: (details) {
                    if (details.primaryVelocity == null) return;
                    if (details.primaryVelocity! < -200) _next();
                    if (details.primaryVelocity! > 200) _prev();
                  },
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) => SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: FadeTransition(opacity: animation, child: child),
                    ),
                    child: CustomCard(
                      key: ValueKey(_currentStep),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFE91E63), Color(0xFFFF5C93)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.primaryPink.withValues(alpha: 0.25),
                                  blurRadius: 20,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Icon(step.icon, size: 50, color: Colors.white),
                          ),
                          const SizedBox(height: 32),
                          Text(
                            step.title,
                            style: Theme.of(context).textTheme.headlineMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            step.description,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: AppTheme.textSecondary,
                                  height: 1.6,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Remix.arrow_left_right_line,
                                  size: 14, color: AppTheme.textSecondary),
                              const SizedBox(width: 6),
                              Text(
                                'Swipe to navigate',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  if (_currentStep > 0)
                    Expanded(
                      child: SecondaryButton(
                        text: 'Previous',
                        onPressed: _prev,
                      ),
                    ),
                  if (_currentStep > 0) const SizedBox(width: 16),
                  Expanded(
                    child: PrimaryButton(
                      text: _currentStep == _steps.length - 1 ? 'Finish' : 'Next Step',
                      onPressed: _next,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _GuideStep {
  final IconData icon;
  final String title;
  final String description;

  const _GuideStep({
    required this.icon,
    required this.title,
    required this.description,
  });
}
