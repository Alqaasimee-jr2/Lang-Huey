import 'package:flutter/material.dart';
import '../../../models/jss3_lesson_model.dart';
import '../../../services/jss3_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 7 — Dater et mesurer le temps
/// Temporal Radar: Calendar Dates, Timeline of African Independence,
/// Prepositions of Duration (DEPUIS, PENDANT, IL Y A, DANS), and Interactive Time Drills.
class JSS3DatingTimeMeasurementStudioWidget extends StatefulWidget {
  final JSS3LessonModel lesson;
  const JSS3DatingTimeMeasurementStudioWidget({super.key, required this.lesson});

  @override
  State<JSS3DatingTimeMeasurementStudioWidget> createState() =>
      _JSS3DatingTimeMeasurementStudioWidgetState();
}

class _JSS3DatingTimeMeasurementStudioWidgetState
    extends State<JSS3DatingTimeMeasurementStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS3AudioService _audio = JSS3AudioService();
  late TabController _tabController;

  // Selected historic date
  int _selectedDateIndex = 0;

  // Temporal Drill state
  int _drillIndex = 0;
  int _drillScore = 0;
  bool _drillAnswered = false;
  int? _drillSelected;

  static const List<Map<String, dynamic>> _historyTimeline = [
    {
      'year': '1960',
      'date': 'Le 1er octobre 1960',
      'event': 'Indépendance du Nigeria',
      'emoji': '🇳🇬',
      'desc': 'Le Nigeria est devenu une nation souveraine et indépendante.',
      'formula': 'Le Nigeria a obtenu son indépendance le premier octobre mil neuf cent soixante.',
    },
    {
      'year': '1960',
      'date': 'Le 1er août 1960',
      'event': 'Indépendance de la République du Bénin',
      'emoji': '🇧🇯',
      'desc': 'Le pays voisin du Nigeria fête son indépendance.',
      'formula': 'La République du Bénin a fêté son indépendance le premier août 1960.',
    },
    {
      'year': '1975',
      'date': 'Le 28 mai 1975',
      'event': 'Création de la CEDEAO (ECOWAS à Lagos)',
      'emoji': '🤝',
      'desc': 'Signature du traité fondant la Communauté Économique des États de l\'Afrique de l\'Ouest.',
      'formula': 'Le traité de la CEDEAO a été signé à Lagos le vingt-huit mai 1975.',
    },
    {
      'year': '2000',
      'date': 'Le 1er janvier 2000',
      'event': 'Entrée dans le XXIe (21e) Siècle',
      'emoji': '✨',
      'desc': 'Le passage officiel au troisième millénaire et au 21e siècle.',
      'formula': 'Nous sommes entrés dans le vingt-et-unième siècle le premier janvier 2000.',
    },
  ];

  static const List<Map<String, dynamic>> _temporalDrills = [
    {
      'prompt': '« J\'apprends le français ___ trois ans (et je continue aujourd\'hui). »',
      'options': ['il y a', 'pendant', 'depuis', 'dans'],
      'correct': 2,
      'explanation': 'Use DEPUIS + Present for an ongoing action that started in the past and continues now.',
    },
    {
      'prompt': '« Le train pour Kano est parti ___ quinze minutes. » (moment passé)',
      'options': ['dans', 'il y a', 'depuis', 'pendant'],
      'correct': 1,
      'explanation': 'Use IL Y A + duration to mean "ago" in the past.',
    },
    {
      'prompt': '« Les vacances de fin d\'année commenceront ___ deux semaines. » (futur)',
      'options': ['dans', 'depuis', 'pendant', 'il y a'],
      'correct': 0,
      'explanation': 'Use DANS + duration to indicate a future point in time ("in two weeks").',
    },
    {
      'prompt': '« J\'ai dormi ___ huit heures cette nuit. » (durée complète et terminée)',
      'options': ['depuis', 'pendant', 'il y a', 'dans'],
      'correct': 1,
      'explanation': 'Use PENDANT for a completed duration in the past.',
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
        // Header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF16A085), Color(0xFF2C3E50)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.timelapse_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Radar Temporel & Mesure de la Durée',
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
            labelColor: const Color(0xFF16A085),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFF16A085),
            tabs: const [
              Tab(icon: Icon(Icons.event_note_rounded, size: 18), text: 'Dates Historiques'),
              Tab(icon: Icon(Icons.compare_arrows_rounded, size: 18), text: 'Depuis / Pendant / Il y a'),
              Tab(icon: Icon(Icons.fitness_center_rounded, size: 18), text: 'Entraînement BECE'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildTimelineTab(),
              _buildPrepositionsTab(),
              _buildDrillTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineTab() {
    final item = _historyTimeline[_selectedDateIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_historyTimeline.length, (index) {
                final h = _historyTimeline[index];
                final isSelected = _selectedDateIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    avatar: Text(h['emoji'] as String),
                    label: Text('${h['year']} • ${h['event']}'),
                    selected: isSelected,
                    selectedColor: Colors.teal.shade100,
                    side: BorderSide(color: isSelected ? const Color(0xFF16A085) : Colors.black12),
                    onSelected: (val) {
                      if (val) {
                        setState(() => _selectedDateIndex = index);
                        _audio.playClick();
                      }
                    },
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF16A085).withOpacity(0.4), width: 1.5),
              boxShadow: [
                BoxShadow(color: const Color(0xFF16A085).withOpacity(0.08), blurRadius: 16, offset: const Offset(0, 6)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(item['emoji'] as String, style: const TextStyle(fontSize: 40)),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['date'] as String, style: LangHueyTextStyles.h2.copyWith(fontSize: 18, color: const Color(0xFF16A085))),
                          Text(item['event'] as String, style: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(item['desc'] as String, style: const TextStyle(fontSize: 14, height: 1.4)),
                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF16A085).withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.record_voice_over_rounded, color: Color(0xFF16A085), size: 22),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '« ${item['formula']} »',
                          style: const TextStyle(color: Color(0xFF16A085), fontWeight: FontWeight.bold, fontSize: 13, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrepositionsTab() {
    final prepositions = [
      {
        'prep': 'DEPUIS (+ Présent)',
        'meaning': 'Since / For (action ongoing right now)',
        'color': const Color(0xFF27AE60),
        'ex': 'J\'habite à Abuja DEPUIS 2020. (I have lived in Abuja since 2020 and still live there).',
      },
      {
        'prep': 'PENDANT (+ Passé / Futur)',
        'meaning': 'During / For (completed, finished duration)',
        'color': const Color(0xFF2980B9),
        'ex': 'J\'ai révisé PENDANT deux heures hier soir. (I studied for 2 hours - finished).',
      },
      {
        'prep': 'IL Y A (+ Passé)',
        'meaning': 'Ago (specific point in the past)',
        'color': const Color(0xFF8E44AD),
        'ex': 'Le professeur est entré IL Y A cinq minutes. (The teacher entered 5 mins ago).',
      },
      {
        'prep': 'DANS (+ Futur)',
        'meaning': 'In (time remaining until a future event)',
        'color': const Color(0xFFD35400),
        'ex': 'L\'examen commencera DANS vingt minutes. (The exam starts in 20 mins).',
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...prepositions.map((p) {
            final color = p['color'] as Color;
            return Container(
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(p['prep'] as String, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
                      Icon(Icons.timer_rounded, color: color, size: 20),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(p['meaning'] as String, style: TextStyle(color: Colors.grey.shade700, fontSize: 13)),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('Ex : ${p['ex']}', style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDrillTab() {
    final drill = _temporalDrills[_drillIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: LangHueyColors.charcoal,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Entraînement Temporel (#${_drillIndex + 1} / ${_temporalDrills.length})', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('Score: $_drillScore pts', style: const TextStyle(color: LangHueyColors.amberGold, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.black12),
            ),
            child: Text(
              drill['prompt'] as String,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, height: 1.4),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),

          ...List.generate((drill['options'] as List<String>).length, (i) {
            final opt = (drill['options'] as List<String>)[i];
            final isCorrect = i == drill['correct'];
            Color btnColor = Colors.white;
            Color textColor = LangHueyColors.charcoal;

            if (_drillAnswered) {
              if (isCorrect) {
                btnColor = const Color(0xFF2ECC71);
                textColor = Colors.white;
              } else if (_drillSelected == i) {
                btnColor = const Color(0xFFE74C3C);
                textColor = Colors.white;
              }
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: !_drillAnswered
                    ? () {
                        setState(() {
                          _drillAnswered = true;
                          _drillSelected = i;
                          if (isCorrect) {
                            _drillScore += 10;
                            _audio.playCorrect();
                          } else {
                            _audio.playIncorrect();
                          }
                        });
                      }
                    : null,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: btnColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: _drillAnswered && (isCorrect || _drillSelected == i) ? Colors.transparent : Colors.black12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(opt, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 15)),
                      if (_drillAnswered && isCorrect)
                        const Icon(Icons.check_circle_rounded, color: Colors.white)
                      else if (_drillAnswered && _drillSelected == i)
                        const Icon(Icons.cancel_rounded, color: Colors.white),
                    ],
                  ),
                ),
              ),
            );
          }),

          if (_drillAnswered) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.teal.shade300),
              ),
              child: Text('💡 ${drill['explanation']}', style: TextStyle(color: Colors.teal.shade900, fontSize: 13)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _drillIndex = (_drillIndex + 1) % _temporalDrills.length;
                  _drillAnswered = false;
                  _drillSelected = null;
                });
                _audio.playClick();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF16A085),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(_drillIndex + 1 < _temporalDrills.length ? 'Question Suivante' : 'Recommencer'),
            ),
          ],
        ],
      ),
    );
  }
}
