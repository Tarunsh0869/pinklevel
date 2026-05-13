import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';
import 'disclaimer_screen.dart';

class DoctorVisitScreen extends StatelessWidget {
  const DoctorVisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> whenToVisit = [
      'You find a new lump or mass in your breast or underarm',
      'You notice changes in breast size, shape, or symmetry',
      'There is nipple discharge (especially bloody or clear)',
      'Your nipple has turned inward or changed position',
      'You see dimpling, puckering, or skin texture changes',
      'There is persistent redness, rash, or swelling',
      'You experience unexplained breast or nipple pain',
      'You notice any other unusual or persistent changes',
    ];

    final List<String> whatToBring = [
      'List of all current medications and supplements',
      'Your medical history and previous breast imaging results',
      'Family history of breast or ovarian cancer',
      'List of your symptoms with dates when they started',
      'Questions you want to ask your doctor',
      'Insurance information and identification',
    ];

    final List<String> questionsToAsk = [
      'What could be causing these changes?',
      'Do I need any tests or imaging (mammogram, ultrasound)?',
      'What are the next steps in diagnosis or treatment?',
      'How often should I have breast examinations?',
      'Are there risk factors I should be aware of?',
      'When should I schedule a follow-up appointment?',
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
        title: const Text('Doctor Visit Guide'),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PrimaryButton(
                text: 'Book Doctor Appointment',
                onPressed: () => _showBookingDialog(context),
                icon: Remix.calendar_check_line,
              ),
              const SizedBox(height: 12),
              SecondaryButton(
                text: 'View Safety Disclaimer',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const DisclaimerScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'When to See a Doctor',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 12),
              Text(
                'Don\'t wait if you notice any concerning changes. Early professional evaluation is crucial.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppTheme.textSecondary,
                      height: 1.5,
                    ),
              ),
              const SizedBox(height: 28),
              _buildSection(
                context: context,
                title: 'Schedule a Visit If:',
                icon: Remix.calendar_event_line,
                iconColor: AppTheme.primaryPink,
                items: whenToVisit,
              ),
              const SizedBox(height: 24),
              _buildSection(
                context: context,
                title: 'What to Bring:',
                icon: Remix.briefcase_line,
                iconColor: AppTheme.successGreen,
                items: whatToBring,
              ),
              const SizedBox(height: 24),
              _buildSection(
                context: context,
                title: 'Questions to Ask:',
                icon: Remix.question_line,
                iconColor: AppTheme.warningOrange,
                items: questionsToAsk,
              ),
              const SizedBox(height: 28),
              const InfoBanner(
                message:
                    'Regular checkups and professional screenings are essential, even if you feel fine. Early detection saves lives.',
                icon: Remix.heart_line,
              ),
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
    required Color iconColor,
    required List<String> items,
  }) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 28),
              const SizedBox(width: 12),
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
          const SizedBox(height: 20),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: iconColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check, color: iconColor, size: 16),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(item,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBookingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Contact Healthcare Provider'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'This feature would typically connect to:',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            _dialogOption(Remix.phone_line, 'Call your doctor'),
            _dialogOption(Remix.global_line, 'Online booking portal'),
            _dialogOption(Remix.message_line, 'Messaging system'),
            _dialogOption(Remix.map_pin_line, 'Find nearby clinics'),
            const SizedBox(height: 12),
            const Text(
              'For now, please contact your healthcare provider directly.',
              style: TextStyle(fontSize: 14, color: AppTheme.textSecondary),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _dialogOption(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppTheme.primaryPink),
          const SizedBox(width: 12),
          Text(text),
        ],
      ),
    );
  }
}
