import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_widgets.dart';
import '../l10n/app_localizations.dart';

class MythsFactsScreen extends StatelessWidget {
  const MythsFactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final items = [
      _MythFact(myth: l10n.myth1, fact: l10n.fact1),
      _MythFact(myth: l10n.myth2, fact: l10n.fact2),
      _MythFact(myth: l10n.myth3, fact: l10n.fact3),
      _MythFact(myth: l10n.myth4, fact: l10n.fact4),
      _MythFact(myth: l10n.myth5, fact: l10n.fact5),
      _MythFact(myth: l10n.myth6, fact: l10n.fact6),
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
        title: Text(l10n.mythsFacts),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.mythsFactsHeading,
                  style: Theme.of(context).textTheme.displaySmall),
              const SizedBox(height: 12),
              Text(
                l10n.mythsFactsSubtitle,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.textSecondary, height: 1.5),
              ),
              const SizedBox(height: 28),
              Column(
                children: [
                  for (var i = 0; i < items.length; i++) ...[
                    CustomCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppTheme.darkPink.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              l10n.mythLabel,
                              style: TextStyle(
                                color: AppTheme.darkPink,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(items[i].myth,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: AppTheme.textPrimary),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 16),
                          const Divider(),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppTheme.successGreen.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              l10n.factLabel,
                              style: TextStyle(
                                color: AppTheme.successGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(items[i].fact,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: AppTheme.textSecondary,
                                      height: 1.5),
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                    if (i < items.length - 1) const SizedBox(height: 16),
                  ]
                ],
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
  const _MythFact({required this.myth, required this.fact});
}
