import 'package:flutter/material.dart';
import '../../../models/jss1_lesson_model.dart';
import '../../../services/jss1_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS1CalendarDatesStudioWidget extends StatefulWidget {
  final JSS1Lesson lesson;

  const JSS1CalendarDatesStudioWidget({super.key, required this.lesson});

  @override
  State<JSS1CalendarDatesStudioWidget> createState() => _JSS1CalendarDatesStudioWidgetState();
}

class _JSS1CalendarDatesStudioWidgetState extends State<JSS1CalendarDatesStudioWidget> {
  final JSS1AudioService _audioService = JSS1AudioService();

  int _selectedDayOfWeekIndex = 1; // 0: Lundi, 1: Mardi, etc.
  int _selectedDayNumber = 12; // 1 to 31
  int _selectedMonthIndex = 4; // 0: Janvier ... 4: Mai ... 9: Octobre

  final List<String> _daysOfWeek = [
    'Lundi',
    'Mardi',
    'Mercredi',
    'Jeudi',
    'Vendredi',
    'Samedi',
    'Dimanche',
  ];

  final List<String> _monthsOfYear = [
    'janvier',
    'février',
    'mars',
    'avril',
    'mai',
    'juin',
    'juillet',
    'août',
    'septembre',
    'octobre',
    'novembre',
    'décembre',
  ];

  String _getConstructedDate() {
    final dayName = _daysOfWeek[_selectedDayOfWeekIndex];
    final monthName = _monthsOfYear[_selectedMonthIndex];
    final dayNumStr = _selectedDayNumber == 1 ? '1er (premier)' : '$_selectedDayNumber';
    return '$dayName, le $dayNumStr $monthName 2026';
  }

  @override
  Widget build(BuildContext context) {
    final constructedDate = _getConstructedDate();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Column: Interactive Date Controls
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: JSS1Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: JSS1Colors.charcoal.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 7 Days Selector
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('1. Jour de la Semaine', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.teal, size: 20),
                        onPressed: () => _audioService.playPhrase('les_7_jours_de_la_semaine', term: 2),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: List.generate(_daysOfWeek.length, (idx) {
                      final isSelected = _selectedDayOfWeekIndex == idx;
                      return ChoiceChip(
                        label: Text(_daysOfWeek[idx]),
                        selected: isSelected,
                        selectedColor: JSS1Colors.teal,
                        backgroundColor: JSS1Colors.cream,
                        labelStyle: TextStyle(
                          color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        onSelected: (selected) {
                          if (selected) {
                            setState(() => _selectedDayOfWeekIndex = idx);
                            _audioService.playClick();
                          }
                        },
                      );
                    }),
                  ),

                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 12),

                  // Day Number Stepper (1 to 31)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('2. Numéro du Jour ($_selectedDayNumber)', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                      if (_selectedDayNumber == 1)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: JSS1Colors.gold,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text('Règle : "Le premier"', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                        ),
                    ],
                  ),
                  Slider(
                    value: _selectedDayNumber.toDouble(),
                    min: 1,
                    max: 31,
                    divisions: 30,
                    activeColor: JSS1Colors.teal,
                    inactiveColor: JSS1Colors.lightGrey,
                    onChanged: (val) {
                      setState(() => _selectedDayNumber = val.toInt());
                    },
                  ),

                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),

                  // 12 Months Selector
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('3. Mois de l\'Année', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.teal, size: 20),
                        onPressed: () => _audioService.playPhrase('les_12_mois_de_l_annee', term: 2),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: List.generate(_monthsOfYear.length, (idx) {
                      final isSelected = _selectedMonthIndex == idx;
                      return ChoiceChip(
                        label: Text(_monthsOfYear[idx]),
                        selected: isSelected,
                        selectedColor: JSS1Colors.teal,
                        backgroundColor: JSS1Colors.cream,
                        labelStyle: TextStyle(
                          color: isSelected ? JSS1Colors.white : JSS1Colors.charcoal,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                        onSelected: (selected) {
                          if (selected) {
                            setState(() => _selectedMonthIndex = idx);
                            _audioService.playClick();
                          }
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 20),

        // Right Column: Date Output & Landmark Anniversary Cards
        Expanded(
          flex: 6,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: JSS1Colors.teal,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: JSS1Colors.teal.withValues(alpha: 0.2),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('CALENDRIER & DATES SCOLAIRES', style: JSS1Text.caption(JSS1Colors.gold).copyWith(fontWeight: FontWeight.w900, letterSpacing: 1), overflow: TextOverflow.ellipsis),
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded, color: JSS1Colors.white, size: 28),
                      onPressed: () => _audioService.playPhrase('aujourd_hui_c_est_le', term: 2),
                    ),
                  ],
                ),

                // Constructed Date Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: JSS1Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date Formée :', style: JSS1Text.caption(JSS1Colors.teal).copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Text(
                        'Aujourd\'hui c\'est :',
                        style: JSS1Text.caption(JSS1Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        constructedDate,
                        style: JSS1Text.subheading(JSS1Colors.charcoal).copyWith(fontSize: 18, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),

                // Landmark Buttons (Independence Day & Birthday)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dates & Fêtes Repères :', style: JSS1Text.caption(JSS1Colors.white).copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedDayNumber = 1;
                                _selectedMonthIndex = 9; // Octobre
                              });
                              _audioService.playPhrase('le_premier_octobre', term: 2);
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: JSS1Colors.white.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: JSS1Colors.gold.withValues(alpha: 0.5)),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.flag_rounded, color: JSS1Colors.gold, size: 20),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      '1er Octobre (Indépendance)',
                                      style: JSS1Text.caption(JSS1Colors.white).copyWith(fontWeight: FontWeight.bold, fontSize: 11),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: InkWell(
                            onTap: () => _audioService.playPhrase('mon_anniversaire_est_le_quinze_mai', term: 2),
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: JSS1Colors.white.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.cake_rounded, color: JSS1Colors.gold, size: 20),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      'Mon Anniversaire',
                                      style: JSS1Text.caption(JSS1Colors.white).copyWith(fontWeight: FontWeight.bold, fontSize: 11),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Question Audio Trigger
                InkWell(
                  onTap: () => _audioService.playPhrase('quelle_est_la_date_d_aujourd_hui', term: 2),
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: JSS1Colors.gold,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.record_voice_over_rounded, color: JSS1Colors.charcoal, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Écouter : "Quelle est la date d\'aujourd\'hui ?"',
                          style: JSS1Text.body(JSS1Colors.charcoal).copyWith(fontWeight: FontWeight.w900, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
