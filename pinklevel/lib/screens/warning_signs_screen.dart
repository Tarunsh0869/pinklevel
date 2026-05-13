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
        image: 'assets/new_lump.png',
        title: 'New Lump',
        description:
            'A new lump or mass in the breast or underarm area that feels different from surrounding tissue.',
      ),
      _WarningSign(
        image: 'assets/skin_dimpling.png',
        title: 'Skin Dimpling',
        description:
            'Dimpling, puckering, or changes in the skin texture that looks like an orange peel.',
      ),
      _WarningSign(
        image: 'assets/nipple_changes.png',
        title: 'Nipple Changes',
        description:
            'Nipple turning inward, changes in position, or becoming inverted when it wasn\'t before.',
      ),
      _WarningSign(
        image: 'assets/nipple_discharge.png',
        title: 'Nipple Discharge',
        description:
            'Unusual discharge from the nipple, especially if bloody or clear fluid.',
      ),
      _WarningSign(
        image: 'assets/swelling.png',
        title: 'Swelling',
        description:
            'Swelling of all or part of the breast, even without a distinct lump.',
      ),
      _WarningSign(
        image: 'assets/redness.png',
        title: 'Redness or Sores',
        description:
            'Redness, scaliness, or thickening of the nipple or breast skin.',
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
        title: const Text('Warning Signs'),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: PrimaryButton(
            text: 'See Normal vs Abnormal',
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
                'What to Look For',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 12),
              Text(
                'Be aware of these potential warning signs. If you notice any of these, consult your doctor immediately.',
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
                    image: sign.image,
                    title: sign.title,
                    description: sign.description,
                  );
                },
              ),
              const SizedBox(height: 28),
              const InfoBanner(
                message:
                    'Remember: Many breast changes are not cancer. However, it\'s important to have any concerns checked by a healthcare professional.',
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
  final String image;
  final String title;
  final String description;

  _WarningSign({
    required this.image,
    required this.title,
    required this.description,
  });
}
