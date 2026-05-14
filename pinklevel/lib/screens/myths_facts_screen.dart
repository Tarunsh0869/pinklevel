import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';

class MythsFactsScreen extends StatelessWidget {
  const MythsFactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_MythFact> items = [
      _MythFact(
        myth: 'सिर्फ परिवार में इतिहास होने पर ही स्तन कैंसर होता है।',
        fact:
            'कई मामलों में स्तन कैंसर उन महिलाओं में भी हो सकता है जिनके परिवार में इसका कोई इतिहास नहीं होता। इसलिए सभी महिलाओं को जागरूक रहना चाहिए।',
      ),
      _MythFact(
        myth: 'स्तन में गांठ का मतलब हमेशा कैंसर होता है।',
        fact:
            'हर गांठ कैंसर नहीं होती। कई गांठें सामान्य या गैर-कैंसर वाली हो सकती हैं। फिर भी नई गांठ दिखे तो डॉक्टर से जांच जरूर करवानी चाहिए।',
      ),
      _MythFact(
        myth: 'स्तन कैंसर केवल अधिक उम्र की महिलाओं को होता है।',
        fact:
            'उम्र बढ़ने के साथ जोखिम बढ़ सकता है, लेकिन स्तन कैंसर किसी भी उम्र में हो सकता है। पुरुषों में भी स्तन कैंसर हो सकता है, हालांकि यह कम होता है।',
      ),
      _MythFact(
        myth: 'अंडरवायर ब्रा पहनने से स्तन कैंसर होता है।',
        fact:
            'ब्रा के प्रकार या पहनने की आदत और स्तन कैंसर के बीच कोई प्रमाणित वैज्ञानिक संबंध नहीं है।',
      ),
      _MythFact(
        myth: 'मैमोग्राम करवाने से कैंसर फैल जाता है।',
        fact:
            'मैमोग्राम कम मात्रा की रेडिएशन का उपयोग करता है और सामान्य रूप से सुरक्षित माना जाता है। शुरुआती पहचान के लाभ इसके जोखिम से अधिक होते हैं।',
      ),
      _MythFact(
        myth: 'पुरुषों को स्तन कैंसर नहीं हो सकता।',
        fact:
            'पुरुषों को भी स्तन कैंसर हो सकता है, हालांकि यह दुर्लभ होता है। इसलिए किसी भी असामान्य बदलाव को नजरअंदाज नहीं करना चाहिए।',
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
        title: const Text('मिथक और तथ्य'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'मिथक और तथ्य को समझें',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 12),
              Text(
                'गलत जानकारी नुकसानदायक हो सकती है। यहां कुछ जरूरी तथ्य दिए गए हैं जिन्हें जानना आवश्यक है।',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppTheme.textSecondary,
                      height: 1.5,
                    ),
              ),
              const SizedBox(height: 28),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return CustomCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppTheme.darkPink.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'मिथक',
                                style: TextStyle(
                                  color: AppTheme.darkPink,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.myth,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppTheme.textPrimary,
                                  ),
                        ),
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppTheme.successGreen.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'तथ्य',
                                style: TextStyle(
                                  color: AppTheme.successGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.fact,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppTheme.textSecondary,
                                    height: 1.5,
                                  ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _MythFact {
  final String myth;
  final String fact;

  const _MythFact({
    required this.myth,
    required this.fact,
  });
}
