import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS2PharmacyAndHealthStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;

  const JSS2PharmacyAndHealthStudioWidget({
    super.key,
    required this.lesson,
  });

  @override
  State<JSS2PharmacyAndHealthStudioWidget> createState() => _JSS2PharmacyAndHealthStudioWidgetState();
}

class _JSS2PharmacyAndHealthStudioWidgetState extends State<JSS2PharmacyAndHealthStudioWidget> {
  final JSS2AudioService _audioService = JSS2AudioService();
  int _selectedAilmentIndex = 0;

  final List<Map<String, dynamic>> _ailments = [
    {
      'symptom': 'Mal de tête',
      'phrase': 'J\'ai mal à la tête.',
      'contraction': 'à la tête (féminin)',
      'remedy': 'Paracétamol (2 comprimés)',
      'posology': 'deux comprimés après le repas',
      'icon': Icons.psychology_alt_rounded,
      'audio': 'jai_mal_a_la_tete',
      'remedyAudio': 'deux_comprimes_apres_le_repas',
    },
    {
      'symptom': 'Mal de ventre',
      'phrase': 'J\'ai mal au ventre.',
      'contraction': 'à + le = AU ventre (masculin)',
      'remedy': 'Antispasmodique / Tisane',
      'posology': 'un sachet après chaque repas',
      'icon': Icons.accessibility_new_rounded,
      'audio': 'jai_mal_au_ventre',
      'remedyAudio': 'prenez_ce_sirop_trois_fois_par_jour',
    },
    {
      'symptom': 'Mal de gorge & Toux',
      'phrase': 'J\'ai mal à la gorge et je tousse.',
      'contraction': 'à la gorge (féminin)',
      'remedy': 'Sirop pour la toux',
      'posology': 'une cuillère à soupe 3 fois par jour',
      'icon': Icons.record_voice_over_rounded,
      'audio': 'jai_mal_a_la_gorge',
      'remedyAudio': 'prenez_ce_sirop_trois_fois_par_jour',
    },
    {
      'symptom': 'Fièvre & Paludisme',
      'phrase': 'J\'ai de la fièvre et des frissons.',
      'contraction': 'de la fièvre',
      'remedy': 'Antipaludéen + Repos',
      'posology': 'traitement complet sur 3 jours',
      'icon': Icons.thermostat_rounded,
      'audio': 'avez_vous_un_medicament_contre_le_paludisme',
      'remedyAudio': 'deux_comprimes_apres_le_repas',
    },
    {
      'symptom': 'Petite blessure',
      'phrase': 'J\'ai une coupure au doigt.',
      'contraction': 'au doigt (à + le)',
      'remedy': 'Désinfectant + Pansements stériles',
      'posology': 'appliquer le pansement stérile',
      'icon': Icons.healing_rounded,
      'audio': 'une_boite_de_pansements_steriles',
      'remedyAudio': 'bon_retablissement',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final current = _ailments[_selectedAilmentIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Banner
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0D7377), Color(0xFF10B981)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(Icons.local_pharmacy_rounded, color: Colors.white, size: 36),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Guichet de la Pharmacie : Symptômes & Posologie',
                        style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Décrivez vos douleurs corporelles (au ventre, à la tête, aux yeux) et écoutez les conseils du pharmacien.',
                        style: LangHueyTextStyles.bodySmall.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Symptoms Selector Cards
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_ailments.length, (index) {
                final a = _ailments[index];
                final isSelected = _selectedAilmentIndex == index;

                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: InkWell(
                    onTap: () {
                      setState(() => _selectedAilmentIndex = index);
                      _audioService.playPhrase(a['audio'] as String, term: 2);
                    },
                    borderRadius: BorderRadius.circular(14),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? LangHueyColors.deepTeal : Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isSelected ? LangHueyColors.deepTeal : Colors.black12,
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            a['icon'] as IconData,
                            color: isSelected ? Colors.white : LangHueyColors.deepTeal,
                            size: 24,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            a['symptom'] as String,
                            style: TextStyle(
                              color: isSelected ? Colors.white : LangHueyColors.charcoal,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 18),

          // Consultation Clinic Interaction
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Patient Speech Panel
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Parole du Patient (Vous) :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          IconButton(
                            icon: const Icon(Icons.volume_up_rounded, color: LangHueyColors.deepTeal),
                            onPressed: () => _audioService.playPhrase(current['audio'] as String, term: 2),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: LangHueyColors.softTeal,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: LangHueyColors.deepTeal.withOpacity(0.3)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '« ${current['phrase']} »',
                              style: LangHueyTextStyles.frenchHighlight.copyWith(fontSize: 16),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Règle d\'accord : ${current['contraction']}',
                              style: const TextStyle(fontSize: 12, color: LangHueyColors.deepTeal, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Pharmacist Prescription & Posology Panel
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Conseil du Pharmacien :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          IconButton(
                            icon: const Icon(Icons.volume_up_rounded, color: Colors.green),
                            onPressed: () => _audioService.playPhrase(current['remedyAudio'] as String, term: 2),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.green.shade200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '💊 Traitement : ${current['remedy']}',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.green),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '📋 Posologie : ${current['posology']}',
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              '« Bon rétablissement ! »',
                              style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 12, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
