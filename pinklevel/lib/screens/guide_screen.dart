// ignore_for_file: unnecessary_underscores

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:remixicon/remixicon.dart';
import '../widgets/custom_widgets.dart';
import '../l10n/app_localizations.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key});

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  int _currentStep = 0;
  final PageController _pageController = PageController();
  final FlutterTts _tts = FlutterTts();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _tts.setCompletionHandler(() {
      if (mounted) setState(() => _isPlaying = false);
    });
    _tts.setCancelHandler(() {
      if (mounted) setState(() => _isPlaying = false);
    });
    _tts.setErrorHandler((msg) {
      debugPrint('[TTS] Error: $msg');
      if (mounted) setState(() => _isPlaying = false);
    });
  }

  @override
  void dispose() {
    _tts.stop();
    _pageController.dispose();
    super.dispose();
  }

  void _next(int totalSteps) {
    if (_currentStep < totalSteps - 1) {
      HapticFeedback.lightImpact();
      _stopAudio();
      _pageController.animateToPage(
        _currentStep + 1,
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOut,
      );
    } else {
      _stopAudio();
      Navigator.pop(context);
    }
  }

  void _prev() {
    if (_currentStep > 0) {
      HapticFeedback.lightImpact();
      _stopAudio();
      _pageController.animateToPage(
        _currentStep - 1,
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOut,
      );
    }
  }

  void _onStepChanged(int step) {
    if (_currentStep == step) return;
    _tts.stop();
    setState(() {
      _isPlaying = false;
      _currentStep = step;
    });
  }

  void _stopAudio() {
    _tts.stop();
    if (mounted) setState(() => _isPlaying = false);
  }

  Future<void> _toggleAudio(_GuideStep step) async {
    if (_isPlaying) {
      await _tts.stop();
      setState(() => _isPlaying = false);
      return;
    }

    final locale = Localizations.localeOf(context);
    final isHindi = locale.languageCode == 'hi';
    final langCode = isHindi ? 'hi' : 'en';

    try {
      await _tts.setLanguage(langCode);
      await _tts.setSpeechRate(0.5);
      await _tts.setVolume(1.0);
      await _tts.setPitch(1.0);

      final transcript = _buildTranscript(step, isHindi);
      debugPrint('[TTS] Speaking (lang=$langCode)');

      setState(() => _isPlaying = true);
      final result = await _tts.speak(transcript);
      debugPrint('[TTS] speak() result: $result');

      if (result != 1 && mounted) {
        setState(() => _isPlaying = false);
      }
    } catch (e) {
      debugPrint('[TTS] Exception: $e');
      if (mounted) setState(() => _isPlaying = false);
    }
  }

  String _buildTranscript(_GuideStep step, bool isHindi) {
    final lookForLabel =
        isHindi ? 'इन बदलावों को देखें' : 'Look for these changes';
    final adviceLabel = isHindi ? 'क्लिनिकल सलाह' : 'Clinical Advice';
    final lookForItems =
        step.lookFor.join(isHindi ? '। ' : '. ');
    return '${step.title}. ${step.description} '
        '$lookForLabel: $lookForItems. '
        '$adviceLabel: ${step.clinicalAdvice}';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final List<_GuideStep> steps = [
      _GuideStep(
        icon: Remix.eye_line,
        title: l10n.guideStep1Title,
        imagePath: 'assets/images/visual_inspection.png',
        description: l10n.guideStep1Desc,
        lookFor: [
          l10n.guideStep1Look1,
          l10n.guideStep1Look2,
          l10n.guideStep1Look3,
        ],
        clinicalAdvice: l10n.guideStep1Advice,
      ),
      _GuideStep(
        icon: Remix.hand_heart_line,
        title: l10n.guideStep2Title,
        imagePath: 'assets/images/arms_raised.png',
        description: l10n.guideStep2Desc,
        lookFor: [
          l10n.guideStep2Look1,
          l10n.guideStep2Look2,
          l10n.guideStep2Look3,
        ],
        clinicalAdvice: l10n.guideStep2Advice,
      ),
      _GuideStep(
        icon: Remix.drop_line,
        title: l10n.guideStep3Title,
        imagePath: 'assets/images/check_discharge.png',
        description: l10n.guideStep3Desc,
        lookFor: [
          l10n.guideStep3Look1,
          l10n.guideStep3Look2,
          l10n.guideStep3Look3,
        ],
        clinicalAdvice: l10n.guideStep3Advice,
      ),
      _GuideStep(
        icon: Remix.hotel_bed_line,
        title: l10n.guideStep4Title,
        imagePath: 'assets/images/lying_down_exam.png',
        description: l10n.guideStep4Desc,
        lookFor: [
          l10n.guideStep4Look1,
          l10n.guideStep4Look2,
          l10n.guideStep4Look3,
        ],
        clinicalAdvice: l10n.guideStep4Advice,
      ),
      _GuideStep(
        icon: Remix.hand_sanitizer_line,
        title: l10n.guideStep5Title,
        imagePath: 'assets/images/standing_exam.png',
        description: l10n.guideStep5Desc,
        lookFor: [
          l10n.guideStep5Look1,
          l10n.guideStep5Look2,
          l10n.guideStep5Look3,
        ],
        clinicalAdvice: l10n.guideStep5Advice,
      ),
    ];

    final step = steps[_currentStep];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        title: Text(l10n.guide),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _ListenButton(
              isPlaying: _isPlaying,
              onTap: () => _toggleAudio(step),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // ── Scrollable content ──────────────────────────────────────
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onStepChanged,
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  final step = steps[index];
                  return ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                  StepIndicator(
                    currentStep: index,
                    totalSteps: steps.length,
                  ),
                  const SizedBox(height: 24),

                  // ── Step card ─────────────────────────────────────────
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Step number + title
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF49BC8),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    color: Color(0xFF8E4B6A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                step.title,
                                style: const TextStyle(
                                  color: Color(0xFF2D2D2D),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 240,
                            width: double.infinity,
                            color: const Color(0xFFF9E8E4),
                            child: Image.asset(
                              step.imagePath,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Center(
                                child: Icon(step.icon,
                                    size: 64,
                                    color: const Color(0xFFE91E63)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // ── Listen / transcript banner ─────────────────
                        _TranscriptBanner(
                          isPlaying: _isPlaying && index == _currentStep,
                          onTap: () => _toggleAudio(step),
                        ),
                        const SizedBox(height: 18),

                        // Description
                        Text(
                          step.description,
                          style: const TextStyle(
                            color: Color(0xFF6A6A6A),
                            fontSize: 15,
                            height: 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Look for label
                        Text(
                          l10n.guideLookFor,
                          style: const TextStyle(
                            color: Color(0xFFC06B99),
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Look for items
                        ...step.lookFor.map(
                          (item) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: _InspectionPoint(text: item),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ── Clinical advice card ──────────────────────────────
                  _ClinicalAdviceCard(
                    label: l10n.guideClinicalAdvice,
                    text: step.clinicalAdvice,
                  ),
                  const SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ),

            // ── Bottom navigation buttons ───────────────────────────────
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              color: Colors.white,
              child: Row(
                children: [
                  if (_currentStep > 0) ...[
                    Expanded(
                      child: SecondaryButton(
                        text: l10n.guidePrevious,
                        onPressed: _prev,
                      ),
                    ),
                    const SizedBox(width: 14),
                  ],
                  Expanded(
                    child: PrimaryButton(
                      text: _currentStep == steps.length - 1
                          ? l10n.guideFinish
                          : l10n.guideNextStep,
                      onPressed: () => _next(steps.length),
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
}

// ── Listen button in AppBar ───────────────────────────────────────────────────

class _ListenButton extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onTap;

  const _ListenButton({required this.isPlaying, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: isPlaying ? const Color(0xFFE91E63) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFE91E63), width: 1.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isPlaying ? Remix.stop_circle_line : Remix.volume_up_line,
              size: 15,
              color: isPlaying ? Colors.white : const Color(0xFFE91E63),
            ),
            const SizedBox(width: 5),
            Text(
              isPlaying ? 'Stop' : 'Listen',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: isPlaying ? Colors.white : const Color(0xFFE91E63),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// ── Inline transcript banner ──────────────────────────────────────────────────

class _TranscriptBanner extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onTap;

  const _TranscriptBanner({required this.isPlaying, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isPlaying
              ? const Color(0xFFFFE4EF)
              : const Color(0xFFFFF0F5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isPlaying
                ? const Color(0xFFE91E63)
                : const Color(0xFFF49BC8),
            width: 1.2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isPlaying ? Remix.stop_circle_line : Remix.volume_up_line,
              color: const Color(0xFFE91E63),
              size: 18,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                isPlaying
                    ? 'Playing audio transcript...'
                    : 'Tap to listen to this step',
                style: const TextStyle(
                  color: Color(0xFFE91E63),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            if (isPlaying) const _PulsingDot(),
          ],
        ),
      ),
    );
  }
}

// ── Pulsing dot shown while audio plays ──────────────────────────────────────

class _PulsingDot extends StatefulWidget {
  const _PulsingDot();

  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat(reverse: true);
    _anim = Tween<double>(begin: 0.3, end: 1.0).animate(_ctrl);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _anim,
      child: Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: Color(0xFFE91E63),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

// ── Inspection point row ──────────────────────────────────────────────────────

class _InspectionPoint extends StatelessWidget {
  final String text;

  const _InspectionPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4),
          height: 18,
          width: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF6FAE9A), width: 1.6),
          ),
          child: const Center(
            child: Icon(Icons.check, size: 10, color: Color(0xFF6FAE9A)),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFF3A3A3A),
              fontSize: 15,
              height: 1.4,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

// ── Clinical advice card ──────────────────────────────────────────────────────

class _ClinicalAdviceCard extends StatelessWidget {
  final String label;
  final String text;

  const _ClinicalAdviceCard({required this.label, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F8EF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF9BE7C8), width: 1.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Icon(Icons.lightbulb_outline,
                color: Color(0xFF2F7D68), size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$label\n',
                    style: const TextStyle(
                      color: Color(0xFF2F7D68),
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      height: 1.4,
                    ),
                  ),
                  TextSpan(
                    text: text,
                    style: const TextStyle(
                      color: Color(0xFF5AA28F),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
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

// ── Data model ────────────────────────────────────────────────────────────────

class _GuideStep {
  final IconData icon;
  final String title;
  final String description;
  final String imagePath;
  final List<String> lookFor;
  final String clinicalAdvice;

  const _GuideStep({
    required this.icon,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.lookFor,
    required this.clinicalAdvice,
  });
}

// ── Public widgets (used by other screens if needed) ─────────────────────────

class InspectionPoint extends StatelessWidget {
  final String text;
  const InspectionPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) => _InspectionPoint(text: text);
}

class ClinicalAdviceCard extends StatelessWidget {
  final String label;
  final String text;
  const ClinicalAdviceCard(
      {super.key, required this.label, required this.text});

  @override
  Widget build(BuildContext context) =>
      _ClinicalAdviceCard(label: label, text: text);
}
