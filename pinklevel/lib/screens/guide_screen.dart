import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';
import '../l10n/app_localizations.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key});

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  int _currentStep = 0;

  void _next(int totalSteps) {
    if (_currentStep < totalSteps - 1) {
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
    final l10n = AppLocalizations.of(context)!;

    final List<_GuideStep> localizedSteps = [
      _GuideStep(
        icon: Remix.eye_line,
        title: l10n.localeName == 'hi' ? 'दृश्य निरीक्षण' : 'Visual Inspection',
        imagePath: 'assets/images/visual_inspection.png',
        description: l10n.localeName == 'hi' ? 'आईने के सामने सीधे खड़े हों। अपने कंधे सीधे रखें और हाथों को कमर पर रखें।' : 'Stand in front of a mirror with your shoulders straight and your arms on your hips.',
        lookFor: l10n.localeName == 'hi' ? ['आकार, बनावट या रंग में बदलाव', 'त्वचा में गड्ढे, सिकुड़न या उभार', 'निप्पल की स्थिति में बदलाव या लालिमा'] : ['Changes in size, shape, or color', 'Dimpling, puckering, or bulging of the skin', 'A nipple that has changed position or redness'],
        clinicalAdvice: l10n.localeName == 'hi' ? 'स्वयं जांच करने का सही समय आमतौर पर पीरियड खत्म होने के कुछ दिन बाद होता है।' : 'The best time to perform a self-exam is usually a few days after your period ends.',
      ),
      _GuideStep(
        icon: Remix.hand_heart_line,
        title: l10n.localeName == 'hi' ? 'हाथ ऊपर उठाएं' : 'Raise Arms',
        imagePath: 'assets/images/arms_raised.png',
        description: l10n.localeName == 'hi' ? 'दोनों हाथों को सिर के ऊपर उठाएं और आईने में ध्यान से बदलाव देखें।' : 'Raise your arms and look for the same changes.',
        lookFor: l10n.localeName == 'hi' ? ['स्तन के आकार या समानता में बदलाव', 'त्वचा में खिंचाव, गड्ढे या सिकुड़न', 'निप्पल की दिशा या स्थिति में बदलाव'] : ['Changes in breast symmetry', 'Skin pulling or dimpling', 'Changes in nipple direction'],
        clinicalAdvice: l10n.localeName == 'hi' ? 'हाथ ऊपर उठाने पर कुछ बदलाव ज्यादा साफ दिखाई दे सकते हैं।' : 'Some changes may be more visible with arms raised.',
      ),
      _GuideStep(
        icon: Remix.drop_line,
        title: l10n.localeName == 'hi' ? 'निप्पल स्राव जांचें' : 'Check for Discharge',
        imagePath: 'assets/images/check_discharge.png',
        description: l10n.localeName == 'hi' ? 'प्रत्येक निप्पल को बहुत हल्के से दबाकर देखें कि कोई असामान्य स्राव तो नहीं हो रहा।' : 'Gently squeeze each nipple to check for discharge.',
        lookFor: l10n.localeName == 'hi' ? ['खून जैसा या साफ तरल स्राव', 'सिर्फ एक निप्पल से स्राव', 'असामान्य तरल निकलना'] : ['Bloody or clear fluid', 'Discharge from only one nipple', 'Spontaneous discharge'],
        clinicalAdvice: l10n.localeName == 'hi' ? 'अगर खून जैसा या साफ स्राव दिखे तो डॉक्टर से सलाह लें।' : 'Consult a doctor if you notice bloody or clear discharge.',
      ),
      _GuideStep(
        icon: Remix.hotel_bed_line,
        title: l10n.localeName == 'hi' ? 'लेटकर जांच' : 'Lying Down Exam',
        imagePath: 'assets/images/lying_down_exam.png',
        description: l10n.localeName == 'hi' ? 'लेट जाएं और एक हाथ सिर के पीछे रखें। उंगलियों के पोरों से जांच करें।' : 'Lie down and use your finger pads to feel for lumps in a circular motion.',
        lookFor: l10n.localeName == 'hi' ? ['कोई गांठ या कठोर भाग', 'मोटा या अलग महसूस होने वाला ऊतक', 'दर्द वाला हिस्सा'] : ['Any lumps or hard knots', 'Thickened tissue', 'Painful areas'],
        clinicalAdvice: l10n.localeName == 'hi' ? 'उंगलियों के पोरों का उपयोग करें, न कि सिरों का।' : 'Use the pads of your fingers, not the tips.',
      ),
      _GuideStep(
        icon: Remix.hand_sanitizer_line,
        title: l10n.localeName == 'hi' ? 'खड़े होकर जांच' : 'Standing Exam',
        imagePath: 'assets/images/standing_exam.png',
        description: l10n.localeName == 'hi' ? 'खड़े होकर या बैठकर उसी गोलाकार तरीके से जांच दोहराएं।' : 'Repeat the exam while standing or sitting.',
        lookFor: l10n.localeName == 'hi' ? ['नई गांठ या सूजन', 'दर्द या संवेदनशील हिस्सा', 'बगल के पास कोई बदलाव'] : ['New lumps or swelling', 'Painful spots', 'Changes near the armpit'],
        clinicalAdvice: l10n.localeName == 'hi' ? 'नहाते समय खड़े होकर जांच करना आसान हो सकता है।' : 'Many women find it easiest to do this in the shower.',
      ),
    ];

    final step = localizedSteps[_currentStep];
    final String finishText = l10n.localeName == 'hi' ? 'समाप्त करें' : 'Finish';
    final String nextStepText = l10n.localeName == 'hi' ? 'अगला चरण' : 'Next Step';
    final String prevText = l10n.localeName == 'hi' ? 'पिछला' : 'Previous';
    final String lookForHeader = l10n.localeName == 'hi' ? 'इन बदलावों को देखें:' : 'Look for these changes:';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        title: Text(l10n.guide),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  StepIndicator(
                    currentStep: _currentStep,
                    totalSteps: localizedSteps.length,
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 34),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                    '${_currentStep + 1}',
                                    style: const TextStyle(
                                      color: Color(0xFF8E4B6A),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
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
                          const SizedBox(height: 26),
                          Container(
                            height: 260,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9E8E4),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                step.imagePath,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  debugPrint('Image not found: ${step.imagePath}');
                                  debugPrint('Error: $error');

                                  return Center(
                                    child: Icon(
                                      step.icon,
                                      size: 64,
                                      color: const Color(0xFFE91E63),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 36),
                          Text(
                            step.description,
                            style: const TextStyle(
                              color: Color(0xFF6A6A6A),
                              fontSize: 16,
                              height: 1.45,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 26),
                          Text(
                            lookForHeader,
                            style: const TextStyle(
                              color: Color(0xFFC06B99),
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ...step.lookFor.map(
                            (item) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: InspectionPoint(text: item),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Center(
                    child: ClinicalAdviceCard(text: step.clinicalAdvice),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: Row(
                children: [
                  if (_currentStep > 0)
                    Expanded(
                      child: SecondaryButton(
                        text: prevText,
                        onPressed: _prev,
                      ),
                    ),
                  if (_currentStep > 0) const SizedBox(width: 16),
                  Expanded(
                    child: PrimaryButton(
                      text: _currentStep == localizedSteps.length - 1 ? finishText : nextStepText,
                      onPressed: () => _next(localizedSteps.length),
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

class InspectionPoint extends StatelessWidget {
  final String text;

  const InspectionPoint({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          height: 12,
          width: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFF6FAE9A),
              width: 1.6,
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.check,
              size: 8,
              color: Color(0xFF6FAE9A),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFF5B5B5B),
              fontSize: 15,
              height: 1.35,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
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

class ClinicalAdviceCard extends StatelessWidget {
  final String text;

  const ClinicalAdviceCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
    
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F8EF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF9BE7C8),
          width: 1.2,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Icon(
              Icons.lightbulb_outline,
              color: Color(0xFF2F7D68),
              size: 18,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: "Clinical Advice\n",
                    style: TextStyle(
                      color: Color(0xFF2F7D68),
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      height: 1.35,
                    ),
                  ),
                  TextSpan(
                    text: text,
                    style: const TextStyle(
                      color: Color(0xFF5AA28F),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 1.45,
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
