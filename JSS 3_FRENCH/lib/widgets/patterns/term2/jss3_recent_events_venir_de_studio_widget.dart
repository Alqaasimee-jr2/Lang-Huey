import 'package:flutter/material.dart';
import '../../../models/jss3_lesson_model.dart';
import '../../../services/jss3_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 2 (Term 2) — Rapporter un fait récent : le passé récent (venir de)
/// "Le Journal Télévisé" Newsroom Desk, Venir de Conjugation Lab, and Breaking News Flash Builder.
class JSS3RecentEventsVenirDeStudioWidget extends StatefulWidget {
  final JSS3LessonModel lesson;
  const JSS3RecentEventsVenirDeStudioWidget({super.key, required this.lesson});

  @override
  State<JSS3RecentEventsVenirDeStudioWidget> createState() =>
      _JSS3RecentEventsVenirDeStudioWidgetState();
}

class _JSS3RecentEventsVenirDeStudioWidgetState
    extends State<JSS3RecentEventsVenirDeStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS3AudioService _audio = JSS3AudioService();
  late TabController _tabController;

  // Conjugation state
  String _selectedSubject = 'Je';
  String _selectedVerb = 'arriver';

  static const Map<String, String> _venirForms = {
    'Je': 'viens',
    'Tu': 'viens',
    'Il / Elle': 'vient',
    'Nous': 'venons',
    'Vous': 'venez',
    'Ils / Elles': 'viennent',
  };

  static const List<Map<String, String>> _verbs = [
    {'inf': 'arriver', 'trans': 'to arrive', 'elide': 'true'},
    {'inf': 'gagner le match', 'trans': 'to win the match', 'elide': 'false'},
    {'inf': 'terminer les examens', 'trans': 'to finish the exams', 'elide': 'false'},
    {'inf': 'annoncer la nouvelle', 'trans': 'to announce the news', 'elide': 'true'},
    {'inf': 'partir en vacances', 'trans': 'to leave for holidays', 'elide': 'false'},
    {'inf': 'recevoir le trophée', 'trans': 'to receive the trophy', 'elide': 'false'},
  ];

  static const List<Map<String, String>> _newsHeadlines = [
    {
      'badge': 'SPORT',
      'headline': 'Les Super Eagles viennent de marquer un but magnifique !',
      'time': 'À l\'instant',
      'detail': 'Le capitaine nigérian vient de tirer dans la lucarne.',
    },
    {
      'badge': 'ÉDUCATION',
      'headline': 'Le proviseur vient de proclamer les résultats du brevet !',
      'time': 'Il y a 5 minutes',
      'detail': 'Tous les élèves de JSS 3 viennent de réussir avec distinction.',
    },
    {
      'badge': 'CULTURE',
      'headline': 'La troupe de théâtre vient de remporter le premier prix !',
      'time': 'Il y a 10 minutes',
      'detail': 'Leur pièce en français vient d\'émouvoir tout le public à Abuja.',
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
        // Top Banner
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFC0392B), Color(0xFFE74C3C)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.campaign_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Journal Télévisé : Le Passé Récent (Venir de + Infinitif)',
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
            labelColor: const Color(0xFFC0392B),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFFC0392B),
            tabs: const [
              Tab(icon: Icon(Icons.construction_rounded, size: 18), text: 'Générateur Venir de'),
              Tab(icon: Icon(Icons.live_tv_rounded, size: 18), text: 'Flash Info En Direct'),
              Tab(icon: Icon(Icons.table_chart_rounded, size: 18), text: 'Tableau de Conjugaison'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildGeneratorTab(),
              _buildNewsroomTab(),
              _buildConjugationTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGeneratorTab() {
    final venir = _venirForms[_selectedSubject]!;
    final verbObj = _verbs.firstWhere((v) => v['inf'] == _selectedVerb);
    final isElided = verbObj['elide'] == 'true';
    final prep = isElided ? "d'" : "de ";
    final fullSentence = '$_selectedSubject $venir $prep$_selectedVerb.';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('1. Choisissez le Sujet :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _venirForms.keys.map((subj) {
                final isSel = _selectedSubject == subj;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(subj),
                    selected: isSel,
                    selectedColor: const Color(0xFFC0392B).withOpacity(0.2),
                    side: BorderSide(color: isSel ? const Color(0xFFC0392B) : Colors.black12),
                    onSelected: (val) {
                      if (val) {
                        setState(() => _selectedSubject = subj);
                        _audio.playClick();
                      }
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),

          Text('2. Choisissez l\'Action Récente (Infinitif) :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _verbs.map((v) {
              final isSel = _selectedVerb == v['inf'];
              return FilterChip(
                label: Text('${v['inf']} (${v['trans']})'),
                selected: isSel,
                selectedColor: Colors.amber.shade100,
                side: BorderSide(color: isSel ? Colors.amber.shade800 : Colors.black12),
                onSelected: (val) {
                  if (val) {
                    setState(() => _selectedVerb = v['inf']!);
                    _audio.playClick();
                  }
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2C3E50), Color(0xFF1A252F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 16, offset: const Offset(0, 6)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.flash_on_rounded, color: Colors.amber, size: 24),
                    const SizedBox(width: 8),
                    Text('FORMULE DU PASSÉ RÉCENT', style: TextStyle(color: Colors.amber.shade300, fontWeight: FontWeight.bold, letterSpacing: 1.2, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  fullSentence,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    isElided ? "Règle : 'de' devient 'd\'' devant une voyelle." : "Règle : VENIR au présent + DE + Infinitif.",
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsroomTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: _newsHeadlines.length,
      itemBuilder: (context, i) {
        final item = _newsHeadlines[i];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFC0392B).withOpacity(0.3)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
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
                      color: const Color(0xFFC0392B),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(item['badge']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time_rounded, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(item['time']!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(item['headline']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: LangHueyColors.charcoal)),
              const SizedBox(height: 8),
              Text(item['detail']!, style: TextStyle(fontSize: 13, color: Colors.grey.shade700)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildConjugationTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Conjugaison Complète de VENIR au Présent :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 14),
          Table(
            border: TableBorder.all(color: Colors.black12, borderRadius: BorderRadius.circular(12)),
            columnWidths: const {
              0: FlexColumnWidth(1.2),
              1: FlexColumnWidth(1.5),
              2: FlexColumnWidth(2.5),
            },
            children: const [
              TableRow(
                decoration: BoxDecoration(color: Color(0xFFC0392B)),
                children: [
                  Padding(padding: EdgeInsets.all(10), child: Text('Pronom', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  Padding(padding: EdgeInsets.all(10), child: Text('VENIR', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  Padding(padding: EdgeInsets.all(10), child: Text('Exemple Passé Récent', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                ],
              ),
              TableRow(
                children: [
                  Padding(padding: EdgeInsets.all(10), child: Text('Je')),
                  Padding(padding: EdgeInsets.all(10), child: Text('viens', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFC0392B)))),
                  Padding(padding: EdgeInsets.all(10), child: Text('Je viens de manger.')),
                ],
              ),
              TableRow(
                decoration: BoxDecoration(color: Color(0xFFFDF2F0)),
                children: [
                  Padding(padding: EdgeInsets.all(10), child: Text('Tu')),
                  Padding(padding: EdgeInsets.all(10), child: Text('viens', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFC0392B)))),
                  Padding(padding: EdgeInsets.all(10), child: Text('Tu viens de sortir.')),
                ],
              ),
              TableRow(
                children: [
                  Padding(padding: EdgeInsets.all(10), child: Text('Il / Elle / On')),
                  Padding(padding: EdgeInsets.all(10), child: Text('vient', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFC0392B)))),
                  Padding(padding: EdgeInsets.all(10), child: Text('Elle vient d\'arriver.')),
                ],
              ),
              TableRow(
                decoration: BoxDecoration(color: Color(0xFFFDF2F0)),
                children: [
                  Padding(padding: EdgeInsets.all(10), child: Text('Nous')),
                  Padding(padding: EdgeInsets.all(10), child: Text('venons', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFC0392B)))),
                  Padding(padding: EdgeInsets.all(10), child: Text('Nous venons de finir.')),
                ],
              ),
              TableRow(
                children: [
                  Padding(padding: EdgeInsets.all(10), child: Text('Vous')),
                  Padding(padding: EdgeInsets.all(10), child: Text('venez', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFC0392B)))),
                  Padding(padding: EdgeInsets.all(10), child: Text('Vous venez d\'entendre.')),
                ],
              ),
              TableRow(
                decoration: BoxDecoration(color: Color(0xFFFDF2F0)),
                children: [
                  Padding(padding: EdgeInsets.all(10), child: Text('Ils / Elles')),
                  Padding(padding: EdgeInsets.all(10), child: Text('viennent', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFC0392B)))),
                  Padding(padding: EdgeInsets.all(10), child: Text('Ils viennent de gagner.')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
