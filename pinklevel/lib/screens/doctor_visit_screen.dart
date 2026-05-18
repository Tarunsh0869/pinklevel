import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';
import '../l10n/app_localizations.dart';
import 'disclaimer_screen.dart';

class DoctorVisitScreen extends StatelessWidget {
  const DoctorVisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final whenToVisit = [
      l10n.doctorWhen1, l10n.doctorWhen2, l10n.doctorWhen3, l10n.doctorWhen4,
      l10n.doctorWhen5, l10n.doctorWhen6, l10n.doctorWhen7, l10n.doctorWhen8,
    ];
    final whatToBring = [
      l10n.doctorBring1, l10n.doctorBring2, l10n.doctorBring3,
      l10n.doctorBring4, l10n.doctorBring5, l10n.doctorBring6,
    ];
    final questionsToAsk = [
      l10n.doctorAsk1, l10n.doctorAsk2, l10n.doctorAsk3,
      l10n.doctorAsk4, l10n.doctorAsk5, l10n.doctorAsk6,
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
        title: Text(l10n.doctorVisitPageTitle),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PrimaryButton(
                text: l10n.doctorVisitBookButton,
                onPressed: () => _showBookingDialog(context, l10n),
                icon: Remix.calendar_check_line,
              ),
              const SizedBox(height: 12),
              SecondaryButton(
                text: l10n.doctorVisitDisclaimerButton,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const DisclaimerScreen())),
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
              Text(l10n.doctorVisitHeading,
                  style: Theme.of(context).textTheme.displaySmall),
              const SizedBox(height: 12),
              Text(
                l10n.doctorVisitSubtitle,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.textSecondary, height: 1.5),
              ),
              const SizedBox(height: 28),
              _buildSection(
                context: context,
                title: l10n.doctorVisitWhenTitle,
                icon: Remix.calendar_event_line,
                iconColor: AppTheme.primaryPink,
                items: whenToVisit,
              ),
              const SizedBox(height: 24),
              _buildSection(
                context: context,
                title: l10n.doctorVisitWhatTitle,
                icon: Remix.briefcase_line,
                iconColor: AppTheme.successGreen,
                items: whatToBring,
              ),
              const SizedBox(height: 24),
              _buildSection(
                context: context,
                title: l10n.doctorVisitQuestionsTitle,
                icon: Remix.question_line,
                iconColor: AppTheme.warningOrange,
                items: questionsToAsk,
              ),
              const SizedBox(height: 28),
              InfoBanner(
                message: l10n.doctorVisitBanner,
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
              Expanded(
                child: Text(title,
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
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

  void _showBookingDialog(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(l10n.doctorDialogTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.doctorDialogSubtitle,
                style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            _dialogOption(Remix.phone_line, l10n.doctorDialogOption1),
            _dialogOption(Remix.global_line, l10n.doctorDialogOption2),
            _dialogOption(Remix.message_line, l10n.doctorDialogOption3),
            _dialogOption(Remix.map_pin_line, l10n.doctorDialogOption4),
            const SizedBox(height: 12),
            Text(l10n.doctorDialogNote,
                style: const TextStyle(
                    fontSize: 14, color: AppTheme.textSecondary)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.doctorDialogClose),
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
