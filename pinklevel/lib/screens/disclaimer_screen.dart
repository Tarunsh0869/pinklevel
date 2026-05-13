import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';

class DisclaimerScreen extends StatelessWidget {
  const DisclaimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryPink,
        foregroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        title: const Text('Safety Disclaimer'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Important Disclaimer',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 20),
              const InfoBanner(
                message:
                    'This app is for educational purposes only and is not a substitute for professional medical advice, diagnosis, or treatment.',
                icon: Remix.error_warning_line,
              ),
              const SizedBox(height: 24),
              CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Please Note:',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    ...[ 
                      'Always consult a qualified healthcare professional for medical advice.',
                      'Self-examination does not replace regular clinical breast exams or mammograms.',
                      'If you notice any changes, seek medical attention promptly.',
                      'Early detection through professional screening saves lives.',
                      'This app does not provide diagnosis or treatment recommendations.',
                    ].map(
                      (text) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Remix.information_line,
                                size: 18, color: AppTheme.primaryPink),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                text,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                text: 'I Understand',
                icon: Remix.checkbox_circle_line,
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
