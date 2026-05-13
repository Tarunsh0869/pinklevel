import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  static const _questions = [
    'Do you notice any new lump or thickening in your breast or underarm?',
    'Have you noticed any change in the size or shape of your breast?',
    'Is there any skin dimpling, puckering, or redness on your breast?',
    'Do you have any nipple discharge (other than breast milk)?',
    'Have you noticed any nipple inversion or change in nipple direction?',
    'Do you feel any persistent pain in your breast or nipple area?',
  ];

  final Map<int, bool?> _answers = {};
  bool _submitted = false;

  void _reset() => setState(() {
        _answers.clear();
        _submitted = false;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE91E63),
        foregroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        title: const Text('Self-Assessment', style: TextStyle(fontWeight: FontWeight.w800)),
        elevation: 0,
      ),
      body: _submitted ? _buildResult() : _buildQuestions(),
    );
  }

  Widget _buildQuestions() {
    final answered = _answers.length;
    final total = _questions.length;
    final progress = answered / total;

    return Column(
      children: [
        // Progress bar
        Container(
          color: const Color(0xFFE91E63),
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$answered of $total answered',
                      style: const TextStyle(color: Colors.white70, fontSize: 13)),
                  Text('${(progress * 100).toInt()}%',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13)),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                  backgroundColor: Colors.white30,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: _questions.length,
            separatorBuilder: (context, index) => const SizedBox(height: 14),
            itemBuilder: (_, i) => _QuestionCard(
              index: i,
              question: _questions[i],
              answer: _answers[i],
              onChanged: (val) {
                HapticFeedback.lightImpact();
                setState(() => _answers[i] = val);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
          child: ElevatedButton(
            onPressed: answered == total
                ? () {
                    HapticFeedback.mediumImpact();
                    setState(() => _submitted = true);
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE91E63),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            child: const Text('Submit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
          ),
        ),
      ],
    );
  }

  Widget _buildResult() {
    final hasYes = _answers.values.any((v) => v == true);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 56,
            backgroundColor: hasYes ? const Color(0xFFFFE4EF) : const Color(0xFFE7F7EC),
            child: Icon(
              hasYes ? Remix.stethoscope_line : Remix.checkbox_circle_line,
              size: 52,
              color: hasYes ? const Color(0xFFE91E63) : const Color(0xFF2EAD5B),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            hasYes ? 'Please Consult a Doctor' : 'No Concerns Noted',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF2B2B2B)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            hasYes
                ? 'You answered "Yes" to one or more questions. This does not mean you have cancer, but it is important to see a healthcare professional for a proper evaluation.'
                : 'You answered "No" to all questions. Continue doing monthly self-checks and see a doctor for routine screenings.',
            style: const TextStyle(fontSize: 14, height: 1.5, color: Color(0xFF555555)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE91E63),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            child: const Text('Back to Home', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: _reset,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFFE91E63),
              side: const BorderSide(color: Color(0xFFE91E63), width: 2),
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            child: const Text('Retake Assessment', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  final int index;
  final String question;
  final bool? answer;
  final ValueChanged<bool?> onChanged;

  const _QuestionCard({
    required this.index,
    required this.question,
    required this.answer,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isAnswered = answer != null;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isAnswered ? const Color(0xFFE91E63) : Colors.transparent,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
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
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isAnswered ? const Color(0xFFE91E63) : const Color(0xFFF5F5F5),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: isAnswered
                      ? const Icon(Icons.check, color: Colors.white, size: 14)
                      : Text('${index + 1}', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Color(0xFF888888))),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  question,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF2B2B2B), height: 1.4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _ChoiceChip(label: 'Yes', selected: answer == true, selectedColor: const Color(0xFFE91E63), onTap: () => onChanged(true)),
              const SizedBox(width: 10),
              _ChoiceChip(label: 'No', selected: answer == false, selectedColor: const Color(0xFF2EAD5B), onTap: () => onChanged(false)),
            ],
          ),
        ],
      ),
    );
  }
}

class _ChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final Color selectedColor;
  final VoidCallback onTap;

  const _ChoiceChip({
    required this.label,
    required this.selected,
    required this.selectedColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? selectedColor : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : const Color(0xFF888888),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
