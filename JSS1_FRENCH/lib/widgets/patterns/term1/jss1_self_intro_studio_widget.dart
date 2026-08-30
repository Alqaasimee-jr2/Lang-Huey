import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1SelfIntroStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1SelfIntroStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1SelfIntroStudioWidget> createState() => _JSS1SelfIntroStudioWidgetState();
}

class _JSS1SelfIntroStudioWidgetState extends State<JSS1SelfIntroStudioWidget> {
  final JSS1AudioService _audio = JSS1AudioService();
  String _selectedName = 'Emeka';
  int _selectedAge = 12;
  bool _isFemale = false;
  String _selectedCity = 'Lagos';

  final List<String> _names = ['Emeka', 'Amina', 'Chidi', 'Fatima', 'Tunde', 'Zainab'];
  final List<String> _cities = ['Lagos', 'Abuja', 'Kano', 'Port Harcourt', 'Ibadan', 'Enugu'];

  @override
  Widget build(BuildContext context) {
    final nationality = _isFemale ? 'nigériane' : 'nigérian';

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
                child: const Icon(Icons.badge_rounded, color: JSS1Colors.teal, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Générateur de Carte d\'Identité Scolaire', style: JSS1Text.heading(JSS1Colors.teal)),
                    Text(
                      'Personnalisez votre passeport scolaire et écoutez votre présentation complète en français.',
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
                // Left Column: Interactive Controls
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
                        Text('1. Choisissez votre Prénom', style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800)),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: _names.map((name) {
                            final isSel = _selectedName == name;
                            return ChoiceChip(
                              label: Text(name),
                              selected: isSel,
                              selectedColor: JSS1Colors.teal,
                              backgroundColor: JSS1Colors.white,
                              labelStyle: TextStyle(
                                color: isSel ? JSS1Colors.white : JSS1Colors.charcoal,
                                fontWeight: FontWeight.bold,
                              ),
                              onSelected: (sel) {
                                if (sel) {
                                  setState(() {
                                    _selectedName = name;
                                    _isFemale = name == 'Amina' || name == 'Fatima' || name == 'Zainab';
                                  });
                                  _audio.playClick();
                                }
                              },
                            );
                          }).toList(),
                        ),

                        const SizedBox(height: 16),

                        Text('2. Âge (Ans)', style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800)),
                        const SizedBox(height: 8),
                        Row(
                          children: [11, 12, 13, 14].map((age) {
                            final isSel = _selectedAge == age;
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: ChoiceChip(
                                label: Text('$age ans'),
                                selected: isSel,
                                selectedColor: JSS1Colors.gold,
                                backgroundColor: JSS1Colors.white,
                                labelStyle: TextStyle(
                                  color: isSel ? JSS1Colors.charcoal : JSS1Colors.charcoal,
                                  fontWeight: FontWeight.w900,
                                ),
                                onSelected: (sel) {
                                  if (sel) {
                                    setState(() => _selectedAge = age);
                                    _audio.playClick();
                                  }
                                },
                              ),
                            );
                          }).toList(),
                        ),

                        const SizedBox(height: 16),

                        Text('3. Ville de Résidence', style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w800)),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: _cities.map((city) {
                            final isSel = _selectedCity == city;
                            return ChoiceChip(
                              label: Text(city),
                              selected: isSel,
                              selectedColor: JSS1Colors.teal,
                              backgroundColor: JSS1Colors.white,
                              labelStyle: TextStyle(
                                color: isSel ? JSS1Colors.white : JSS1Colors.charcoal,
                                fontWeight: FontWeight.bold,
                              ),
                              onSelected: (sel) {
                                if (sel) {
                                  setState(() => _selectedCity = city);
                                  _audio.playClick();
                                }
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 24),

                // Right Column: Official Smartboard Student ID Card
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF0D7377), Color(0xFF14BDCC)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: JSS1Colors.teal.withValues(alpha: 0.3),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Card Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.school_rounded, color: JSS1Colors.gold, size: 28),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('RÉPUBLIQUE FÉDÉRALE DU NIGERIA', style: JSS1Text.caption(JSS1Colors.gold).copyWith(fontWeight: FontWeight.w900)),
                                    Text('CARTE D\'ÉLÈVE JSS1', style: JSS1Text.subheading(JSS1Colors.white).copyWith(fontSize: 16)),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: JSS1Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text('LANG HUEY', style: TextStyle(fontWeight: FontWeight.w900, color: JSS1Colors.teal, fontSize: 11)),
                            ),
                          ],
                        ),

                        const Divider(color: Colors.white24, height: 28),

                        // Card Body
                        Expanded(
                          child: Row(
                            children: [
                              // Avatar Box
                              Container(
                                width: 90,
                                height: 110,
                                decoration: BoxDecoration(
                                  color: JSS1Colors.white,
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: JSS1Colors.gold, width: 2),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      _isFemale ? Icons.face_3_rounded : Icons.face_rounded,
                                      size: 54,
                                      color: JSS1Colors.teal,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _isFemale ? 'FÉMININ' : 'MASCULIN',
                                      style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: JSS1Colors.teal),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(width: 16),

                              // Text Fields
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _buildIdRow('Nom :', '$_selectedName [Élève]'),
                                    _buildIdRow('Âge :', '$_selectedAge ans (Verbe Avoir)'),
                                    _buildIdRow('Nationalité :', nationality.toUpperCase()),
                                    _buildIdRow('Ville :', _selectedCity),
                                    _buildIdRow('Classe :', 'JSS1 (1re Année du Secondaire)'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Bottom Spoken Summary Bar
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: JSS1Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '« Bonjour ! Je m\'appelle $_selectedName. J\'ai $_selectedAge ans. Je suis $nationality. J\'habite à $_selectedCity et je suis élève en JSS1. »',
                                  style: JSS1Text.caption(JSS1Colors.white).copyWith(fontStyle: FontStyle.italic),
                                ),
                              ),
                              const SizedBox(width: 10),
                              IconButton.filled(
                                onPressed: () => _audio.playPhrase('je_suis_eleve_en_jss1', term: 1),
                                icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.charcoal),
                                style: IconButton.styleFrom(backgroundColor: JSS1Colors.gold),
                              ),
                            ],
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

  Widget _buildIdRow(String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(label, style: JSS1Text.caption(JSS1Colors.gold).copyWith(fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: Text(value, style: JSS1Text.body(JSS1Colors.white).copyWith(fontSize: 14, fontWeight: FontWeight.w700)),
        ),
      ],
    );
  }
}
