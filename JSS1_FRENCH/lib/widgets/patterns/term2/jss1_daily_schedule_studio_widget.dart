import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1DailyScheduleStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1DailyScheduleStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1DailyScheduleStudioWidget> createState() => _JSS1DailyScheduleStudioWidgetState();
}

class _JSS1DailyScheduleStudioWidgetState extends State<JSS1DailyScheduleStudioWidget> {
  final JSS1AudioService _audioService = JSS1AudioService();

  int _selectedMilestoneIndex = 0;

  final List<Map<String, dynamic>> _milestones = [
    {
      'time': '6h00',
      'label': 'Le Réveil',
      'phrase': 'À six heures, je me réveille.',
      'detail': 'Je sors du lit et je commence ma journée.',
      'icon': Icons.alarm_rounded,
      'audio': 'a_six_heures_je_me_reveille',
    },
    {
      'time': '6h30',
      'label': 'La Toilette',
      'phrase': 'À six heures et demie, je me lave et je m\'habille.',
      'detail': 'Je prends mon bain et j\'enfile mon uniforme scolaire.',
      'icon': Icons.shower_rounded,
      'audio': 'je_me_lave_et_je_m_habille',
    },
    {
      'time': '7h00',
      'label': 'Le Petit-déjeuner',
      'phrase': 'À sept heures, je prends le petit-déjeuner.',
      'detail': 'Je mange du pain, des œufs et je bois du thé chaud.',
      'icon': Icons.bakery_dining_rounded,
      'audio': 'a_sept_heures_je_prends_le_petit_dejeuner',
    },
    {
      'time': '7h30',
      'label': 'Départ à l\'École',
      'phrase': 'À sept heures et demie, je vais à l\'école.',
      'detail': 'Je marche avec mes camarades pour arriver à l\'heure au rassemblement.',
      'icon': Icons.directions_walk_rounded,
      'audio': 'a_sept_heures_et_demie_je_vais_a_l_ecole',
    },
    {
      'time': '8h00',
      'label': 'Début des Cours',
      'phrase': 'À huit heures, les cours commencent.',
      'detail': 'Le professeur entre dans la classe et nous commençons à étudier.',
      'icon': Icons.menu_book_rounded,
      'audio': 'a_huit_heures_les_cours_commencent',
    },
    {
      'time': '12h00',
      'label': 'Le Déjeuner',
      'phrase': 'À midi, je déjeune avec mes amis.',
      'detail': 'Pendant la pause, nous mangeons du riz jollof et discutons.',
      'icon': Icons.restaurant_rounded,
      'audio': 'a_midi_je_dejeune_avec_mes_amis',
    },
    {
      'time': '14h00',
      'label': 'Retour à la Maison',
      'phrase': 'À quatorze heures, je rentre à la maison.',
      'detail': 'Fin des cours, je range mes affaires et je rentre me reposer.',
      'icon': Icons.home_rounded,
      'audio': 'a_quatorze_heures_je_rentre_a_la_maison',
    },
    {
      'time': '18h00',
      'label': 'Les Devoirs',
      'phrase': 'À dix-huit heures, je fais mes devoirs.',
      'detail': 'J\'étudie mes leçons de français et de mathématiques.',
      'icon': Icons.edit_note_rounded,
      'audio': 'a_dix_huit_heures_je_fais_mes_devoirs',
    },
    {
      'time': '21h00',
      'label': 'Le Coucher',
      'phrase': 'À vingt et une heures, je me couche.',
      'detail': 'Je dis bonne nuit à mes parents et je m\'endors.',
      'icon': Icons.hotel_rounded,
      'audio': 'a_vingt_et_une_heures_je_me_couche',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final active = _milestones[_selectedMilestoneIndex];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: Chronological Day Timeline Carousel
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: JSS1Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: JSS1Colors.charcoal.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('Chronologie de la Journée (6h – 21h)', style: JSS1Text.subheading(JSS1Colors.teal), overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(width: 8),
                    Text('Cliquez sur une heure', style: JSS1Text.caption(JSS1Colors.grey)),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.separated(
                    itemCount: _milestones.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, idx) {
                      final m = _milestones[idx];
                      final isSelected = _selectedMilestoneIndex == idx;
                      return InkWell(
                        onTap: () {
                          setState(() => _selectedMilestoneIndex = idx);
                          _audioService.playPhrase(m['audio'] as String, term: 2);
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected ? JSS1Colors.teal : JSS1Colors.cream,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: isSelected ? JSS1Colors.teal : JSS1Colors.lightGrey,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                decoration: BoxDecoration(
                                  color: isSelected ? JSS1Colors.gold : JSS1Colors.teal.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  m['time'] as String,
                                  style: TextStyle(
                                    color: isSelected ? JSS1Colors.charcoal : JSS1Colors.teal,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Icon(
                                m['icon'] as IconData,
                                color: isSelected ? JSS1Colors.gold : JSS1Colors.charcoal,
                                size: 20,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  m['label'] as String,
                                  style: TextStyle(
                                    color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Icon(Icons.volume_up_rounded, color: isSelected ? JSS1Colors.white : JSS1Colors.grey, size: 16),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 20),

        // Right Column: Active Routine Spotlight & Reflexive Verb Lab
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: JSS1Colors.teal,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: JSS1Colors.teal.withValues(alpha: 0.2),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: JSS1Colors.gold,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        active['time'] as String,
                        style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w900, fontSize: 16),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.white, size: 28),
                      onPressed: () => _audioService.playPhrase(active['audio'] as String, term: 2),
                    ),
                  ],
                ),

                // Center Icon Showcase
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: JSS1Colors.white.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(active['icon'] as IconData, size: 64, color: JSS1Colors.gold),
                  ),
                ),

                // Spoken Sentence Box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: JSS1Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Phrase Modèle :', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(
                        active['phrase'] as String,
                        style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 17, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        active['detail'] as String,
                        style: JSS1Text.body(JSS1Colors.grey).copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                ),

                // Reflexive Verb Guide
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: JSS1Colors.white.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.tips_and_updates_rounded, color: JSS1Colors.gold, size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Note : Pour indiquer l\'heure d\'une action, utilisez la préposition "À" (À 6h, à midi, à 21h).',
                          style: const TextStyle(color: JSS1Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
