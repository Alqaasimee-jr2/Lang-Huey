import 'package:flutter/material.dart';
import '../../../models/jss3_lesson_model.dart';
import '../../../services/jss3_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 1 — Décrire plus précisément une personne
/// Avatar Character Studio: Physical & moral traits, BANGS adjective placement rule,
/// and "Qui est-ce ?" detective mystery game.
class JSS3PersonDescriptionStudioWidget extends StatefulWidget {
  final JSS3LessonModel lesson;
  const JSS3PersonDescriptionStudioWidget({super.key, required this.lesson});

  @override
  State<JSS3PersonDescriptionStudioWidget> createState() => _JSS3PersonDescriptionStudioWidgetState();
}

class _JSS3PersonDescriptionStudioWidgetState extends State<JSS3PersonDescriptionStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS3AudioService _audio = JSS3AudioService();
  late TabController _tabController;

  // Avatar customization state
  String _gender = 'm'; // 'm' or 'f'
  String _height = 'grand';
  String _complexion = 'le teint noir';
  String _hair = 'courts et crépus';
  final Set<String> _selectedMoralTraits = {'travailleur', 'honnête'};

  // Detective Quiz state
  int _detectiveIndex = 0;
  int _detectiveScore = 0;
  bool _detectiveAnswered = false;
  int? _selectedSuspect;

  static const List<Map<String, dynamic>> _suspects = [
    {
      'name': 'Aminu',
      'gender': 'Garçon (m)',
      'avatar': '👨🏽',
      'clues': [
        'Il est de grande taille et mince.',
        'Il a le teint noir et les cheveux courts crépus.',
        'Il est très travailleur, calme et loyal.',
      ],
      'options': ['Aminu', 'Chidi', 'Fatima', 'Bisi'],
      'correct': 0,
    },
    {
      'name': 'Fatima',
      'gender': 'Fille (f)',
      'avatar': '👩🏾',
      'clues': [
        'Elle est de taille moyenne et très dynamique.',
        'Elle a le teint clair et de beaux yeux noirs.',
        'Elle est généreuse, sociable et ambitieuse.',
      ],
      'options': ['Chidi', 'Fatima', 'Aisha', 'Zainab'],
      'correct': 1,
    },
    {
      'name': 'Chidi',
      'gender': 'Garçon (m)',
      'avatar': '👨🏿',
      'clues': [
        'Il est petit mais très fort et musclé.',
        'Il porte de belles lunettes rectangulaires.',
        'Il est sincère, honnête et aime aider ses camarades.',
      ],
      'options': ['Aminu', 'Bisi', 'Chidi', 'Emeka'],
      'correct': 2,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String _buildDescriptionSentence() {
    final pronoun = _gender == 'm' ? 'Il' : 'Elle';
    final heightAdj = _gender == 'm' ? _height : (_height == 'grand' ? 'grande' : (_height == 'petit' ? 'petite' : 'moyenne'));
    final moralList = _selectedMoralTraits.map((t) {
      if (_gender == 'f') {
        if (t == 'travailleur') return 'travailleuse';
        if (t == 'généreux') return 'généreuse';
      }
      return t;
    }).toList();

    final moralStr = moralList.isNotEmpty ? moralList.join(' et ') : 'sympathique';
    return '$pronoun est $heightAdj, a $_complexion, les cheveux $_hair, et $pronoun est très $moralStr.';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0D7377), Color(0xFF14BDCC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.face_retouching_natural_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Studio de Description Physique & Morale',
                  style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        // Tabs
        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            labelColor: LangHueyColors.deepTeal,
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: LangHueyColors.deepTeal,
            tabs: const [
              Tab(icon: Icon(Icons.badge_rounded, size: 18), text: 'Portrait Avatar'),
              Tab(icon: Icon(Icons.spellcheck_rounded, size: 18), text: 'Règle BANGS'),
              Tab(icon: Icon(Icons.search_rounded, size: 18), text: 'Jeu : Qui est-ce ?'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildAvatarTab(),
              _buildBangsTab(),
              _buildDetectiveTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAvatarTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Live Avatar Preview Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: LangHueyColors.deepTeal.withOpacity(0.3)),
              boxShadow: [
                BoxShadow(
                  color: LangHueyColors.deepTeal.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: LangHueyColors.softTeal,
                    shape: BoxShape.circle,
                    border: Border.all(color: LangHueyColors.deepTeal, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      _gender == 'm' ? '👨🏾' : '👩🏾',
                      style: const TextStyle(fontSize: 48),
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
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: LangHueyColors.deepTeal,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              _gender == 'm' ? 'Masculin (Il)' : 'Féminin (Elle)',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text('Portrait Vivant', style: LangHueyTextStyles.h3.copyWith(fontSize: 14)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _buildDescriptionSentence(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: LangHueyColors.charcoal,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Gender Toggle
          Text('1. Genre du Personnage :', style: LangHueyTextStyles.h3.copyWith(fontSize: 14)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: ChoiceChip(
                  label: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.man_rounded, size: 18), SizedBox(width: 6), Text('Masculin (Garçon / Homme)')],
                  ),
                  selected: _gender == 'm',
                  selectedColor: LangHueyColors.softTeal,
                  onSelected: (val) {
                    setState(() => _gender = 'm');
                    _audio.playClick();
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ChoiceChip(
                  label: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.woman_rounded, size: 18), SizedBox(width: 6), Text('Féminin (Fille / Femme)')],
                  ),
                  selected: _gender == 'f',
                  selectedColor: LangHueyColors.softTeal,
                  onSelected: (val) {
                    setState(() => _gender = 'f');
                    _audio.playClick();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Height / Build
          Text('2. Taille & Stature :', style: LangHueyTextStyles.h3.copyWith(fontSize: 14)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 10,
            children: [
              _buildOptionChip('Grand(e)', 'grand', _height, (v) => setState(() => _height = v)),
              _buildOptionChip('Petit(e)', 'petit', _height, (v) => setState(() => _height = v)),
              _buildOptionChip('De taille moyenne', 'de taille moyenne', _height, (v) => setState(() => _height = v)),
              _buildOptionChip('Élancé(e) et mince', 'élancé et mince', _height, (v) => setState(() => _height = v)),
            ],
          ),
          const SizedBox(height: 20),

          // Complexion
          Text('3. Teint de la Peau :', style: LangHueyTextStyles.h3.copyWith(fontSize: 14)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 10,
            children: [
              _buildOptionChip('Le teint noir', 'le teint noir', _complexion, (v) => setState(() => _complexion = v)),
              _buildOptionChip('Le teint clair', 'le teint clair', _complexion, (v) => setState(() => _complexion = v)),
              _buildOptionChip('Le teint brun / chocolat', 'le teint brun', _complexion, (v) => setState(() => _complexion = v)),
            ],
          ),
          const SizedBox(height: 20),

          // Moral Traits Multi-Select
          Text('4. Qualités Morales & Caractère (Sélection Multiple) :', style: LangHueyTextStyles.h3.copyWith(fontSize: 14)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: ['travailleur', 'généreux', 'honnête', 'sociable', 'ambitieux', 'timide', 'poli', 'courageux'].map((trait) {
              final selected = _selectedMoralTraits.contains(trait);
              return FilterChip(
                label: Text(_gender == 'f' && trait == 'travailleur'
                    ? 'travailleuse'
                    : (_gender == 'f' && trait == 'généreux' ? 'généreuse' : trait)),
                selected: selected,
                selectedColor: LangHueyColors.amberGold.withOpacity(0.3),
                checkmarkColor: LangHueyColors.charcoal,
                onSelected: (val) {
                  setState(() {
                    if (val) {
                      _selectedMoralTraits.add(trait);
                    } else if (_selectedMoralTraits.length > 1) {
                      _selectedMoralTraits.remove(trait);
                    }
                  });
                  _audio.playClick();
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionChip(String label, String value, String current, Function(String) onSelect) {
    final isSelected = current == value;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: LangHueyColors.deepTeal,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : LangHueyColors.charcoal,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      onSelected: (val) {
        if (val) {
          onSelect(value);
          _audio.playClick();
        }
      },
    );
  }

  Widget _buildBangsTab() {
    final bangsData = [
      {'letter': 'B', 'name': 'Beauty (Beauté)', 'words': 'beau / bel / belle, joli(e)', 'ex': 'Une jolie fille • Un bel homme'},
      {'letter': 'A', 'name': 'Age (Âge)', 'words': 'jeune, vieux / vieil / vieille, nouveau / nouvel / nouvelle', 'ex': 'Un jeune homme • Un vieil ami'},
      {'letter': 'N', 'name': 'Number / Goodness (Nombre & Bonté)', 'words': 'bon / bonne, mauvais(e), premier, deuxième', 'ex': 'Un bon élève • La première leçon'},
      {'letter': 'S', 'name': 'Size (Taille & Grandeur)', 'words': 'grand(e), petit(e), gros(se), long(ue), court(e)', 'ex': 'Un grand bâtiment • Une petite maison'},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: LangHueyColors.softTeal,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LangHueyColors.deepTeal.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.lightbulb_rounded, color: LangHueyColors.deepTeal, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'RÈGLE D\'OR BANGS : La plupart des adjectifs se placent APRÈS le nom (couleurs, nationalités). Seuls les adjectifs BANGS se placent AVANT le nom !',
                    style: TextStyle(color: Colors.teal.shade900, fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ...bangsData.map((item) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black12),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 3)),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: LangHueyColors.deepTeal,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        item['letter']!,
                        style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['name']!, style: LangHueyTextStyles.h3.copyWith(fontSize: 15)),
                        const SizedBox(height: 4),
                        Text('Adjectifs : ${item['words']}', style: TextStyle(color: Colors.brown.shade700, fontSize: 13, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text('Exemple : ${item['ex']}', style: const TextStyle(color: LangHueyColors.deepTeal, fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDetectiveTab() {
    final suspect = _suspects[_detectiveIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Case Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: LangHueyColors.charcoal,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.manage_search_rounded, color: LangHueyColors.amberGold, size: 24),
                    const SizedBox(width: 10),
                    Text(
                      'Enquête Mystère — Cas #${_detectiveIndex + 1} / ${_suspects.length}',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: LangHueyColors.amberGold,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Score: $_detectiveScore pts',
                    style: const TextStyle(color: LangHueyColors.charcoal, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Clues Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: LangHueyColors.deepTeal.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(suspect['avatar'] as String, style: const TextStyle(fontSize: 36)),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Indices du Témoin :', style: LangHueyTextStyles.h3.copyWith(fontSize: 16)),
                        Text('Genre suspect : ${suspect['gender']}', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ...(suspect['clues'] as List<String>).map((clue) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.fingerprint_rounded, color: LangHueyColors.deepTeal, size: 18),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            clue,
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: LangHueyColors.charcoal),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Text('Identifiez la personne correspondante :', style: LangHueyTextStyles.h3.copyWith(fontSize: 15)),
          const SizedBox(height: 12),

          // Suspect Options
          ...List.generate((suspect['options'] as List<String>).length, (i) {
            final name = (suspect['options'] as List<String>)[i];
            final isCorrect = i == suspect['correct'];
            Color btnColor = Colors.white;
            Color textColor = LangHueyColors.charcoal;

            if (_detectiveAnswered) {
              if (isCorrect) {
                btnColor = const Color(0xFF2ECC71);
                textColor = Colors.white;
              } else if (_selectedSuspect == i) {
                btnColor = const Color(0xFFE74C3C);
                textColor = Colors.white;
              }
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: !_detectiveAnswered
                    ? () {
                        setState(() {
                          _detectiveAnswered = true;
                          _selectedSuspect = i;
                          if (isCorrect) {
                            _detectiveScore += 10;
                            _audio.playCorrect();
                          } else {
                            _audio.playIncorrect();
                          }
                        });
                      }
                    : null,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: btnColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _detectiveAnswered && (isCorrect || _selectedSuspect == i)
                          ? Colors.transparent
                          : Colors.black12,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 15)),
                      if (_detectiveAnswered && isCorrect)
                        const Icon(Icons.check_circle_rounded, color: Colors.white, size: 20)
                      else if (_detectiveAnswered && _selectedSuspect == i)
                        const Icon(Icons.cancel_rounded, color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ),
            );
          }),

          if (_detectiveAnswered) ...[
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _detectiveIndex = (_detectiveIndex + 1) % _suspects.length;
                  _detectiveAnswered = false;
                  _selectedSuspect = null;
                });
                _audio.playClick();
              },
              icon: const Icon(Icons.arrow_forward_rounded),
              label: Text(_detectiveIndex + 1 < _suspects.length ? 'Enquête Suivante' : 'Recommencer l\'enquête'),
              style: ElevatedButton.styleFrom(
                backgroundColor: LangHueyColors.deepTeal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
