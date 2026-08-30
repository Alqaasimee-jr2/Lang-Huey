import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1CharacterPortraitStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1CharacterPortraitStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1CharacterPortraitStudioWidget> createState() => _JSS1CharacterPortraitStudioWidgetState();
}

class _JSS1CharacterPortraitStudioWidgetState extends State<JSS1CharacterPortraitStudioWidget> {
  final JSS1AudioService _audio = JSS1AudioService();
  bool _isFemale = false;
  String _height = 'grand'; // 'grand' or 'petit'
  String _buildType = 'mince'; // 'mince' or 'gros'
  String _complexion = 'teint noir'; // 'teint noir' or 'teint clair'
  String _trait = 'intelligent'; // 'intelligent', 'gentil', 'travailleur'

  @override
  Widget build(BuildContext context) {
    final pronoun = _isFemale ? 'Elle' : 'Il';
    final heightAdj = _isFemale ? (_height == 'grand' ? 'grande' : 'petite') : _height;
    final buildAdj = _isFemale ? (_buildType == 'gros' ? 'grosse' : 'mince') : _buildType;
    final traitAdj = _isFemale
        ? (_trait == 'intelligent'
            ? 'intelligente'
            : _trait == 'gentil'
                ? 'gentille'
                : 'travailleuse')
        : _trait;

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
                child: const Icon(Icons.face_retouching_natural_rounded, color: JSS1Colors.teal, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Studio de Portrait & Description Physique', style: JSS1Text.heading(JSS1Colors.teal)),
                    Text(
                      'Créez un profil physique et moral et observez les accords d\'adjectifs masculin/féminin en direct.',
                      style: JSS1Text.caption(JSS1Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Main 2 Columns
          Expanded(
            child: Row(
              children: [
                // Left Column: Interactive Trait Selector
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: JSS1Colors.cream,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: JSS1Colors.lightGrey),
                    ),
                    child: ListView(
                      children: [
                        // Genre Toggle
                        Text('1. Genre du Personnage', style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            ChoiceChip(
                              label: const Text('Garçon (Il / Masculin)'),
                              selected: !_isFemale,
                              selectedColor: JSS1Colors.teal,
                              backgroundColor: JSS1Colors.white,
                              labelStyle: TextStyle(color: !_isFemale ? JSS1Colors.white : JSS1Colors.charcoal, fontWeight: FontWeight.bold),
                              onSelected: (sel) {
                                if (sel) {
                                  setState(() => _isFemale = false);
                                  _audio.playClick();
                                }
                              },
                            ),
                            const SizedBox(width: 10),
                            ChoiceChip(
                              label: const Text('Fille (Elle / Féminin)'),
                              selected: _isFemale,
                              selectedColor: JSS1Colors.teal,
                              backgroundColor: JSS1Colors.white,
                              labelStyle: TextStyle(color: _isFemale ? JSS1Colors.white : JSS1Colors.charcoal, fontWeight: FontWeight.bold),
                              onSelected: (sel) {
                                if (sel) {
                                  setState(() => _isFemale = true);
                                  _audio.playClick();
                                }
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Taille (Height)
                        Text('2. Taille (Height)', style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            ChoiceChip(
                              label: Text(_isFemale ? 'Grande (Tall)' : 'Grand (Tall)'),
                              selected: _height == 'grand',
                              selectedColor: JSS1Colors.gold,
                              backgroundColor: JSS1Colors.white,
                              labelStyle: const TextStyle(fontWeight: FontWeight.w900, color: JSS1Colors.charcoal),
                              onSelected: (sel) {
                                if (sel) {
                                  setState(() => _height = 'grand');
                                  _audio.playPhrase('grand_grande', term: 1);
                                }
                              },
                            ),
                            const SizedBox(width: 10),
                            ChoiceChip(
                              label: Text(_isFemale ? 'Petite (Short)' : 'Petit (Short)'),
                              selected: _height == 'petit',
                              selectedColor: JSS1Colors.gold,
                              backgroundColor: JSS1Colors.white,
                              labelStyle: const TextStyle(fontWeight: FontWeight.w900, color: JSS1Colors.charcoal),
                              onSelected: (sel) {
                                if (sel) {
                                  setState(() => _height = 'petit');
                                  _audio.playPhrase('petit_petite', term: 1);
                                }
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Teint (Complexion)
                        Text('3. Teint de Peau', style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            ChoiceChip(
                              label: const Text('Teint Noir (Dark)'),
                              selected: _complexion == 'teint noir',
                              selectedColor: JSS1Colors.teal,
                              backgroundColor: JSS1Colors.white,
                              labelStyle: TextStyle(color: _complexion == 'teint noir' ? JSS1Colors.white : JSS1Colors.charcoal, fontWeight: FontWeight.bold),
                              onSelected: (sel) {
                                if (sel) {
                                  setState(() => _complexion = 'teint noir');
                                  _audio.playPhrase('teint_clair_teint_noir', term: 1);
                                }
                              },
                            ),
                            const SizedBox(width: 10),
                            ChoiceChip(
                              label: const Text('Teint Clair (Fair)'),
                              selected: _complexion == 'teint clair',
                              selectedColor: JSS1Colors.teal,
                              backgroundColor: JSS1Colors.white,
                              labelStyle: TextStyle(color: _complexion == 'teint clair' ? JSS1Colors.white : JSS1Colors.charcoal, fontWeight: FontWeight.bold),
                              onSelected: (sel) {
                                if (sel) {
                                  setState(() => _complexion = 'teint clair');
                                  _audio.playPhrase('teint_clair_teint_noir', term: 1);
                                }
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Trait Moral (Character)
                        Text('4. Caractère & Personnalité', style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800)),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            ChoiceChip(
                              label: Text(_isFemale ? 'Intelligente' : 'Intelligent'),
                              selected: _trait == 'intelligent',
                              selectedColor: JSS1Colors.gold,
                              backgroundColor: JSS1Colors.white,
                              labelStyle: const TextStyle(fontWeight: FontWeight.w900, color: JSS1Colors.charcoal),
                              onSelected: (sel) {
                                if (sel) {
                                  setState(() => _trait = 'intelligent');
                                  _audio.playPhrase('intelligent_intelligente', term: 1);
                                }
                              },
                            ),
                            ChoiceChip(
                              label: Text(_isFemale ? 'Gentille' : 'Gentil'),
                              selected: _trait == 'gentil',
                              selectedColor: JSS1Colors.gold,
                              backgroundColor: JSS1Colors.white,
                              labelStyle: const TextStyle(fontWeight: FontWeight.w900, color: JSS1Colors.charcoal),
                              onSelected: (sel) {
                                if (sel) {
                                  setState(() => _trait = 'gentil');
                                  _audio.playPhrase('gentil_gentille', term: 1);
                                }
                              },
                            ),
                            ChoiceChip(
                              label: Text(_isFemale ? 'Travailleuse' : 'Travailleur'),
                              selected: _trait == 'travailleur',
                              selectedColor: JSS1Colors.gold,
                              backgroundColor: JSS1Colors.white,
                              labelStyle: const TextStyle(fontWeight: FontWeight.w900, color: JSS1Colors.charcoal),
                              onSelected: (sel) {
                                if (sel) {
                                  setState(() => _trait = 'travailleur');
                                  _audio.playPhrase('travailleur_travailleuse', term: 1);
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 24),

                // Right Column: Live Portrait Description Card
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF0D7377), Color(0xFF064E52)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: JSS1Colors.gold.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _isFemale ? Icons.face_3_rounded : Icons.face_rounded,
                            color: JSS1Colors.gold,
                            size: 54,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          'Portrait Descriptif',
                          style: JSS1Text.heading(JSS1Colors.gold).copyWith(fontSize: 22),
                        ),

                        const SizedBox(height: 14),

                        Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: JSS1Colors.white.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '« $pronoun est $heightAdj, $buildAdj et de $_complexion. »',
                                style: JSS1Text.subheading(JSS1Colors.white).copyWith(fontSize: 17),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '« De plus, $pronoun est très $traitAdj ! »',
                                style: JSS1Text.subheading(JSS1Colors.gold).copyWith(fontSize: 17),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: JSS1Colors.white.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            _isFemale
                                ? 'Règle : Au féminin, on ajoute généralement « e » (ex: grande, intelligente, gentille).'
                                : 'Règle : Forme de base au masculin singulier.',
                            style: JSS1Text.caption(JSS1Colors.cream).copyWith(fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        const SizedBox(height: 16),

                        ElevatedButton.icon(
                          onPressed: () => _audio.playPhrase('comment_est_il', term: 1),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: JSS1Colors.gold,
                            foregroundColor: JSS1Colors.charcoal,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          icon: const Icon(Icons.volume_up_rounded),
                          label: Text(
                            'Écouter la Description',
                            style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
