import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1HobbiesAndLeisureWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1HobbiesAndLeisureWidget({super.key, required this.lesson});

  @override
  State<JSS1HobbiesAndLeisureWidget> createState() => _JSS1HobbiesAndLeisureWidgetState();
}

class _JSS1HobbiesAndLeisureWidgetState extends State<JSS1HobbiesAndLeisureWidget> {
  final JSS1AudioService _audio = JSS1AudioService();
  int _selectedHobbyIndex = 0;
  final Set<String> _myHobbies = {'Jouer au football', 'Écouter de la musique'};

  final List<Map<String, dynamic>> _hobbies = [
    {
      'title': 'Jouer au football',
      'category': 'Sport de Ballon (Jouer à)',
      'english': 'To play football',
      'icon': Icons.sports_soccer_rounded,
      'audio': 'jouer_au_football',
      'grammarRule': 'On dit : « Jouer au football » (Jouer + à + le = au)',
    },
    {
      'title': 'Écouter de la musique',
      'category': 'Art & Détente',
      'english': 'To listen to music',
      'icon': Icons.headphones_rounded,
      'audio': 'ecouter_de_la_musique',
      'grammarRule': 'On dit : « Écouter de la musique » (Écouter + de la)',
    },
    {
      'title': 'Lire des livres / romans',
      'category': 'Lecture & Études',
      'english': 'To read books and novels',
      'icon': Icons.menu_book_rounded,
      'audio': 'lire_des_livres',
      'grammarRule': 'Verbe irrégulier : Je lis, Tu lis, Il/Elle lit',
    },
    {
      'title': 'Regarder la télévision',
      'category': 'Loisir à la Maison',
      'english': 'To watch television',
      'icon': Icons.tv_rounded,
      'audio': 'regarder_la_television',
      'grammarRule': 'Verbe régulier en -er : Je regarde la télé',
    },
    {
      'title': 'Faire du vélo / Nager',
      'category': 'Activité Physique (Faire de)',
      'english': 'To ride a bicycle / To swim',
      'icon': Icons.directions_bike_rounded,
      'audio': 'faire_du_velo_nager',
      'grammarRule': 'On dit : « Faire du vélo » (Faire + du) et « Nager »',
    },
    {
      'title': 'Dessiner et peindre',
      'category': 'Arts Plastiques',
      'english': 'To draw and paint',
      'icon': Icons.brush_rounded,
      'audio': 'dessiner_et_peindre',
      'grammarRule': 'Verbes en -er : Je dessine, Je peins',
    },
    {
      'title': 'Chanter et danser',
      'category': 'Musique & Danse',
      'english': 'To sing and dance',
      'icon': Icons.music_note_rounded,
      'audio': 'chanter_et_danser',
      'grammarRule': 'Verbes en -er : Je chante et je danse',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final cur = _hobbies[_selectedHobbyIndex];

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
                  color: JSS1Colors.gold.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.sports_esports_rounded, color: JSS1Colors.charcoal, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Studio des Loisirs & Passe-temps', style: JSS1Text.heading(JSS1Colors.teal)),
                    Text(
                      'Explorez les sports, arts et loisirs et composez votre planning du week-end en français.',
                      style: JSS1Text.caption(JSS1Colors.grey),
                    ),
                  ],
                ),
              ),
              IconButton.filled(
                onPressed: () => _audio.playPhrase('quest_ce_que_tu_fais_temps_libre', term: 1),
                icon: const Icon(Icons.record_voice_over_rounded),
                style: IconButton.styleFrom(backgroundColor: JSS1Colors.teal, foregroundColor: JSS1Colors.white),
                tooltip: 'Qu\'est-ce que tu fais pendant ton temps libre ?',
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Main 2 Columns
          Expanded(
            child: Row(
              children: [
                // Left Column: Hobbies Grid
                Expanded(
                  flex: 5,
                  child: GridView.builder(
                    itemCount: _hobbies.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, idx) {
                      final item = _hobbies[idx];
                      final isSel = _selectedHobbyIndex == idx;

                      return InkWell(
                        onTap: () {
                          setState(() => _selectedHobbyIndex = idx);
                          _audio.playPhrase(item['audio'] as String, term: 1);
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSel ? JSS1Colors.teal : JSS1Colors.cream,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSel ? JSS1Colors.teal : JSS1Colors.lightGrey,
                              width: isSel ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                item['icon'] as IconData,
                                color: isSel ? JSS1Colors.gold : JSS1Colors.teal,
                                size: 24,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item['title'] as String,
                                      style: JSS1Text.body(isSel ? JSS1Colors.white : JSS1Colors.charcoal).copyWith(fontSize: 13, fontWeight: FontWeight.w800),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      item['english'] as String,
                                      style: JSS1Text.caption(isSel ? JSS1Colors.gold : JSS1Colors.grey).copyWith(fontSize: 11),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 24),

                // Right Column: Hobby Spotlight & Journal Builder
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: JSS1Colors.cream,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: JSS1Colors.lightGrey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(14),
                              decoration: const BoxDecoration(
                                color: JSS1Colors.teal,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(cur['icon'] as IconData, color: JSS1Colors.gold, size: 32),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(cur['title'] as String, style: JSS1Text.heading(JSS1Colors.teal).copyWith(fontSize: 20)),
                                  Text(cur['category'] as String, style: JSS1Text.caption(JSS1Colors.grey).copyWith(fontWeight: FontWeight.w800)),
                                ],
                              ),
                            ),
                            IconButton.filled(
                              onPressed: () => _audio.playPhrase(cur['audio'] as String, term: 1),
                              icon: const Icon(Icons.volume_up_rounded),
                              style: IconButton.styleFrom(backgroundColor: JSS1Colors.gold, foregroundColor: JSS1Colors.charcoal),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(
                            'assets/images/jss1_term1/jss1_hobbies_lifestyle.jpg',
                            height: 95,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (c, e, s) => const SizedBox.shrink(),
                          ),
                        ),
                        const Divider(height: 20),
                        Text('Règle Grammaticale :', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.w900)),
                        const SizedBox(height: 4),
                        Text(cur['grammarRule'] as String, style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontSize: 14)),

                        const SizedBox(height: 16),

                        Text('Phrase Modèle pour la Classe :', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.w900)),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: JSS1Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: JSS1Colors.teal.withValues(alpha: 0.2)),
                          ),
                          child: Text(
                            '« Pendant mon temps libre, je préfère ${cur['title'].toString().toLowerCase()} avec mes camarades. »',
                            style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontStyle: FontStyle.italic, fontSize: 14),
                          ),
                        ),

                        const Spacer(),

                        Center(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              final title = cur['title'] as String;
                              setState(() {
                                if (_myHobbies.contains(title)) {
                                  _myHobbies.remove(title);
                                } else {
                                  _myHobbies.add(title);
                                }
                              });
                              _audio.playClick();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _myHobbies.contains(cur['title']) ? JSS1Colors.green : JSS1Colors.teal,
                              foregroundColor: JSS1Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            ),
                            icon: Icon(_myHobbies.contains(cur['title']) ? Icons.check_circle_rounded : Icons.add_circle_outline_rounded),
                            label: Text(
                              _myHobbies.contains(cur['title']) ? 'Ajouté à Mon Planning !' : 'Ajouter à Mes Loisirs Favoris',
                              style: JSS1Text.body(JSS1Colors.white).copyWith(fontWeight: FontWeight.w800),
                            ),
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
