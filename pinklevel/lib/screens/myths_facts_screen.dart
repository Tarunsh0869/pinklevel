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
        myth: 'Only women with a family history get breast cancer.',
        fact:
            'About 85% of breast cancers occur in women with no family history. All women are at risk.',
      ),
      _MythFact(
        myth: 'A lump in the breast always means cancer.',
        fact:
            'Most breast lumps are benign (non-cancerous). However, any new lump should be evaluated by a doctor.',
      ),
      _MythFact(
        myth: 'Breast cancer only affects older women.',
        fact:
            'While risk increases with age, breast cancer can occur at any age, including in young women and men.',
      ),
      _MythFact(
        myth: 'Wearing underwire bras causes breast cancer.',
        fact:
            'There is no scientific evidence linking bra type or wearing habits to breast cancer risk.',
      ),
      _MythFact(
        myth: 'Mammograms cause breast cancer to spread.',
        fact:
            'Mammograms use very low doses of radiation and are safe. The benefits of early detection far outweigh the minimal risk.',
      ),
      _MythFact(
        myth: 'Men cannot get breast cancer.',
        fact:
            'Men can get breast cancer, though it is rare. About 1% of all breast cancers occur in men.',
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
        title: const Text('Myths & Facts'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Separating Myth from Fact',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 12),
              Text(
                'Misinformation can be dangerous. Here are the facts you need to know.',
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
                // ignore: unnecessary_underscores
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
                                'MYTH',
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
                                'FACT',
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

  const _MythFact({required this.myth, required this.fact});
}
