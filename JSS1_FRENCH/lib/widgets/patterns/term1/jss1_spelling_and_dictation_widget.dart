import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1SpellingAndDictationWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1SpellingAndDictationWidget({super.key, required this.lesson});

  @override
  State<JSS1SpellingAndDictationWidget> createState() => _JSS1SpellingAndDictationWidgetState();
}

class _JSS1SpellingAndDictationWidgetState extends State<JSS1SpellingAndDictationWidget> {
  final JSS1AudioService _audio = JSS1AudioService();
  String _typedWord = '';
  int _selectedTab = 0; // 0: Alphabet Soundboard, 1: French Accents Studio, 2: Interactive Dictation

  final List<Map<String, String>> _alphabet = [
    {'letter': 'A', 'sound': 'ah'}, {'letter': 'B', 'sound': 'bay'},
    {'letter': 'C', 'sound': 'say'}, {'letter': 'D', 'sound': 'day'},
    {'letter': 'E', 'sound': 'euh'}, {'letter': 'F', 'sound': 'ef'},
    {'letter': 'G', 'sound': 'zhay'}, {'letter': 'H', 'sound': 'ash'},
    {'letter': 'I', 'sound': 'ee'}, {'letter': 'J', 'sound': 'zhee'},
    {'letter': 'K', 'sound': 'kah'}, {'letter': 'L', 'sound': 'el'},
    {'letter': 'M', 'sound': 'em'}, {'letter': 'N', 'sound': 'en'},
    {'letter': 'O', 'sound': 'oh'}, {'letter': 'P', 'sound': 'pay'},
    {'letter': 'Q', 'sound': 'koo'}, {'letter': 'R', 'sound': 'air'},
    {'letter': 'S', 'sound': 'es'}, {'letter': 'T', 'sound': 'tay'},
    {'letter': 'U', 'sound': 'oo'}, {'letter': 'V', 'sound': 'vay'},
    {'letter': 'W', 'sound': 'doobl-vay'}, {'letter': 'X', 'sound': 'eeks'},
    {'letter': 'Y', 'sound': 'ee-grek'}, {'letter': 'Z', 'sound': 'zed'},
  ];

  final List<Map<String, dynamic>> _accents = [
    {
      'symbol': 'É',
      'name': 'Accent Aigu',
      'sound': 'Sharp "ay"',
      'examples': 'Élève, Café, Écoutez',
      'rule': 'Only placed on the letter E.',
      'audio': 'accent_aigu',
    },
    {
      'symbol': 'È / À',
      'name': 'Accent Grave',
      'sound': 'Open "eh" / Distinct meaning',
      'examples': 'Mère, Frère, Où, À',
      'rule': 'Distinguishes words like "a" (has) and "à" (at/to).',
      'audio': 'accent_grave',
    },
    {
      'symbol': 'Ê / Ô',
      'name': 'Accent Circonflexe',
      'sound': 'Lengthened vowel',
      'examples': 'Fête, Hôtel, Forêt',
      'rule': 'Indicates an old historical "s" that was dropped.',
      'audio': 'accent_circonflexe',
    },
    {
      'symbol': 'Ç',
      'name': 'La Cédille',
      'sound': 'Soft "s" sound',
      'examples': 'Français, Garçon, Ça va',
      'rule': 'Changes "c" to "s" sound before letters A, O, U.',
      'audio': 'la_cedille',
    },
    {
      'symbol': 'Ï / Ë',
      'name': 'Le Tréma',
      'sound': 'Separates vowels',
      'examples': 'Noël, Maïs, Haïti',
      'rule': 'Forces each vowel to be pronounced separately.',
      'audio': 'le_trema',
    },
  ];

  int _dictationIndex = 0;
  String _dictationInput = '';
  bool? _dictationPassed;

