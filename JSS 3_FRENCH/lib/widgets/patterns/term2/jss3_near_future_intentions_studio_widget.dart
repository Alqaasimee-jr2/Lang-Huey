import 'package:flutter/material.dart';
import '../../../models/jss3_lesson_model.dart';
import '../../../services/jss3_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 4 (Term 2) — Dire ce que l’on va faire : le futur proche et les intentions
/// 48-Hour Weekend Planner, Aller + Infinitif Conjugation Lab, and Negation Workbench.
class JSS3NearFutureIntentionsStudioWidget extends StatefulWidget {
  final JSS3LessonModel lesson;
  const JSS3NearFutureIntentionsStudioWidget({super.key, required this.lesson});

  @override
  State<JSS3NearFutureIntentionsStudioWidget> createState() =>
      _JSS3NearFutureIntentionsStudioWidgetState();
}

class _JSS3NearFutureIntentionsStudioWidgetState
    extends State<JSS3NearFutureIntentionsStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS3AudioService _audio = JSS3AudioService();
  late TabController _tabController;

  String _selectedPronoun = 'Je';
  String _selectedVerb = 'étudier pour le BECE';
  bool _isNegative = false;

  static const Map<String, String> _allerForms = {
    'Je': 'vais',
    'Tu': 'vas',
    'Il / Elle': 'va',
    'Nous': 'allons',
    'Vous': 'allez',
    'Ils / Elles': 'vont',
  };

  static const List<Map<String, dynamic>> _plannerActivities = [
    {
      'slot': 'Samedi Matin',
      'icon': Icons.wb_sunny_rounded,
      'french': 'Je vais me réveiller à 7h et réviser le français.',
      'color': Color(0xFFF39C12),
    },
    {
      'slot': 'Samedi Après-midi',
      'icon': Icons.sports_soccer_rounded,
      'french': 'Nous allons jouer au football au stade.',
      'color': Color(0xFF27AE60),
    },
    {
      'slot': 'Dimanche Matin',
      'icon': Icons.church_rounded,
      'french': 'Ma famille et moi allons assister au culte.',
      'color': Color(0xFF2980B9),
    },
    {
      'slot': 'Dimanche Soir',
      'icon': Icons.menu_book_rounded,
      'french': 'Je vais préparer mon sac pour la nouvelle semaine.',
      'color': Color(0xFF8E44AD),
    },
  ];

  static const List<String> _actions = [
    'étudier pour le BECE',
    'voyager à Lagos',
    'regarder un match',
    'aider mes parents',
    'écrire une lettre',
    'faire les courses',
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
              colors: [Color(0xFF2980B9), Color(0xFF3498DB)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.schedule_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Studio : Le Futur Proche (ALLER + Infinitif) & Emploi du Temps',
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
            labelColor: const Color(0xFF2980B9),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFF2980B9),
            tabs: const [
              Tab(icon: Icon(Icons.build_rounded, size: 18), text: 'Constructeur de Phrases'),
              Tab(icon: Icon(Icons.calendar_month_rounded, size: 18), text: 'Emploi du Temps 48h'),
              Tab(icon: Icon(Icons.block_rounded, size: 18), text: 'Formule Négative'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildBuilderTab(),
              _buildPlannerTab(),
              _buildNegationTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBuilderTab() {
    final aller = _allerForms[_selectedPronoun]!;
    final sentence = _isNegative
        ? '$_selectedPronoun ne $aller pas $_selectedVerb.'
        : '$_selectedPronoun $aller $_selectedVerb.';

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
              children: _allerForms.keys.map((p) {
                final isSel = _selectedPronoun == p;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(p),
                    selected: isSel,
                    selectedColor: const Color(0xFF2980B9).withOpacity(0.2),
                    side: BorderSide(color: isSel ? const Color(0xFF2980B9) : Colors.black12),
                    onSelected: (val) {
                      if (val) {
                        setState(() => _selectedPronoun = p);
                        _audio.playClick();
                      }
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),

          Text('2. Choisissez l\'Activité (Infinitif) :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _actions.map((act) {
              final isSel = _selectedVerb == act;
              return FilterChip(
                label: Text(act),
                selected: isSel,
                selectedColor: Colors.amber.shade100,
                side: BorderSide(color: isSel ? Colors.amber.shade800 : Colors.black12),
                onSelected: (val) {
                  if (val) {
                    setState(() => _selectedVerb = act);
                    _audio.playClick();
                  }
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Switch(
                value: _isNegative,
                activeColor: const Color(0xFFE74C3C),
                onChanged: (val) {
                  setState(() => _isNegative = val);
                  _audio.playClick();
                },
              ),
              const SizedBox(width: 8),
              Text(_isNegative ? 'Mode Négatif (Ne... pas)' : 'Mode Affirmatif', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: _isNegative ? [const Color(0xFFC0392B), const Color(0xFF962D22)] : [const Color(0xFF2980B9), const Color(0xFF1F618D)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 16, offset: const Offset(0, 6)),
              ],
            ),
            child: Column(
              children: [
                Text(
                  _isNegative ? 'PHRASE AU FUTUR PROCHE NÉGATIF' : 'PHRASE AU FUTUR PROCHE AFFIRMATIF',
                  style: TextStyle(color: Colors.amber.shade300, fontWeight: FontWeight.bold, letterSpacing: 1.2, fontSize: 11),
                ),
                const SizedBox(height: 14),
                Text(
                  sentence,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  _isNegative
                      ? 'Règle : "ne" se place avant ALLER et "pas" après ALLER.'
                      : 'Règle : Sujet + ALLER au présent + Infinitif.',
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlannerTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: _plannerActivities.length,
      itemBuilder: (context, i) {
        final item = _plannerActivities[i];
        final color = item['color'] as Color;
        return Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.4), width: 1.5),
            boxShadow: [
              BoxShadow(color: color.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 4)),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: color.withOpacity(0.15), shape: BoxShape.circle),
                child: Icon(item['icon'] as IconData, color: color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['slot'] as String, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13)),
                    const SizedBox(height: 4),
                    Text('« ${item['french']} »', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: LangHueyColors.charcoal)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNegationTab() {
    final examples = [
      {'aff': 'Je vais sortir.', 'neg': 'Je ne vais pas sortir.'},
      {'aff': 'Tu vas dormir.', 'neg': 'Tu ne vas pas dormir.'},
      {'aff': 'Elle va regarder la télé.', 'neg': 'Elle ne va pas regarder la télé.'},
      {'aff': 'Nous allons abandonner.', 'neg': 'Nous n\'allons pas abandonner !'},
      {'aff': 'Vous allez arriver en retard.', 'neg': 'Vous n\'allez pas arriver en retard.'},
      {'aff': 'Ils vont perdre.', 'neg': 'Ils ne vont pas perdre.'},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('La Règle de Négation au Futur Proche :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.red.shade200),
            ),
            child: const Text(
              '⚠️ ATTENTION : La négation « NE... PAS » encadre UNIQUEMENT le verbe auxiliaire ALLER, JAMAIS l\'infinitif !\nExemple : Je NE vais PAS parler. (Et NON : Je vais ne pas parler)',
              style: TextStyle(fontSize: 13, height: 1.5, fontWeight: FontWeight.bold, color: Color(0xFFC0392B)),
            ),
          ),
          const SizedBox(height: 16),
          ...examples.map((ex) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text('🟢 ${ex['aff']!}', style: const TextStyle(fontSize: 13, color: Colors.green, fontWeight: FontWeight.bold)),
                  ),
                  const Icon(Icons.arrow_forward_rounded, size: 16, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text('🔴 ${ex['neg']!}', style: const TextStyle(fontSize: 13, color: Color(0xFFC0392B), fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
