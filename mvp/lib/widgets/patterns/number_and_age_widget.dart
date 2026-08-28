import 'package:flutter/material.dart';
import '../../models/p4_lesson_model.dart';
import '../../services/p4_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

/// Week 7 Pattern: French Numbers 1–20 & Age/Gender Avatar Builder
class NumberAndAgeWidget extends StatefulWidget {
  final P4Lesson lesson;

  const NumberAndAgeWidget({super.key, required this.lesson});

  @override
  State<NumberAndAgeWidget> createState() => _NumberAndAgeWidgetState();
}

class _NumberAndAgeWidgetState extends State<NumberAndAgeWidget> {
  int _tabIndex = 0; // 0: Numbers 1-20 Counter, 1: Stating Age & Gender
  int _selectedNumber = 9;
  bool _isBoy = true;

  final List<Map<String, dynamic>> _numbers = [
    {'digit': 1, 'word': 'Un', 'sound': 'uhn', 'audio': 'num_1'},
    {'digit': 2, 'word': 'Deux', 'sound': 'duh', 'audio': 'num_2'},
    {'digit': 3, 'word': 'Trois', 'sound': 'twah', 'audio': 'num_3'},
    {'digit': 4, 'word': 'Quatre', 'sound': 'kat-ruh', 'audio': 'num_4'},
    {'digit': 5, 'word': 'Cinq', 'sound': 'sank', 'audio': 'num_5'},
    {'digit': 6, 'word': 'Six', 'sound': 'sees', 'audio': 'num_6'},
    {'digit': 7, 'word': 'Sept', 'sound': 'set', 'audio': 'num_7'},
    {'digit': 8, 'word': 'Huit', 'sound': 'weet', 'audio': 'num_8'},
    {'digit': 9, 'word': 'Neuf', 'sound': 'nuhf', 'audio': 'num_9'},
    {'digit': 10, 'word': 'Dix', 'sound': 'dees', 'audio': 'num_10'},
    {'digit': 11, 'word': 'Onze', 'sound': 'ohnz', 'audio': 'num_11'},
    {'digit': 12, 'word': 'Douze', 'sound': 'dooz', 'audio': 'num_12'},
    {'digit': 13, 'word': 'Treize', 'sound': 'trehz', 'audio': 'num_13'},
    {'digit': 14, 'word': 'Quatorze', 'sound': 'kah-torz', 'audio': 'num_14'},
    {'digit': 15, 'word': 'Quinze', 'sound': 'kanz', 'audio': 'num_15'},
    {'digit': 16, 'word': 'Seize', 'sound': 'sehz', 'audio': 'num_16'},
    {'digit': 17, 'word': 'Dix-sept', 'sound': 'dee-set', 'audio': 'num_17'},
    {'digit': 18, 'word': 'Dix-huit', 'sound': 'deez-weet', 'audio': 'num_18'},
    {'digit': 19, 'word': 'Dix-neuf', 'sound': 'deez-nuhf', 'audio': 'num_19'},
    {'digit': 20, 'word': 'Vingt', 'sound': 'van', 'audio': 'num_20'},
  ];

