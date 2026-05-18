import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../locale_provider.dart';
import '../theme/app_theme.dart';

/// Call this from anywhere to show the language picker bottom sheet.
void showLanguageSheet(BuildContext context) {
  HapticFeedback.lightImpact();
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => const _LanguageSheet(),
  );
}

class _LanguageSheet extends StatelessWidget {
  const _LanguageSheet();

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final selected = localeProvider.locale.languageCode;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.language, color: AppTheme.primaryPink, size: 22),
              const SizedBox(width: 10),
              const Text(
                'Language / भाषा',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const SizedBox(height: 20),
          LanguageCard(
            title: 'English',
            subtitle: 'Use app in English',
            languageCode: 'en',
            selectedLanguage: selected,
            onTap: () {
              localeProvider.setLocale(const Locale('en'));
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 12),
          LanguageCard(
            title: 'हिन्दी',
            subtitle: 'ऐप को हिन्दी में उपयोग करें',
            languageCode: 'hi',
            selectedLanguage: selected,
            onTap: () {
              localeProvider.setLocale(const Locale('hi'));
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    final selectedLanguage = localeProvider.locale.languageCode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Language / भाषा चुनें'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
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
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('is_language_selected', true);
                  if (context.mounted) {
                    Navigator.pushReplacementNamed(context, '/dashboard');
                  }
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