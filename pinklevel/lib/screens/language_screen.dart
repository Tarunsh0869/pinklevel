import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../locale_provider.dart';
import '../l10n/app_localizations.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Language / भाषा चुनें'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Selector<LocaleProvider, String>(
              selector: (_, provider) => provider.locale.languageCode,
              builder: (context, selectedLanguage, _) {
                final localeProvider = context.read<LocaleProvider>();
                return Column(
                  children: [
                    LanguageCard(
                      title: 'English',
                      subtitle: 'Use app in English',
                      languageCode: 'en',
                      selectedLanguage: selectedLanguage,
                      onTap: () {
                        localeProvider.setLocale(const Locale('en'));
                      },
                    ),
                    const SizedBox(height: 16),
                    LanguageCard(
                      title: 'हिन्दी',
                      subtitle: 'ऐप को हिन्दी में उपयोग करें',
                      languageCode: 'hi',
                      selectedLanguage: selectedLanguage,
                      onTap: () {
                        localeProvider.setLocale(const Locale('hi'));
                      },
                    ),
                  ],
                );
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Continue / आगे बढ़ें'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String languageCode;
  final String selectedLanguage;
  final VoidCallback onTap;

  const LanguageCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.languageCode,
    required this.selectedLanguage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedLanguage == languageCode;

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFEEF5) : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? const Color(0xFFE91E63) : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor:
                  isSelected ? const Color(0xFFE91E63) : Colors.grey.shade200,
              child: Icon(
                Icons.language,
                color: isSelected ? Colors.white : Colors.black54,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Color(0xFFE91E63),
              ),
          ],
        ),
      ),
    );
  }
}