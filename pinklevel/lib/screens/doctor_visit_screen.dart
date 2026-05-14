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
      'स्तन या बगल में नई गांठ या कठोर भाग महसूस हो',
      'स्तन के आकार, बनावट या समानता में बदलाव दिखे',
      'निप्पल से स्राव हो, खासकर खून जैसा या साफ तरल',
      'निप्पल अंदर की ओर मुड़ जाए या उसकी स्थिति बदल जाए',
      'त्वचा में गड्ढे, सिकुड़न या बनावट में बदलाव दिखे',
      'लगातार लालिमा, दाने या सूजन बनी रहे',
      'स्तन या निप्पल में बिना कारण लगातार दर्द हो',
      'कोई भी अन्य असामान्य या लंबे समय तक रहने वाला बदलाव दिखे',
    ];

    final List<String> whatToBring = [
      'वर्तमान दवाओं और सप्लीमेंट्स की सूची',
      'अपना मेडिकल इतिहास और पहले की जांच रिपोर्ट',
      'परिवार में स्तन या ओवरी कैंसर का इतिहास',
      'लक्षणों की सूची और वे कब शुरू हुए',
      'डॉक्टर से पूछने वाले सवालों की सूची',
      'पहचान पत्र और जरूरी स्वास्थ्य दस्तावेज',
    ];

    final List<String> questionsToAsk = [
      'इन बदलावों का कारण क्या हो सकता है?',
      'क्या मुझे कोई जांच या इमेजिंग टेस्ट करवाने की जरूरत है?',
      'जांच या इलाज के अगले कदम क्या होंगे?',
      'मुझे कितनी बार स्तन की जांच करवानी चाहिए?',
      'क्या मेरे लिए कोई जोखिम कारक हैं?',
      'मुझे अगली मुलाकात कब तय करनी चाहिए?',
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
        title: const Text('डॉक्टर विजिट गाइड'),
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
                'अगर आपको कोई चिंताजनक बदलाव दिखे तो इंतजार न करें। समय पर डॉक्टर से जांच करवाना बहुत जरूरी है।',
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
      builder: (context) =>
          AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text('स्वास्थ्य विशेषज्ञ से संपर्क करें'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'यह सुविधा आमतौर पर इनसे जुड़ सकती है:',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                _dialogOption(Remix.phone_line, 'अपने डॉक्टर को कॉल करें'),
                _dialogOption(Remix.global_line, 'ऑनलाइन बुकिंग पोर्टल'),
                _dialogOption(Remix.message_line, 'मैसेजिंग सिस्टम'),
                _dialogOption(Remix.map_pin_line, 'नजदीकी क्लिनिक खोजें'),
                const SizedBox(height: 12),
                const Text(
                  'अभी के लिए कृपया अपने स्वास्थ्य विशेषज्ञ या डॉक्टर से सीधे संपर्क करें।',
                  style: TextStyle(fontSize: 14, color: AppTheme.textSecondary),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('बंद करें'),
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
