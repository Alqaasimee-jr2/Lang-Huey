import 'package:flutter/material.dart';
import '../../../models/jss3_lesson_model.dart';
import '../../../services/jss3_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 3 (Term 2) — Comprendre un récit et écrire son journal intime
/// Personal Diary Canvas, Story Reading Comprehension, and Emotions Palette.
class JSS3DiaryAndNarrativeStudioWidget extends StatefulWidget {
  final JSS3LessonModel lesson;
  const JSS3DiaryAndNarrativeStudioWidget({super.key, required this.lesson});

  @override
  State<JSS3DiaryAndNarrativeStudioWidget> createState() =>
      _JSS3DiaryAndNarrativeStudioWidgetState();
}

class _JSS3DiaryAndNarrativeStudioWidgetState
    extends State<JSS3DiaryAndNarrativeStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS3AudioService _audio = JSS3AudioService();
  late TabController _tabController;

  String _selectedEmotion = 'La fierté 🌟';
  int _diaryEntryIndex = 0;

  static const List<Map<String, dynamic>> _diaryEntries = [
    {
      'date': 'Vendredi 15 mars 2026',
      'title': 'La Victoire de Green House',
      'emotion': 'Fierté & Joie',
      'color': Color(0xFF27AE60),
      'body':
          'Cher journal,\n\nQuelle journée inoubliable ! Ce matin, notre maison scolaire a remporté la coupe d\'athlétisme. Au début, j\'avais le trac avant ma course de relais. Mais quand le coup de sifflet a retenti, j\'ai couru comme le vent et nous avons franchi la ligne en vainqueurs ! Tout le collège a applaudi. Je ressens une immense fierté. À demain !',
    },
    {
      'date': 'Mardi 22 avril 2026',
      'title': 'Le Nouveau Laboratoire de Langues',
      'emotion': 'Émerveillement',
      'color': Color(0xFF8E44AD),
      'body':
          'Cher journal,\n\nAujourd\'hui, nous avons inauguré la nouvelle salle multimédia de français. Les casques audio et les tableaux interactifs sont ultra modernes. Notre professeur nous a fait écouter des chansons de Stromae et des dialogues à Paris. J\'ai enfin compris comment utiliser les pronoms ! Je garde l\'espoir d\'avoir la mention Très Bien au BECE. Bonne nuit !',
    },
  ];

  static const List<Map<String, String>> _emotions = [
    {'name': 'La fierté 🌟', 'french': 'Je ressens une immense fierté.', 'trans': 'I feel immense pride.'},
    {'name': 'Le soulagement 😌', 'french': 'Je suis enfin soulagé(e).', 'trans': 'I am finally relieved.'},
    {'name': 'La joie radieuse 😊', 'french': 'Mon cœur est rempli de bonheur.', 'trans': 'My heart is full of joy.'},
    {'name': 'L\'inquiétude 😟', 'french': 'J\'étais un peu anxieux pour l\'examen.', 'trans': 'I was a bit anxious.'},
    {'name': 'L\'espoir 🌈', 'french': 'Je garde un grand espoir de réussir.', 'trans': 'I maintain great hope.'},
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF8E44AD), Color(0xFF9B59B6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.menu_book_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Atelier : Comprendre un Récit & Mon Journal Intime',
                  style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            labelColor: const Color(0xFF8E44AD),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFF8E44AD),
            tabs: const [
              Tab(icon: Icon(Icons.auto_stories_rounded, size: 18), text: 'Feuilleter le Journal'),
              Tab(icon: Icon(Icons.sentiment_satisfied_alt_rounded, size: 18), text: 'Palette des Émotions'),
              Tab(icon: Icon(Icons.format_list_bulleted_rounded, size: 18), text: 'Structure Standard'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildJournalReaderTab(),
              _buildEmotionsTab(),
              _buildStructureTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildJournalReaderTab() {
    final entry = _diaryEntries[_diaryEntryIndex];
    final color = entry['color'] as Color;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Entrées de Journal Intime :', style: LangHueyTextStyles.h3),
              Row(
                children: List.generate(_diaryEntries.length, (idx) {
                  final isSel = _diaryEntryIndex == idx;
                  return Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: ActionChip(
                      label: Text('Page ${idx + 1}'),
                      backgroundColor: isSel ? color : Colors.grey.shade200,
                      labelStyle: TextStyle(color: isSel ? Colors.white : Colors.black87, fontWeight: FontWeight.bold),
                      onPressed: () {
                        setState(() => _diaryEntryIndex = idx);
                        _audio.playClick();
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Lined paper container
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFDF8),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFE8DFC8), width: 2),
              boxShadow: [
                BoxShadow(color: Colors.brown.withOpacity(0.08), blurRadius: 18, offset: const Offset(0, 6)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(entry['emotion'] as String, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                    Text(
                      entry['date'] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(color: Color(0xFFE8DFC8), thickness: 1.5),
                const SizedBox(height: 12),
                Text(
                  entry['body'] as String,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.7,
                    color: Color(0xFF2C3E50),
                    fontFamily: 'Outfit',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmotionsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: _emotions.length,
      itemBuilder: (context, idx) {
        final em = _emotions[idx];
        final isSel = _selectedEmotion == em['name'];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSel ? const Color(0xFF8E44AD).withOpacity(0.08) : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: isSel ? const Color(0xFF8E44AD) : Colors.black12, width: isSel ? 1.8 : 1.0),
          ),
          child: InkWell(
            onTap: () {
              setState(() => _selectedEmotion = em['name']!);
              _audio.playClick();
            },
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF8E44AD).withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.favorite_rounded, color: Color(0xFF8E44AD), size: 20),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(em['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF8E44AD))),
                      const SizedBox(height: 4),
                      Text('« ${em['french']} »', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: LangHueyColors.charcoal)),
                      Text(em['trans']!, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStructureTab() {
    final rules = [
      {'step': '1. LA DATE', 'desc': 'En haut à droite en toutes lettres (ex: Lundi 12 février 2026).'},
      {'step': '2. FORMULE D\'OUVERTURE', 'desc': 'Toujours commencer par « Cher journal, » ou « Mon cher journal, ».'},
      {'step': '3. LES ÉVÉNEMENTS (Passé Composé)', 'desc': 'Ce qui s\'est passé aujourd\'hui : « J\'ai gagné, nous avons visité... ».'},
      {'step': '4. L\'ATMOSPHÈRE (Imparfait)', 'desc': 'Le décor et les sentiments : « Il faisait beau, j\'étais très heureux... ».'},
      {'step': '5. FORMULE DE CLÔTURE', 'desc': 'Terminer par « À demain, » ou « Bonne nuit mon cher journal ! ».'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: rules.length,
      itemBuilder: (context, i) {
        final r = rules[i];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.black12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: const Color(0xFF8E44AD), borderRadius: BorderRadius.circular(8)),
                child: Text('${i + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(r['step']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF8E44AD))),
                    const SizedBox(height: 4),
                    Text(r['desc']!, style: const TextStyle(fontSize: 13, color: LangHueyColors.charcoal)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