  final List<Map<String, String>> _dictationExercises = [
    {'target': 'BONJOUR', 'hint': 'Standard greeting in the morning', 'audio': 'bonjour_monsieur_madame'},
    {'target': 'SALUT', 'hint': 'Informal hi/bye with friends', 'audio': 'salut'},
    {'target': 'NIGERIA', 'hint': 'Our beloved motherland', 'audio': 'je_viens_de_lagos'},
    {'target': 'FRANCAIS', 'hint': 'The language of French (Français)', 'audio': 'la_cedille'},
  ];

  void _checkDictation() {
    final target = _dictationExercises[_dictationIndex]['target']!;
    final isMatch = _dictationInput.trim().toUpperCase() == target;

    setState(() {
      _dictationPassed = isMatch;
    });

    if (isMatch) {
      _audio.playCorrect();
    } else {
      _audio.playIncorrect();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: JSS1Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: JSS1Colors.charcoal.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Bar
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: JSS1Colors.teal.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.spellcheck_rounded, color: JSS1Colors.teal, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Studio d\'Alphabet, Accents & Dictée', style: JSS1Text.heading(JSS1Colors.teal)),
                    Text(
                      'Maîtrisez les 26 lettres françaises, les 5 accents et testez votre orthographe en dictée.',
                      style: JSS1Text.caption(JSS1Colors.grey),
                    ),
                  ],
                ),
              ),
              // Sub Tabs
              Container(
                decoration: BoxDecoration(
                  color: JSS1Colors.cream,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    _buildSubTab(0, 'Alphabet (A–Z)', Icons.sort_by_alpha_rounded),
                    _buildSubTab(1, 'Accents Français', Icons.text_fields_rounded),
                    _buildSubTab(2, 'Dictée Interactive', Icons.edit_note_rounded),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Main View
          Expanded(
            child: _selectedTab == 0
                ? _buildAlphabetView()
                : _selectedTab == 1
                    ? _buildAccentsView()
                    : _buildDictationView(),
          ),
        ],
      ),
    );
  }

  Widget _buildSubTab(int index, String title, IconData icon) {
    final isSel = _selectedTab == index;
    return InkWell(
      onTap: () {
        setState(() => _selectedTab = index);
        _audio.playClick();
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSel ? JSS1Colors.teal : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: isSel ? JSS1Colors.white : JSS1Colors.grey),
            const SizedBox(width: 6),
            Text(
              title,
              style: JSS1Text.caption(isSel ? JSS1Colors.white : JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlphabetView() {
    return Column(
      children: [
        // Spelled Word Preview Bar
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: JSS1Colors.cream,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: JSS1Colors.lightGrey),
          ),
          child: Row(
            children: [
              Text('Mot Épelé : ', style: JSS1Text.subheading(JSS1Colors.teal)),
              Expanded(
                child: Text(
                  _typedWord.isEmpty ? 'Cliquez sur les lettres pour épeler un mot...' : _typedWord,
                  style: JSS1Text.heading(JSS1Colors.charcoal).copyWith(
                    letterSpacing: 4,
                    color: _typedWord.isEmpty ? JSS1Colors.grey : JSS1Colors.charcoal,
                  ),
                ),
              ),
              if (_typedWord.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.backspace_rounded, color: JSS1Colors.red),
                  onPressed: () {
                    setState(() {
                      _typedWord = _typedWord.substring(0, _typedWord.length - 1);
                    });
                    _audio.playClick();
                  },
                ),
              if (_typedWord.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.clear_all_rounded, color: JSS1Colors.charcoal),
                  onPressed: () {
                    setState(() => _typedWord = '');
                    _audio.playClick();
                  },
                ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // 26 Letters Grid
        Expanded(
          child: GridView.builder(
            itemCount: _alphabet.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final item = _alphabet[index];
              return InkWell(
                onTap: () {
                  setState(() {
                    _typedWord += item['letter']!;
                  });
                  _audio.playClick();
                },
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  decoration: BoxDecoration(
                    color: JSS1Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: JSS1Colors.teal.withValues(alpha: 0.3)),
                    boxShadow: [
                      BoxShadow(
                        color: JSS1Colors.charcoal.withValues(alpha: 0.03),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item['letter']!,
                        style: JSS1Text.heading(JSS1Colors.teal).copyWith(fontSize: 22),
                      ),
                      Text(
                        '/${item['sound']}/',
                        style: JSS1Text.caption(JSS1Colors.gold).copyWith(fontSize: 11, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAccentsView() {
    return ListView.separated(
      itemCount: _accents.length,
      separatorBuilder: (c, i) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final acc = _accents[index];
        return Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: JSS1Colors.cream,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: JSS1Colors.lightGrey),
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: JSS1Colors.teal,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: Text(
                  acc['symbol'] as String,
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: JSS1Colors.gold),
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(acc['name'] as String, style: JSS1Text.subheading(JSS1Colors.charcoal)),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: JSS1Colors.gold.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(acc['sound'] as String, style: JSS1Text.caption(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text('Exemples : ${acc['examples']}', style: JSS1Text.body(JSS1Colors.teal).copyWith(fontWeight: FontWeight.w800, fontSize: 14)),
                    Text('Règle : ${acc['rule']}', style: JSS1Text.caption(JSS1Colors.grey)),
                  ],
                ),
              ),
              IconButton.filled(
                onPressed: () => _audio.playPhrase(acc['audio'] as String, term: 1),
                icon: const Icon(Icons.volume_up_rounded),
                style: IconButton.styleFrom(backgroundColor: JSS1Colors.gold, foregroundColor: JSS1Colors.charcoal),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDictationView() {
    final cur = _dictationExercises[_dictationIndex];

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: JSS1Colors.cream,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: JSS1Colors.lightGrey),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Exercice de Dictée ${_dictationIndex + 1} / ${_dictationExercises.length}', style: JSS1Text.subheading(JSS1Colors.teal)),
              IconButton.filled(
                onPressed: () => _audio.playPhrase(cur['audio']!, term: 1),
                icon: const Icon(Icons.volume_up_rounded, size: 28),
                style: IconButton.styleFrom(backgroundColor: JSS1Colors.gold, foregroundColor: JSS1Colors.charcoal),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Indice : ${cur['hint']}',
            style: JSS1Text.body(JSS1Colors.grey).copyWith(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 24),

          // Dictation text input field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: JSS1Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _dictationPassed == null
                    ? JSS1Colors.teal
                    : _dictationPassed!
                        ? JSS1Colors.green
                        : JSS1Colors.red,
                width: 2,
              ),
            ),
            child: TextField(
              onChanged: (val) => setState(() {
                _dictationInput = val;
                _dictationPassed = null;
              }),
              style: JSS1Text.heading(JSS1Colors.charcoal).copyWith(letterSpacing: 4),
              decoration: const InputDecoration(
                hintText: 'TAPEZ LE MOT ÉCOUTÉ...',
                border: InputBorder.none,
              ),
              textCapitalization: TextCapitalization.characters,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: _dictationInput.isEmpty ? null : _checkDictation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: JSS1Colors.teal,
                  foregroundColor: JSS1Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                icon: const Icon(Icons.check_circle_rounded),
                label: Text('Vérifier l\'Orthographe', style: JSS1Text.body(JSS1Colors.white).copyWith(fontWeight: FontWeight.w800)),
              ),
              if (_dictationPassed == true && _dictationIndex < _dictationExercises.length - 1) ...[
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _dictationIndex++;
                      _dictationInput = '';
                      _dictationPassed = null;
                    });
                    _audio.playClick();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: JSS1Colors.gold,
                    foregroundColor: JSS1Colors.charcoal,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  icon: const Icon(Icons.arrow_forward_rounded),
                  label: Text('Mot Suivant', style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800)),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
