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
        title: const Text('सुरक्षा अस्वीकरण'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'महत्वपूर्ण अस्वीकरण',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 20),
              const InfoBanner(
                message:
                    'यह ऐप केवल शैक्षिक उद्देश्य के लिए है। यह डॉक्टर की सलाह, जांच, निदान या उपचार का विकल्प नहीं है।',
                icon: Remix.error_warning_line,
              ),
              const SizedBox(height: 24),
              CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'कृपया ध्यान दें:',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    ...[ 
                      'किसी भी मेडिकल सलाह के लिए हमेशा योग्य स्वास्थ्य विशेषज्ञ या डॉक्टर से संपर्क करें।',
                      'स्वयं जांच, नियमित क्लिनिकल ब्रेस्ट एग्जाम या मैमोग्राम का विकल्प नहीं है।',
                      'अगर आपको कोई बदलाव दिखाई दे, तो जल्द से जल्द डॉक्टर से जांच करवाएं।',
                      'समय पर जांच और शुरुआती पहचान जीवन बचाने में मदद कर सकती है।',
                      'यह ऐप किसी भी प्रकार का निदान या उपचार की सलाह नहीं देता।',
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
                text: 'मैं समझ गया/गई',
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
