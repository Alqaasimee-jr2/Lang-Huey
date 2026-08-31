import 'package:flutter/material.dart';
import '../../services/jss3_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';
import '../roadmap/jss3_week_roadmap_screen.dart';

class JSS3TermSelectScreen extends StatelessWidget {
  const JSS3TermSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final audio = JSS3AudioService();

    final terms = [
      {
        'term': 1,
        'title': 'Premier Trimestre',
        'subtitle': 'Descriptions, Paysages, Habitudes, Souvenirs & BECE Prep',
        'weeks': '9 Semaines Pédagogiques',
        'isAvailable': true,
        'color': LangHueyColors.deepTeal,
        'badge': 'Complet & Actif',
      },
      {
        'term': 2,
        'title': 'Deuxième Trimestre (Trimestre Terminal)',
        'subtitle': 'Passé Récent, Journal, Futur Simple, Préparation BECE & Support Bilingue Français-Anglais',
        'weeks': '9 Semaines • Examen Final BECE',
        'isAvailable': true,
        'color': const Color(0xFF1B4F72),
        'badge': 'Trimestre Terminal • BECE',
      },
    ];

    return Scaffold(
      backgroundColor: LangHueyColors.warmCream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Brand Banner
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: LangHueyColors.deepTeal,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(Icons.school_rounded, color: Colors.white, size: 32),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('LANG HUEY', style: LangHueyTextStyles.h1.copyWith(fontSize: 26, color: LangHueyColors.deepTeal)),
                          Text('JSS 3 French Engine • BECE Preparation', style: LangHueyTextStyles.bodyMedium.copyWith(color: LangHueyColors.textMuted, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: LangHueyColors.amberGold.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: LangHueyColors.amberGold),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.stars_rounded, color: Colors.brown, size: 20),
                        const SizedBox(width: 6),
                        Text('Grade 9 / JSS 3 Exam Year', style: TextStyle(color: Colors.brown.shade900, fontWeight: FontWeight.bold, fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              Text('Choisissez votre Trimestre d\'Apprentissage :', style: LangHueyTextStyles.h2),
              const SizedBox(height: 8),
              Text(
                'Programme officiel NERDC harmonisé pour Smartboards interactifs avec prononciation native.',
                style: LangHueyTextStyles.bodyMedium.copyWith(color: LangHueyColors.textMuted),
              ),
              const SizedBox(height: 24),

              // Term Cards
              ...terms.map((item) {
                final isAvail = item['isAvailable'] as bool;
                final termNum = item['term'] as int;
                final color = item['color'] as Color;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: InkWell(
                    onTap: isAvail
                        ? () {
                            audio.playClick();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => JSS3WeekRoadmapScreen(termNumber: termNum),
                              ),
                            );
                          }
                        : null,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isAvail ? LangHueyColors.deepTeal.withOpacity(0.3) : Colors.black12,
                          width: isAvail ? 2 : 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: isAvail ? LangHueyColors.deepTeal.withOpacity(0.06) : Colors.transparent,
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                'T$termNum',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900,
                                  color: color,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      item['title'] as String,
                                      style: LangHueyTextStyles.h2.copyWith(fontSize: 18),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: isAvail ? LangHueyColors.softTeal : Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        item['badge'] as String,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: isAvail ? LangHueyColors.deepTeal : Colors.grey.shade600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['subtitle'] as String,
                                  style: LangHueyTextStyles.bodyMedium.copyWith(color: LangHueyColors.textMuted, fontSize: 13),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  item['weeks'] as String,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            isAvail ? Icons.arrow_forward_ios_rounded : Icons.lock_outline_rounded,
                            color: color,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
