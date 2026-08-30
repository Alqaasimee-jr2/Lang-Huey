import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1PresentOthersStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1PresentOthersStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1PresentOthersStudioWidget> createState() => _JSS1PresentOthersStudioWidgetState();
}

class _JSS1PresentOthersStudioWidgetState extends State<JSS1PresentOthersStudioWidget> {
  final JSS1AudioService _audio = JSS1AudioService();
  bool _isFemale = false;
  String _friendName = 'David';
  int _friendAge = 13;
  String _relationship = 'ami'; // 'ami', 'camarade', 'professeur'

  final List<Map<String, dynamic>> _profiles = [
    {'name': 'David', 'age': 13, 'gender': 'M', 'relation': 'ami', 'city': 'Abuja'},
    {'name': 'Amina', 'age': 12, 'gender': 'F', 'relation': 'amie', 'city': 'Kano'},
    {'name': 'Chidi', 'age': 14, 'gender': 'M', 'relation': 'camarade', 'city': 'Enugu'},
    {'name': 'Fatima', 'age': 13, 'gender': 'F', 'relation': 'camarade', 'city': 'Kaduna'},
    {'name': 'M. Dupont', 'age': 35, 'gender': 'M', 'relation': 'professeur', 'city': 'Paris'},
  ];

  @override
  Widget build(BuildContext context) {
    final pronoun = _isFemale ? 'Elle' : 'Il';
    final nationality = _isFemale ? 'nigériane' : 'nigérian';
    final relationPhrase = _relationship == 'professeur'
        ? 'mon professeur de français'
        : _relationship == 'camarade'
            ? 'mon camarade de classe'
            : _isFemale
                ? 'mon amie'
                : 'mon ami';

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
                child: const Icon(Icons.people_alt_rounded, color: JSS1Colors.teal, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Studio de Présentation d\'une Tierce Personne', style: JSS1Text.heading(JSS1Colors.teal)),
                    Text(
                      'Apprenez à présenter vos amis, camarades et professeurs avec les pronoms « Il » et « Elle ».',
                      style: JSS1Text.caption(JSS1Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Main 2 Columns
          Expanded(
            child: Row(
              children: [
                // Left Column: Profile Selector
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: JSS1Colors.cream,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: JSS1Colors.lightGrey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sélectionnez un Personnage à Présenter', style: JSS1Text.subheading(JSS1Colors.charcoal)),
                        const SizedBox(height: 14),
                        Expanded(
                          child: ListView.separated(
                            itemCount: _profiles.length,
                            separatorBuilder: (c, i) => const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              final p = _profiles[index];
                              final isSel = _friendName == p['name'];
                              final isF = p['gender'] == 'F';

                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    _friendName = p['name'] as String;
                                    _friendAge = p['age'] as int;
                                    _isFemale = isF;
                                    _relationship = p['relation'] as String;
                                  });
                                  _audio.playClick();
                                },
                                borderRadius: BorderRadius.circular(14),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: isSel ? JSS1Colors.teal : JSS1Colors.white,
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(color: isSel ? JSS1Colors.teal : JSS1Colors.lightGrey),
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: isSel ? JSS1Colors.gold : JSS1Colors.teal.withValues(alpha: 0.1),
                                        foregroundColor: isSel ? JSS1Colors.charcoal : JSS1Colors.teal,
                                        child: Icon(
                                          p['relation'] == 'professeur'
                                              ? Icons.school_rounded
                                              : (isF ? Icons.face_3_rounded : Icons.face_rounded),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              p['name'] as String,
                                              style: JSS1Text.body(isSel ? JSS1Colors.white : JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800),
                                            ),
                                            Text(
                                              '${p['age']} ans • ${p['relation']} • ${p['city']}',
                                              style: JSS1Text.caption(isSel ? JSS1Colors.gold : JSS1Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (isSel)
                                        const Icon(Icons.check_circle_rounded, color: JSS1Colors.gold, size: 22),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 24),

                // Right Column: Speech Presentation Card
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
                            _relationship == 'professeur'
                                ? Icons.school_rounded
                                : (_isFemale ? Icons.face_3_rounded : Icons.face_rounded),
                            color: JSS1Colors.gold,
                            size: 52,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          'Voici $relationPhrase !',
                          style: JSS1Text.heading(JSS1Colors.gold).copyWith(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 14),

                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: JSS1Colors.white.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '• $pronoun s\'appelle $_friendName.',
                                style: JSS1Text.subheading(JSS1Colors.white).copyWith(fontSize: 17),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '• $pronoun a $_friendAge ans.',
                                style: JSS1Text.subheading(JSS1Colors.white).copyWith(fontSize: 17),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '• $pronoun est $nationality et très gentil(le).',
                                style: JSS1Text.subheading(JSS1Colors.white).copyWith(fontSize: 17),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        ElevatedButton.icon(
                          onPressed: () => _audio.playPhrase('il_elle_sappelle', term: 1),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: JSS1Colors.gold,
                            foregroundColor: JSS1Colors.charcoal,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          icon: const Icon(Icons.volume_up_rounded),
                          label: Text(
                            'Écouter la Présentation',
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
