import 'package:flutter/material.dart';
import '../../../models/jss3_lesson_model.dart';
import '../../../services/jss3_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 8 (Term 2) — Préparation intensive au BECE — Partie II : Vocabulaire, Compréhension & Rédaction
/// BECE Reading Comprehension Reader, 3-Tier Essay Constructor, and Examiner Rubrics.
class JSS3BECEVocabEssayPrepStudioWidget extends StatefulWidget {
  final JSS3LessonModel lesson;
  const JSS3BECEVocabEssayPrepStudioWidget({super.key, required this.lesson});

  @override
  State<JSS3BECEVocabEssayPrepStudioWidget> createState() =>
      _JSS3BECEVocabEssayPrepStudioWidgetState();
}

class _JSS3BECEVocabEssayPrepStudioWidgetState
    extends State<JSS3BECEVocabEssayPrepStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS3AudioService _audio = JSS3AudioService();
  late TabController _tabController;

  int _selectedTopicIndex = 0;

  static const List<Map<String, dynamic>> _essayPrompts = [
    {
      'title': 'Sujet 1 : Une Fête Traditionnelle Mémorable 🎉',
      'intro': 'Les fêtes traditionnelles sont au cœur de notre culture en Afrique. L\'année dernière, j\'ai assisté au grand festival d\'Argungu.',
      'body': 'Tout d\'abord, des milliers de pêcheurs se sont rassemblés au bord du fleuve. Ensuite, au signal du chef, tout le monde s\'est élancé dans l\'eau avec des filets géants. Tout à coup, un pêcheur courageux a capturé un poisson colossal sous les acclamations du public.',
      'conclusion': 'Enfin, nous avons savouré un délicieux festin. C\'était une expérience magnifique et inoubliable pour toute ma famille !',
      'connectors': 'Tout d\'abord, Ensuite, Tout à coup, Enfin',
    },
    {
      'title': 'Sujet 2 : Mes Projets d\'Avenir et Mon Métier de Rêve 🚀',
      'intro': 'Chaque élève nourrit de grands rêves pour son avenir. Quand je serai grand(e), je serai médecin spécialiste.',
      'body': 'D\'abord, après le BECE, j\'irai au lycée pour étudier les sciences. Ensuite, je ferai de longues études de médecine à l\'université d\'Ibadan. Je construirai une clinique moderne dans ma région pour soigner gratuitement les enfants malades.',
      'conclusion': 'Pour conclure, si je travaille avec rigueur et détermination, je réaliserai tous mes projets d\'avenir avec la bénédiction de Dieu.',
      'connectors': 'D\'abord, Ensuite, Pour conclure, Si + futur',
    },
  ];

  static const List<Map<String, String>> _markingPillars = [
    {
      'pillar': '1. Respect de la Consigne & Contenu (5 pts)',
      'desc': 'Traiter le sujet avec des idées claires, adaptées et respectant la longueur (80–100 mots).',
    },
    {
      'pillar': '2. Correction Grammaticale & Conjugaison (5 pts)',
      'desc': 'Maîtrise des temps (PC, Imparfait, Futur), accords sujet-verbe et accords d\'adjectifs.',
    },
    {
      'pillar': '3. Richesse du Vocabulaire & Orthographe (5 pts)',
      'desc': 'Emploi de vocabulaire précis, respect des accents (é, è, ê, à, ç) et ponctuation.',
    },
    {
      'pillar': '4. Organisation, Cohérence & Connecteurs (5 pts)',
      'desc': 'Structure claire en 3 paragraphes avec connecteurs logiques (D\'abord, Ensuite, Enfin).',
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0E6655), Color(0xFF117A65)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.edit_note_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Atelier BECE Partie II : Compréhension de Texte & Rédaction Guidée',
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
            labelColor: const Color(0xFF0E6655),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFF0E6655),
            tabs: const [
              Tab(icon: Icon(Icons.menu_book_rounded, size: 18), text: 'Compréhension Écrite'),
              Tab(icon: Icon(Icons.view_quilt_rounded, size: 18), text: 'Modèles de Rédaction'),
              Tab(icon: Icon(Icons.grading_rounded, size: 18), text: 'Barème Officiel BECE'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildComprehensionTab(),
              _buildEssayModelsTab(),
              _buildRubricsTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildComprehensionTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FBFB),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFF0E6655).withOpacity(0.3), width: 1.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    'assets/images/jss3_term2/jss3_t2w8_abuja_excursion.jpg',
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const SizedBox(),
                  ),
                ),
                const SizedBox(height: 14),
                const Row(
                  children: [
                    Icon(Icons.article_rounded, color: Color(0xFF0E6655)),
                    SizedBox(width: 8),
                    Text('Texte d\'Examen : Une Journée Spéciale à Abuja', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF0E6655))),
                  ],
                ),
                SizedBox(height: 12),
                Divider(),
                SizedBox(height: 10),
                Text(
                  'Samedi dernier, les élèves de la classe de JSS 3 du Collège Saint-Joseph ont fait une grande excursion éducative à Abuja, la capitale du Nigeria. Le matin, ils ont pris un grand bus confortable.\n\nPendant le voyage, les élèves chantaient des chansons en français avec leur professeur. Vers dix heures, ils sont arrivés devant le majestueux rocher de Zuma Rock. Tout le monde a pris de belles photos. Ensuite, ils ont visité le Centre Culturel National où ils ont découvert des sculptures traditionnelles et des œuvres d\'art.\n\nÀ la fin de la journée, le proviseur a félicité tous les élèves pour leur discipline exemplaire. C\'était une aventure inoubliable !',
                  style: TextStyle(fontSize: 14, height: 1.7, color: LangHueyColors.charcoal),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          Text('Questions de Compréhension BECE :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 12),
          _buildQuestionCard('1. Où les élèves sont-ils allés en excursion ?', 'Réponse : À Abuja, la capitale du Nigeria.'),
          _buildQuestionCard('2. Que faisaient les élèves pendant le voyage en bus ?', 'Réponse : Ils chantaient des chansons en français avec leur professeur.'),
          _buildQuestionCard('3. Quel monument naturel ont-ils admiré à dix heures ?', 'Réponse : Le majestueux rocher de Zuma Rock.'),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(String q, String a) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(q, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF0E6655))),
          const SizedBox(height: 4),
          Text(a, style: const TextStyle(fontSize: 13, color: LangHueyColors.charcoal, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }

  Widget _buildEssayModelsTab() {
    final essay = _essayPrompts[_selectedTopicIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_essayPrompts.length, (i) {
                final isSel = _selectedTopicIndex == i;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(_essayPrompts[i]['title'] as String),
                    selected: isSel,
                    selectedColor: const Color(0xFF0E6655).withOpacity(0.2),
                    side: BorderSide(color: isSel ? const Color(0xFF0E6655) : Colors.black12),
                    onSelected: (val) {
                      if (val) {
                        setState(() => _selectedTopicIndex = i);
                        _audio.playClick();
                      }
                    },
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 18),

          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF0E6655).withOpacity(0.4), width: 1.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(essay['title'] as String, style: LangHueyTextStyles.h2.copyWith(fontSize: 16, color: const Color(0xFF0E6655))),
                const SizedBox(height: 14),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('1. INTRODUCTION :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.blue)),
                      const SizedBox(height: 4),
                      Text(essay['intro'] as String, style: const TextStyle(fontSize: 13, color: LangHueyColors.charcoal, height: 1.4)),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.amber.shade50, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('2. DÉVELOPPEMENT (Corps du devoir) :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.brown)),
                      const SizedBox(height: 4),
                      Text(essay['body'] as String, style: const TextStyle(fontSize: 13, color: LangHueyColors.charcoal, height: 1.4)),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('3. CONCLUSION :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.green)),
                      const SizedBox(height: 4),
                      Text(essay['conclusion'] as String, style: const TextStyle(fontSize: 13, color: LangHueyColors.charcoal, height: 1.4)),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Text('🔗 Connecteurs utilisés : ${essay['connectors']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF0E6655))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRubricsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: _markingPillars.length,
      itemBuilder: (context, idx) {
        final p = _markingPillars[idx];
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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: const Color(0xFF0E6655).withOpacity(0.15), shape: BoxShape.circle),
                child: const Icon(Icons.check_rounded, color: Color(0xFF0E6655), size: 20),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(p['pillar']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0E6655))),
                    const SizedBox(height: 4),
                    Text(p['desc']!, style: const TextStyle(fontSize: 12, color: LangHueyColors.charcoal, height: 1.4)),
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