  void _playAudio(String? audioKey) {
    if (audioKey != null && audioKey.isNotEmpty) {
      P4AudioService().playPhrase(audioKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Mode Switcher
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTab(
              title: '🔢 1. Numbers 1–20 Interactive Counter',
              isActive: _tabIndex == 0,
              onTap: () => setState(() => _tabIndex = 0),
            ),
            const SizedBox(width: 16),
            _buildTab(
              title: '🎂 2. Stating Age ("J\'ai ... ans") & Gender',
              isActive: _tabIndex == 1,
              onTap: () => setState(() => _tabIndex = 1),
            ),
          ],
        ),
        const SizedBox(height: 20),

        Expanded(
          child: _tabIndex == 0 ? _buildNumbersCounterView() : _buildAgeGenderView(),
        ),
      ],
    );
  }

  Widget _buildTab({required String title, required bool isActive, required VoidCallback onTap}) {
    return Material(
      color: isActive ? LHColors.teal : LHColors.white,
      borderRadius: BorderRadius.circular(14),
      elevation: isActive ? 4 : 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Text(
            title,
            style: LHText.subheading(isActive ? LHColors.white : LHColors.charcoal).copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNumbersCounterView() {
    final currentItem = _numbers.firstWhere((n) => n['digit'] == _selectedNumber);

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withOpacity(0.3), width: 2),
      ),
      child: Row(
        children: [
          // Left: 4x5 Grid of Numbers 1 to 20
          Expanded(
            flex: 6,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.1,
              ),
              itemCount: _numbers.length,
              itemBuilder: (context, index) {
                final item = _numbers[index];
                final digit = item['digit'] as int;
                final isSelected = digit == _selectedNumber;

                return Material(
                  color: isSelected ? LHColors.teal : LHColors.cream.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(16),
                  elevation: isSelected ? 4 : 0,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      setState(() => _selectedNumber = digit);
                      _playAudio(item['audio'] as String?);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$digit',
                          style: LHText.heading(isSelected ? LHColors.gold : LHColors.teal).copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          item['word'] as String,
                          style: LHText.body(isSelected ? LHColors.white : LHColors.charcoal).copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(width: 24),

          // Right: Large Number Spotlight Card
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: LHColors.cream,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: LHColors.gold.withOpacity(0.6), width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Selected Number',
                        style: LHText.label(LHColors.teal).copyWith(fontSize: 14),
                      ),
                      IconButton.filled(
                        style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                        icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 24),
                        onPressed: () => _playAudio(currentItem['audio'] as String?),
                      ),
                    ],
                  ),

                  Container(
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                      color: LHColors.teal,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '$_selectedNumber',
                        style: LHText.heading(LHColors.gold).copyWith(fontSize: 44, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      Text(
                        currentItem['word'] as String,
                        style: LHText.heading(LHColors.charcoal).copyWith(fontSize: 32),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                        decoration: BoxDecoration(
                          color: LHColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: LHColors.teal.withOpacity(0.3)),
                        ),
                        child: Text(
                          'Pronunciation: [ ${currentItem['sound']} ]',
                          style: LHText.body(LHColors.teal).copyWith(fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),

                  // Quick Step - / + buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton.filled(
                        style: IconButton.styleFrom(backgroundColor: LHColors.teal),
                        icon: const Icon(Icons.remove_rounded, color: LHColors.white),
                        onPressed: _selectedNumber > 1
                            ? () {
                                setState(() => _selectedNumber--);
                                _playAudio('num_$_selectedNumber');
                              }
                            : null,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Step Numbers',
                        style: LHText.body(LHColors.charcoal).copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 16),
                      IconButton.filled(
                        style: IconButton.styleFrom(backgroundColor: LHColors.teal),
                        icon: const Icon(Icons.add_rounded, color: LHColors.white),
                        onPressed: _selectedNumber < 20
                            ? () {
                                setState(() => _selectedNumber++);
                                _playAudio('num_$_selectedNumber');
                              }
                            : null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAgeGenderView() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withOpacity(0.3), width: 2),
      ),
      child: Row(
        children: [
          // Left: Interactive Age & Gender Selectors
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. Select Pupil Age (Years)',
                      style: LHText.subheading(LHColors.teal).copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [7, 8, 9, 10, 11, 12].map((age) {
                        final isSelected = age == _selectedNumber;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(
                              '$age ans',
                              style: LHText.body(isSelected ? LHColors.charcoal : LHColors.charcoal).copyWith(
                                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
                              ),
                            ),
                            selected: isSelected,
                            selectedColor: LHColors.gold,
                            backgroundColor: LHColors.cream,
                            onSelected: (_) {
                              setState(() => _selectedNumber = age);
                              if (age == 8) {
                                _playAudio('jai_huit_ans');
                              } else if (age == 9) {
                                _playAudio('jai_neuf_ans');
                              } else if (age == 10) {
                                _playAudio('jai_dix_ans');
                              } else {
                                _playAudio('num_$age');
                              }
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2. Select Gender (Garçon vs Fille)',
                      style: LHText.subheading(LHColors.teal).copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Material(
                            color: _isBoy ? LHColors.teal : LHColors.cream,
                            borderRadius: BorderRadius.circular(14),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(14),
                              onTap: () {
                                setState(() => _isBoy = true);
                                _playAudio('je_suis_un_garcon');
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: Center(
                                  child: Text(
                                    '👦 Je suis un garçon',
                                    style: LHText.body(_isBoy ? LHColors.white : LHColors.charcoal).copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Material(
                            color: !_isBoy ? LHColors.teal : LHColors.cream,
                            borderRadius: BorderRadius.circular(14),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(14),
                              onTap: () {
                                setState(() => _isBoy = false);
                                _playAudio('je_suis_une_fille');
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: Center(
                                  child: Text(
                                    '👧 Je suis une fille',
                                    style: LHText.body(!_isBoy ? LHColors.white : LHColors.charcoal).copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: LHColors.teal.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'French Rule: We use "J\'ai ... ans" (literally: I have ... years). We do NOT say "Je suis 9 ans"!',
                    style: LHText.body(LHColors.teal).copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 28),

          // Right: Live Sentence Presentation Card
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: LHColors.cream,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: LHColors.teal.withOpacity(0.4), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Full Age & Gender Speech',
                        style: LHText.heading(LHColors.teal).copyWith(fontSize: 22),
                      ),
                      IconButton.filled(
                        style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                        icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 24),
                        onPressed: () {
                          if (_selectedNumber == 8) {
                            _playAudio('jai_huit_ans');
                          } else if (_selectedNumber == 9) {
                            _playAudio('jai_neuf_ans');
                          } else if (_selectedNumber == 10) {
                            _playAudio('jai_dix_ans');
                          } else {
                            _playAudio('num_$_selectedNumber');
                          }
                        },
                      ),
                    ],
                  ),

                  // Age Sentence
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: LHColors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: LHColors.turquoise.withOpacity(0.4)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Age Statement:',
                          style: LHText.label(LHColors.grey).copyWith(fontSize: 12),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'J\'ai $_selectedNumber ans.',
                          style: LHText.heading(LHColors.teal).copyWith(fontSize: 24),
                        ),
                        Text(
                          'I am $_selectedNumber years old.',
                          style: LHText.body(LHColors.charcoal).copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                  ),

                  // Gender Sentence
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: LHColors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: LHColors.gold.withOpacity(0.5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gender Statement:',
                          style: LHText.label(LHColors.grey).copyWith(fontSize: 12),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _isBoy ? 'Je suis un garçon.' : 'Je suis une fille.',
                          style: LHText.heading(LHColors.teal).copyWith(fontSize: 24),
                        ),
                        Text(
                          _isBoy ? 'I am a boy (Masculine)' : 'I am a girl (Feminine)',
                          style: LHText.body(LHColors.charcoal).copyWith(fontSize: 15),
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
    );
  }
}
