import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1WrittenOralWorkshopStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1WrittenOralWorkshopStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1WrittenOralWorkshopStudioWidget> createState() => _JSS1WrittenOralWorkshopStudioWidgetState();
}

class _JSS1WrittenOralWorkshopStudioWidgetState extends State<JSS1WrittenOralWorkshopStudioWidget> {
  final JSS1AudioService _audioService = JSS1AudioService();

  int _selectedWorkshop = 0; // 0: Rédaction, 1: Dictée, 2: BECE QCM
  int? _selectedQCMAnswer;
  bool _hasCheckedQCM = false;

  final List<Map<String, dynamic>> _workshops = [
    {
      'title': '1. Rédaction Guidée',
      'icon': Icons.edit_note_rounded,
      'color': JSS1Colors.teal,
      'audio': 'presentez_vous_en_six_phrases',
      'prompt': 'Fiche de Composition : "Mon Autoportrait en JSS1"',
      'template': [
        '1. Je m\'appelle Chukwuma et j\'ai douze ans.',
        '2. Je suis nigérian et j\'habite à Abuja.',
        '3. Je suis élève en classe de JSS1.',
        '4. À l\'avenir, je voudrais devenir médecin.',
        '5. J\'aime le football et j\'adore le français.',
        '6. Le week-end, je me repose en famille.',
      ],
    },
    {
      'title': '2. Dictée & Accents',
      'icon': Icons.spellcheck_rounded,
      'color': JSS1Colors.gold,
      'audio': 'la_dictee_et_l_orthographe',
      'prompt': 'Dictée Phonétique des Accents Français',
      'template': [
        '• L\'accent aigu : élève, école, répétez',
        '• L\'accent grave : très, père, mère, où',
        '• L\'accent circonflexe : fête, forêt, août',
        '• La cédille : français, leçon, garçon',
        '• Le tréma : Noël, maïs, Jamaïque',
      ],
    },
    {
      'title': '3. Entraînement BECE',
      'icon': Icons.quiz_rounded,
      'color': JSS1Colors.green,
      'audio': 'choisissez_la_bonne_reponse',
      'prompt': 'Question type BECE / Junior WAEC :',
      'question': 'Quelle phrase est grammaticalement correcte ?',
      'options': [
        'A. Elle est médecin et elle soigne les malades.',
        'B. Elle est médecin et elle soigne le malade.',
        'C. Elle médecin et soignent les malades.',
        'D. Elle sont médecin et soigne les malades.'
      ],
      'correct': 0,
      'explanation': '"Elle est" (3e pers. singulier) + "médecin" + "elle soigne les malades".',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final active = _workshops[_selectedWorkshop];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: 3 Workshop Tabs & Workbench Content
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('3 Pôles d\'Entraînement Académique', style: JSS1Text.subheading(JSS1Colors.teal)),
                  const SizedBox(height: 12),

                  // 3 Workshop Tabs
                  Row(
                    children: List.generate(_workshops.length, (idx) {
                      final ws = _workshops[idx];
                      final isSelected = _selectedWorkshop == idx;

                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: idx < 2 ? 8 : 0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedWorkshop = idx;
                                _selectedQCMAnswer = null;
                                _hasCheckedQCM = false;
                              });
                              _audioService.playPhrase(ws['audio'] as String, term: 3);
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: isSelected ? ws['color'] as Color : JSS1Colors.cream,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                ws['title'] as String,
                                style: TextStyle(
                                  color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 10),

                  // Active Workshop Content
                  if (_selectedWorkshop < 2) ...[
                    Text(active['prompt'] as String, style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    ...List.generate((active['template'] as List<String>).length, (idx) {
                      final line = (active['template'] as List<String>)[idx];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: JSS1Colors.cream,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            line,
                            style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                      );
                    }),
                  ] else ...[
                    // BECE Drill Station
                    Text(active['prompt'] as String, style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(active['question'] as String, style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 15, fontWeight: FontWeight.w900)),
                    const SizedBox(height: 10),
                    ...List.generate((active['options'] as List<String>).length, (optIdx) {
                      final opt = (active['options'] as List<String>)[optIdx];
                      final isSelected = _selectedQCMAnswer == optIdx;
                      final isCorrect = optIdx == active['correct'];

                      Color cardBg = JSS1Colors.cream;
                      if (_hasCheckedQCM) {
                        if (isCorrect) {
                          cardBg = JSS1Colors.green.withValues(alpha: 0.15);
                        } else if (isSelected && !isCorrect) {
                          cardBg = const Color(0xFFFFEBEE);
                        }
                      } else if (isSelected) {
                        cardBg = JSS1Colors.teal.withValues(alpha: 0.1);
                      }

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: InkWell(
                          onTap: () {
                            if (!_hasCheckedQCM) {
                              setState(() => _selectedQCMAnswer = optIdx);
                              _audioService.playClick();
                            }
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            decoration: BoxDecoration(
                              color: cardBg,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: isSelected ? JSS1Colors.teal : JSS1Colors.lightGrey,
                                width: isSelected ? 2 : 1,
                              ),
                            ),
                            child: Text(
                              opt,
                              style: TextStyle(color: JSS1Colors.charcoal, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, fontSize: 12),
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 8),
                    if (!_hasCheckedQCM)
                      ElevatedButton(
                        onPressed: _selectedQCMAnswer == null
                            ? null
                            : () {
                                setState(() => _hasCheckedQCM = true);
                                final isCorrect = _selectedQCMAnswer == active['correct'];
                                if (isCorrect) {
                                  _audioService.playCorrect();
                                } else {
                                  _audioService.playIncorrect();
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: JSS1Colors.teal,
                          foregroundColor: JSS1Colors.white,
                          minimumSize: const Size(double.infinity, 40),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text('Valider la Réponse', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                  ],
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 20),

        // Right Column: Academic Success & Dictation Audio Coach
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
                    Expanded(
                      child: Text('CLINIQUE D\'ÉCRITURE & ORAL', style: JSS1Text.caption(JSS1Colors.gold).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1.2), overflow: TextOverflow.ellipsis),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.white, size: 28),
                      onPressed: () => _audioService.playPhrase('felicitations_pour_vos_progres', term: 3),
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

                // Academic Tip Box
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
                      Text('Conseil pour l\'Examen BECE :', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text(
                        '1) Soignez les accords en genre et en nombre.\n2) Vérifiez les accents sur chaque mot.\n3) Structurez votre autoportrait avec des connecteurs.',
                        style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontSize: 12, height: 1.4, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),

                // Exam Good Luck Prompt
                InkWell(
                  onTap: () => _audioService.playPhrase('bonne_chance_examen_annuel', term: 3),
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: JSS1Colors.gold,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    alignment: Alignment.center,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.stars_rounded, color: JSS1Colors.charcoal, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Écouter : "Bonne chance pour l\'examen annuel !"',
                          style: TextStyle(color: JSS1Colors.charcoal, fontWeight: FontWeight.w900, fontSize: 12),
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
