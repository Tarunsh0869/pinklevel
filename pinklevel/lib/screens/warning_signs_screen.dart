import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';
import 'normal_vs_abnormal_screen.dart';

class WarningSignsScreen extends StatelessWidget {
  const WarningSignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_WarningSign> warningSigns = [
      _WarningSign(
        icon: Remix.search_eye_line,
        title: 'नई गांठ',
        description:
            'स्तन या बगल के हिस्से में नई गांठ या कठोर भाग महसूस होना, जो आसपास के हिस्से से अलग लगे।',
      ),
      _WarningSign(
        icon: Remix.body_scan_line,
        title: 'त्वचा में गड्ढे',
        description:
            'त्वचा में गड्ढे पड़ना, सिकुड़न आना या त्वचा का संतरे के छिलके जैसी दिखना।',
      ),
      _WarningSign(
        icon: Remix.focus_3_line,
        title: 'निप्पल में बदलाव',
        description:
            'निप्पल का अंदर की ओर मुड़ना, स्थिति बदलना या पहले से अलग दिखाई देना।',
      ),
      _WarningSign(
        icon: Remix.drop_line,
        title: 'निप्पल से स्राव',
        description:
            'निप्पल से असामान्य तरल निकलना, खासकर खून जैसा या साफ पानी जैसा स्राव।',
      ),
      _WarningSign(
        icon: Remix.first_aid_kit_line,
        title: 'सूजन',
        description:
            'पूरे स्तन या स्तन के किसी हिस्से में सूजन होना, भले ही कोई साफ गांठ महसूस न हो।',
      ),
      _WarningSign(
        icon: Remix.alarm_warning_line,
        title: 'लालिमा या घाव',
        description:
            'निप्पल या स्तन की त्वचा पर लालिमा, पपड़ी, मोटापन या घाव जैसा बदलाव दिखना।',
      ),
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
        title: const Text('चेतावनी संकेत'),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: PrimaryButton(
            text: 'सामान्य और असामान्य देखें',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const NormalVsAbnormalScreen(),
                ),
              );
            },
            icon: Remix.git_branch_line,
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
                'किन बातों पर ध्यान दें',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 12),
              Text(
                'इन संभावित चेतावनी संकेतों पर ध्यान दें। अगर आपको इनमें से कोई भी बदलाव दिखे, तो तुरंत डॉक्टर से सलाह लें।',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppTheme.textSecondary,
                      height: 1.5,
                    ),
              ),
              const SizedBox(height: 28),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: warningSigns.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final sign = warningSigns[index];
                  return WarningSignCard(
                    key: ValueKey(sign.title),
                    icon: sign.icon,
                    title: sign.title,
                    description: sign.description,
                  );
                },
              ),
              const SizedBox(height: 28),
              const InfoBanner(
                message:
                    'याद रखें: स्तन में होने वाले कई बदलाव कैंसर नहीं होते। फिर भी, किसी भी चिंता या बदलाव की जांच स्वास्थ्य विशेषज्ञ से करवाना जरूरी है।',
                icon: Remix.information_line,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _WarningSign {
  final IconData icon;
  final String title;
  final String description;

  const _WarningSign({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class WarningSignCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const WarningSignCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 58,
            width: 58,
            decoration: BoxDecoration(
              color: const Color(0xFFFFEAF4),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: const Color(0xFFE91E63),
              size: 30,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF2D2D2D),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF6A6A6A),
                    fontSize: 14,
                    height: 1.45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
