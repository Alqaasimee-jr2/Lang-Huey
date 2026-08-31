import 'package:flutter/material.dart';
import '../../../models/jss3_lesson_model.dart';
import '../../../services/jss3_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 6 (Term 2) — Consolidation orale et écrite : jeux de rôles et dialogues
/// 4-Station Roleplay Theatre, 4-Tense Synthesis Matrix, and Error Correction Studio.
class JSS3Term2ConsolidationStudioWidget extends StatefulWidget {
  final JSS3LessonModel lesson;
  const JSS3Term2ConsolidationStudioWidget({super.key, required this.lesson});

  @override
  State<JSS3Term2ConsolidationStudioWidget> createState() =>
      _JSS3Term2ConsolidationStudioWidgetState();
}

class _JSS3Term2ConsolidationStudioWidgetState
    extends State<JSS3Term2ConsolidationStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS3AudioService _audio = JSS3AudioService();
  late TabController _tabController;

  int _selectedStationIndex = 0;

  static const List<Map<String, dynamic>> _stations = [
    {
      'name': 'Station 1 : Le Flash Infos TV 📺',
      'role': 'Journaliste & Champion Sportif',
      'tense': 'Passé Récent (Venir de) & Passé Composé',
      'script': [
        'Journaliste : Bonjour à tous ! Notre invité vient de remporter la médaille d\'or.',
        'Champion : Merci ! Quand la course a commencé, j\'étais très concentré.',
        'Journaliste : Que ferez-vous après cette victoire ?',
        'Champion : Je vais célébrer avec ma famille et continuer à m\'entraîner.',
      ],
      'color': Color(0xFFC0392B),
    },
    {
      'name': 'Station 2 : Confidences du Journal Intime 📖',
      'role': 'Deux Ami(e)s en Pause Déjeuner',
      'tense': 'Imparfait (Sentiments) & Passé Composé',
      'script': [
        'Amina : Hier soir, j\'ai écrit dans mon journal intime.',
        'Kofi : Vraiment ? Qu\'est-ce qui s\'est passé ?',
        'Amina : J\'étais très inquiète pour l\'évaluation, mais j\'ai eu une excellente note !',
        'Kofi : Félicitations ! Tu mérites ce succès.',
      ],
      'color': Color(0xFF8E44AD),
    },
    {
      'name': 'Station 3 : Débat sur les Métiers du Futur 🚀',
      'role': 'Deux Futurs Professionnels',
      'tense': 'Futur Simple & Hypothèses avec SI',
      'script': [
        'Chidi : Quand tu seras grand, quel métier feras-tu ?',
        'Zainab : Je serai ingénieure en énergie solaire pour éclairer nos villages.',
        'Chidi : C\'est formidable ! Si nous étudions dur, nous réussirons tous les deux.',
        'Zainab : Exactement, l\'avenir appartient à ceux qui travaillent !',
      ],
      'color': Color(0xFF16A085),
    },
  ];

  static const List<Map<String, String>> _correctionTasks = [
    {
      'faulty': 'Hier, nous venons à arriver à Lagos.',
      'corrected': 'Hier, nous sommes arrivés à Lagos (ou "Nous venons d\'arriver").',
      'rule': 'Passé Récent takes "de/d\'" not "à", and refers to immediate past.',
    },
    {
      'faulty': 'Demain, je serais en classe de SS1.',
      'corrected': 'Demain, je serai en classe de SS1.',
      'rule': 'Futur Simple ending for "Je" is "-ai" (serai), not "-ais" (conditional).',
    },
    {
      'faulty': 'Pendant que je mange, le téléphone a sonné.',
      'corrected': 'Pendant que je mangeais, le téléphone a sonné.',
      'rule': 'Ongoing action in past takes Imparfait (mangeais).',
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
              colors: [Color(0xFF34495E), Color(0xFF2C3E50)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.theater_comedy_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Théâtre de Consolidation : Jeux de Rôles & Ateliers Pratiques',
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
            labelColor: const Color(0xFF2C3E50),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFF2C3E50),
            tabs: const [
              Tab(icon: Icon(Icons.forum_rounded, size: 18), text: 'Jeux de Rôles'),
              Tab(icon: Icon(Icons.grid_view_rounded, size: 18), text: 'Matrice des 4 Temps'),
              Tab(icon: Icon(Icons.spellcheck_rounded, size: 18), text: 'Atelier Correction'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildRoleplayTab(),
              _buildMatrixTab(),
              _buildCorrectionTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRoleplayTab() {
    final station = _stations[_selectedStationIndex];
    final color = station['color'] as Color;
    final script = station['script'] as List<String>;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_stations.length, (idx) {
                final st = _stations[idx];
                final isSel = _selectedStationIndex == idx;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(st['name'] as String),
                    selected: isSel,
                    selectedColor: (st['color'] as Color).withOpacity(0.2),
                    side: BorderSide(color: isSel ? st['color'] as Color : Colors.black12),
                    onSelected: (val) {
                      if (val) {
                        setState(() => _selectedStationIndex = idx);
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
              border: Border.all(color: color.withOpacity(0.4), width: 2),
              boxShadow: [
                BoxShadow(color: color.withOpacity(0.08), blurRadius: 16, offset: const Offset(0, 6)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(station['role'] as String, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(8)),
                      child: Text(station['tense'] as String, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 11)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 12),
                ...script.map((line) {
                  final isEven = script.indexOf(line) % 2 == 0;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isEven ? Colors.grey.shade50 : color.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: isEven ? Colors.black12 : color.withOpacity(0.2)),
                    ),
                    child: Text(
                      line,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isEven ? LangHueyColors.charcoal : color,
                        height: 1.4,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMatrixTab() {
    final matrix = [
      {'tense': '1. Passé Récent', 'formula': 'VENIR (présent) + DE + Infinitif', 'use': 'Action tout juste achevée', 'ex': 'Je viens de finir.'},
      {'tense': '2. Passé Composé', 'formula': 'Avoir/Être (présent) + Participe passé', 'use': 'Action ponctuelle terminée', 'ex': 'J\'ai mangé / Je suis venu.'},
      {'tense': '3. Imparfait', 'formula': 'Radical de nous + -ais, -ais, -ait...', 'use': 'Description / Habitude passée', 'ex': 'Il faisait beau, j\'avais faim.'},
      {'tense': '4. Futur Proche', 'formula': 'ALLER (présent) + Infinitif', 'use': 'Intention immédiate certaine', 'ex': 'Je vais réviser ce soir.'},
      {'tense': '5. Futur Simple', 'formula': 'Infinitif + -ai, -as, -a, -ons, -ez, -ont', 'use': 'Projet d\'avenir / Hypothèse', 'ex': 'Je serai grand médecin.'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: matrix.length,
      itemBuilder: (context, i) {
        final row = matrix[i];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.black12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(row['tense']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF2C3E50))),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(color: Colors.blueGrey.shade50, borderRadius: BorderRadius.circular(6)),
                    child: Text(row['use']!, style: TextStyle(fontSize: 11, color: Colors.blueGrey.shade800)),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text('Formule : ${row['formula']!}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: LangHueyColors.deepTeal)),
              const SizedBox(height: 4),
              Text('Exemple : « ${row['ex']!} »', style: const TextStyle(fontSize: 13, fontStyle: FontStyle.italic, color: LangHueyColors.charcoal)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCorrectionTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: _correctionTasks.length,
      itemBuilder: (context, i) {
        final task = _correctionTasks[i];
        return Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.black12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.cancel_rounded, color: Colors.red, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text('Phrase Fautive : « ${task['faulty']!} »', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.red)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.check_circle_rounded, color: Colors.green, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text('Correction : « ${task['corrected']!} »', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.green)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.amber.shade50, borderRadius: BorderRadius.circular(8)),
                child: Text('💡 Règle : ${task['rule']!}', style: TextStyle(fontSize: 11, color: Colors.brown.shade900)),
              ),
            ],
          ),
        );
      },
    );
  }
}
