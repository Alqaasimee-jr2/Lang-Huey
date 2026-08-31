import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1WeeklyRoutineStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1WeeklyRoutineStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1WeeklyRoutineStudioWidget> createState() => _JSS1WeeklyRoutineStudioWidgetState();
}

class _JSS1WeeklyRoutineStudioWidgetState extends State<JSS1WeeklyRoutineStudioWidget> {
  final JSS1AudioService _audioService = JSS1AudioService();

  int _selectedDayIndex = 0;

  final List<Map<String, dynamic>> _days = [
    {
      'day': 'Lundi',
      'activity': 'Cours de français & Anglais',
      'sentence': 'Le lundi, j\'ai cours de français avec mes camarades.',
      'tag': 'Semaine / École',
      'icon': Icons.menu_book_rounded,
      'audio': 'le_lundi_j_ai_cours_de_francais',
    },
    {
      'day': 'Mardi',
      'activity': 'Laboratoire de Mathématiques',
      'sentence': 'Le mardi, je fais des mathématiques et des sciences.',
      'tag': 'Semaine / École',
      'icon': Icons.calculate_rounded,
      'audio': 'le_mardi_je_fais_des_mathematiques',
    },
    {
      'day': 'Mercredi',
      'activity': 'Sport & Football l\'après-midi',
      'sentence': 'Le mercredi après-midi, je joue au football au terrain de sport.',
      'tag': 'Sport & Loisirs',
      'icon': Icons.sports_soccer_rounded,
      'audio': 'le_mercredi_apres_midi_je_joue_au_football',
    },
    {
      'day': 'Jeudi',
      'activity': 'Lecture à la Bibliothèque',
      'sentence': 'Le jeudi, je vais à la bibliothèque pour lire des romans.',
      'tag': 'Études & Lecture',
      'icon': Icons.local_library_rounded,
      'audio': 'le_jeudi_je_vais_a_la_bibliotheque',
    },
    {
      'day': 'Vendredi',
      'activity': 'Club de Français & Nettoyage',
      'sentence': 'Le vendredi, nous nettoyons la classe et participons au club.',
      'tag': 'Communauté & Club',
      'icon': Icons.cleaning_services_rounded,
      'audio': 'le_vendredi_nous_nettoyons_la_classe',
    },
    {
      'day': 'Samedi',
      'activity': 'Ménage, Lessive & Repos',
      'sentence': 'Le samedi, je fais le ménage, la lessive et je me repose.',
      'tag': 'Week-end / Maison',
      'icon': Icons.local_laundry_service_rounded,
      'audio': 'le_samedi_je_fais_le_menage',
    },
    {
      'day': 'Dimanche',
      'activity': 'Culte & Repas en Famille',
      'sentence': 'Le dimanche, nous allons au culte et déjeunons en famille.',
      'tag': 'Week-end / Famille',
      'icon': Icons.church_rounded,
      'audio': 'le_dimanche_nous_allons_au_culte',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final active = _days[_selectedDayIndex];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: 7 Days Grid Selector
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
                      child: Text('Emploi du Temps Hebdomadaire (7 Jours)', style: JSS1Text.subheading(JSS1Colors.teal), overflow: TextOverflow.ellipsis),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.teal, size: 22),
                      onPressed: () => _audioService.playPhrase('tous_les_jours_j_apprends_le_francais', term: 2),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.separated(
                    itemCount: _days.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, idx) {
                      final d = _days[idx];
                      final isSelected = _selectedDayIndex == idx;
                      final isWeekend = idx >= 5;

                      return InkWell(
                        onTap: () {
                          setState(() => _selectedDayIndex = idx);
                          _audioService.playPhrase(d['audio'] as String, term: 2);
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? JSS1Colors.teal
                                : (isWeekend ? JSS1Colors.gold.withValues(alpha: 0.1) : JSS1Colors.cream),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: isSelected
                                  ? JSS1Colors.teal
                                  : (isWeekend ? JSS1Colors.gold.withValues(alpha: 0.5) : JSS1Colors.lightGrey),
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 90,
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: isSelected ? JSS1Colors.gold : JSS1Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  d['day'] as String,
                                  style: TextStyle(
                                    color: isSelected ? JSS1Colors.charcoal : JSS1Colors.teal,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Icon(d['icon'] as IconData, color: isSelected ? JSS1Colors.gold : JSS1Colors.charcoal, size: 20),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  d['activity'] as String,
                                  style: TextStyle(
                                    color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
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

        // Right Column: Habit Spotlight & Weekend Question
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
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: JSS1Colors.gold,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'LE ${active['day'].toString().toUpperCase()}',
                        style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.white, size: 28),
                      onPressed: () => _audioService.playPhrase(active['audio'] as String, term: 2),
                    ),
                  ],
                ),

                // Center Icon
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
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: JSS1Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Habitude Hebdomadaire :', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text(
                        active['sentence'] as String,
                        style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: JSS1Colors.cream,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Règle : "Le + jour" (ex. Le ${active['day']}) exprime une habitude qui se répète chaque semaine.',
                          style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontSize: 11, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),

                // Weekend Question Interactive Trigger
                InkWell(
                  onTap: () => _audioService.playPhrase('que_fais_tu_le_week_end', term: 2),
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: JSS1Colors.gold,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.record_voice_over_rounded, color: JSS1Colors.charcoal, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Écouter : "Que fais-tu le week-end ?"',
                          style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w900, fontSize: 13),
                        ),
                      ],
                    ),
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
