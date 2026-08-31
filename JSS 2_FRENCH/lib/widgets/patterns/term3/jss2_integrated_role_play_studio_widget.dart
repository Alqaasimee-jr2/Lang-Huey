import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 5 — Projet Oral: Jeux de Rôle Intégrés
/// 4-scenario role-play preparation studio with script builder,
/// expression bank, and performance rubric.
class JSS2IntegratedRolePlayStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;
  const JSS2IntegratedRolePlayStudioWidget({super.key, required this.lesson});

  @override
  State<JSS2IntegratedRolePlayStudioWidget> createState() => _JSS2IntegratedRolePlayStudioWidgetState();
}

class _JSS2IntegratedRolePlayStudioWidgetState extends State<JSS2IntegratedRolePlayStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS2AudioService _audio = JSS2AudioService();
  late TabController _tabController;

  int _selectedScenario = 0;

  static const List<Map<String, dynamic>> _scenarios = [
    {
      'title': 'Transport',
      'emoji': '🚌',
      'color': Color(0xFF3498DB),
      'context': 'You need to get to the city centre. Ask for directions to the bus stop, buy a ticket, and ask about the departure time.',
      'expressions': [
        "Excusez-moi, où est l'arrêt de bus ?",
        'Continuez tout droit, c\'est à 5 minutes.',
        'Un billet pour le centre-ville, s\'il vous plaît.',
        'À quelle heure part le prochain bus ?',
        'Le bus numéro 47 part dans 10 minutes.',
        'Merci beaucoup ! Bonne journée !',
      ],
      'roles': ['Voyageur (Traveller)', 'Agent / Passant (Official / Passerby)'],
      'rubric': ['Uses correct transport vocabulary', 'Asks and answers questions fluently', 'Uses polite expressions', 'Responds to improvised questions'],
    },
    {
      'title': 'Marché',
      'emoji': '🛒',
      'color': Color(0xFF2ECC71),
      'context': 'You are at the market. Buy 3 items, ask for prices, try to bargain, and pay the correct amount.',
      'expressions': [
        "Bonjour ! Qu'est-ce que vous vendez ?",
        'Combien coûte ce kilo de tomates ?',
        'C\'est trop cher ! Faites-moi un bon prix.',
        'D\'accord, je vous fais à 500 nairas.',
        'Je prends deux kilos, s\'il vous plaît.',
        'Voici 1000 nairas. Gardez la monnaie.',
      ],
      'roles': ['Client (Customer)', 'Vendeur / Vendeuse (Seller)'],
      'rubric': ['Greets correctly', 'Asks prices correctly', 'Bargains naturally', 'Pays and gives change in French'],
    },
    {
      'title': 'Pharmacie',
      'emoji': '💊',
      'color': Color(0xFFE74C3C),
      'context': 'You are ill and visit the pharmacy. Describe your symptoms, ask for medicine, and understand the dosage instructions.',
      'expressions': [
        'Bonjour, j\'ai besoin d\'aide.',
        'J\'ai mal à la gorge et de la fièvre.',
        'Depuis quand avez-vous ces symptômes ?',
        'Depuis deux jours.',
        'Je vous recommande ce sirop et ces comprimés.',
        'Prenez-en 3 fois par jour pendant 5 jours.',
      ],
      'roles': ['Patient (Patient)', 'Pharmacien / Pharmacienne (Pharmacist)'],
      'rubric': ['Describes symptoms clearly', 'Responds to questions appropriately', 'Understands dosage instructions', 'Uses j\'ai mal à correctly'],
    },
    {
      'title': 'Restaurant',
      'emoji': '🍽️',
      'color': Color(0xFF9B59B6),
      'context': 'You visit a restaurant with a friend. Make a reservation, order a 3-course meal, compliment the food, and ask for the bill.',
      'expressions': [
        'Bonjour, je voudrais réserver une table pour deux.',
        'Bien sûr. Voici la carte. Que désirez-vous ?',
        'Je voudrais le poulet rôti et une eau minérale.',
        'C\'était délicieux ! Compliments au chef.',
        "L'addition, s'il vous plaît.",
        'Voici l\'addition. Ça fait 7 500 nairas.',
      ],
      'roles': ['Client (Customer)', 'Serveur / Serveuse (Waiter/Waitress)'],
      'rubric': ['Makes reservation correctly', 'Orders politely using "je voudrais"', 'Compliments food', 'Asks for bill using "l\'addition"'],
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
    final scenario = _scenarios[_selectedScenario];
    final color = scenario['color'] as Color;

    return Column(
      children: [
        // Header with scenario selector
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.8), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(scenario['emoji'] as String, style: const TextStyle(fontSize: 28)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Jeu de Rôle : ${scenario['title']}',
                      style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Scenario tabs
              Row(
                children: List.generate(_scenarios.length, (i) {
                  final s = _scenarios[i];
                  final selected = _selectedScenario == i;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: GestureDetector(
                        onTap: () { setState(() => _selectedScenario = i); _audio.playClick(); },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: selected ? Colors.white : Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Text(s['emoji'] as String, style: const TextStyle(fontSize: 18)),
                              Text(s['title'] as String, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: selected ? color : Colors.white70)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),

        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            labelColor: color,
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: color,
            tabs: const [
              Tab(icon: Icon(Icons.lightbulb_rounded, size: 18), text: 'Contexte'),
              Tab(icon: Icon(Icons.record_voice_over_rounded, size: 18), text: 'Expressions'),
              Tab(icon: Icon(Icons.star_rounded, size: 18), text: 'Rubrique'),
            ],
          ),
        ),

        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildContextTab(scenario, color),
              _buildExpressionsTab(scenario, color),
              _buildRubricTab(scenario, color),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContextTab(Map<String, dynamic> scenario, Color color) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: color.withOpacity(0.08),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: color.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.description_rounded, color: color),
                    const SizedBox(width: 8),
                    Text('Contexte du scénario :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: color)),
                  ],
                ),
                const SizedBox(height: 12),
                Text(scenario['context'] as String, style: const TextStyle(fontSize: 14, height: 1.5, color: Colors.black87)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text('Rôles :', style: LangHueyTextStyles.h2.copyWith(fontSize: 15)),
          const SizedBox(height: 12),
          ...(scenario['roles'] as List<String>).asMap().entries.map((e) {
            final icons = [Icons.person_rounded, Icons.support_agent_rounded];
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.black12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40, height: 40,
                    decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                    child: Icon(icons[e.key % 2], color: color),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: Text(e.value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
                ],
              ),
            );
          }),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: LangHueyColors.warmCream, borderRadius: BorderRadius.circular(14), border: Border.all(color: LangHueyColors.amberGold.withOpacity(0.4))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('💡 Stratégies clés :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 8),
                ...[
                  "Commencez par une salutation : Bonjour / Bonsoir !",
                  "Utilisez 'je voudrais' pour les demandes polies.",
                  "Répondez à toutes les questions, même si c'est 'Je ne sais pas'.",
                  "Terminez poliment : Merci / Au revoir / Bonne journée !",
                ].map((tip) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('✓ ', style: TextStyle(color: Color(0xFF2ECC71), fontWeight: FontWeight.bold)),
                      Expanded(child: Text(tip, style: const TextStyle(fontSize: 12, color: Colors.black87))),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpressionsTab(Map<String, dynamic> scenario, Color color) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Banque d\'expressions clés :', style: LangHueyTextStyles.h2.copyWith(fontSize: 15)),
          const SizedBox(height: 4),
          const Text('Tapez sur une expression pour l\'entendre et la mémoriser.', style: TextStyle(fontSize: 12, color: Colors.black54)),
          const SizedBox(height: 16),
          ...(scenario['expressions'] as List<String>).asMap().entries.map((e) {
            final isEven = e.key % 2 == 0;
            return GestureDetector(
              onTap: () {
                _audio.playClick();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('📣 ${e.value}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  backgroundColor: color,
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                ));
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isEven ? color.withOpacity(0.08) : Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: isEven ? color.withOpacity(0.3) : Colors.black12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 32, height: 32,
                      decoration: BoxDecoration(color: isEven ? color : Colors.grey.shade200, borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Icon(isEven ? Icons.person_rounded : Icons.support_agent_rounded, color: isEven ? Colors.white : Colors.black54, size: 16),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(e.value, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: isEven ? color : Colors.black87)),
                    ),
                    Icon(Icons.volume_up_rounded, color: color, size: 18),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildRubricTab(Map<String, dynamic> scenario, Color color) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: const Color(0xFF2C3E50), borderRadius: BorderRadius.circular(18)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.star_rounded, color: Color(0xFFFFD700)),
                    SizedBox(width: 8),
                    Text('Rubrique d\'évaluation du jeu de rôle', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 4),
                const Text('Critères sur 4 points chacun — Total : 20/20', style: TextStyle(color: Colors.white60, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Scenario-specific criteria
          ...(scenario['rubric'] as List<String>).asMap().entries.map((e) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.black12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40, height: 40,
                    decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Text('${e.key + 1}', style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 18))),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: Text(e.value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
                  Text('/4', style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            );
          }),

          const SizedBox(height: 8),
          // Universal criteria
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: Colors.black12)),
            child: Row(
              children: [
                Container(
                  width: 40, height: 40,
                  decoration: BoxDecoration(color: const Color(0xFFF39C12).withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                  child: const Center(child: Text('5', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFF39C12), fontSize: 18))),
                ),
                const SizedBox(width: 12),
                const Expanded(child: Text('Pronunciation, fluency & natural intonation', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
                const Text('/4', style: TextStyle(color: Color(0xFFF39C12), fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ),

          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.08),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: color.withOpacity(0.3)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('TOTAL', style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 16)),
                Text('/ 20 points', style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
