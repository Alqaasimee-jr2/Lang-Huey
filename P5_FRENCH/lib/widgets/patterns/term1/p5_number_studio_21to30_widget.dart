import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5NumberStudio21to30Widget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5NumberStudio21to30Widget({super.key, required this.onComplete});

  @override
  State<P5NumberStudio21to30Widget> createState() => _P5NumberStudio21to30WidgetState();
}

class _P5NumberStudio21to30WidgetState extends State<P5NumberStudio21to30Widget> {
  final P5AudioService _audioService = P5AudioService();
  int _activeSubView = 0; // 0: 21-30 Board, 1: Math Equation Studio, 2: Combien Quantity Quiz

  final List<Map<String, dynamic>> _numbers21to30 = [
    {'num': 21, 'french': 'Vingt et un', 'phonetic': 'van-tay-uhn', 'isSpecial': true, 'audio': 'num_21'},
    {'num': 22, 'french': 'Vingt-deux', 'phonetic': 'van-duh', 'isSpecial': false, 'audio': 'num_22'},
    {'num': 23, 'french': 'Vingt-trois', 'phonetic': 'van-twah', 'isSpecial': false, 'audio': 'num_23'},
    {'num': 24, 'french': 'Vingt-quatre', 'phonetic': 'van-kahtr', 'isSpecial': false, 'audio': 'num_24'},
    {'num': 25, 'french': 'Vingt-cinq', 'phonetic': 'van-sank', 'isSpecial': false, 'audio': 'num_25'},
    {'num': 26, 'french': 'Vingt-six', 'phonetic': 'van-sees', 'isSpecial': false, 'audio': 'num_26'},
    {'num': 27, 'french': 'Vingt-sept', 'phonetic': 'van-set', 'isSpecial': false, 'audio': 'num_27'},
    {'num': 28, 'french': 'Vingt-huit', 'phonetic': 'van-weet', 'isSpecial': false, 'audio': 'num_28'},
    {'num': 29, 'french': 'Vingt-neuf', 'phonetic': 'van-nuhf', 'isSpecial': false, 'audio': 'num_29'},
    {'num': 30, 'french': 'Trente', 'phonetic': 'trahnt', 'isSpecial': true, 'audio': 'num_30'},
  ];

  int _mathOperand1 = 20;
  int _mathOperand2 = 5;
  String _mathOperator = '+';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: P5Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: P5Colors.turquoise.withOpacity(0.3), width: 2),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildSubTab(0, '1. Numbers 21–30 Board', Icons.grid_view_rounded),
                  const SizedBox(width: 12),
                  _buildSubTab(1, '2. Math Equation Builder', Icons.calculate_rounded),
                  const SizedBox(width: 12),
                  _buildSubTab(2, '3. "Combien ?" Quantity Drill', Icons.help_outline_rounded),
                ],
              ),
              ElevatedButton.icon(
                onPressed: widget.onComplete,
                icon: const Icon(Icons.check_circle_rounded, color: P5Colors.white),
                label: const Text('Complete Lab', style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: P5Colors.green,
                  foregroundColor: P5Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ],
          ),
          const Divider(height: 24),

          Expanded(
            child: _activeSubView == 0
                ? _buildNumbersBoard()
                : _activeSubView == 1
                    ? _buildMathStudio()
                    : _buildCombienQuiz(),
          ),
        ],
      ),
    );
  }

  Widget _buildSubTab(int index, String label, IconData icon) {
    final isSelected = _activeSubView == index;
    return InkWell(
      onTap: () {
        setState(() => _activeSubView = index);
        _audioService.playSfx(P5SfxType.click);
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? P5Colors.teal : P5Colors.cream,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: isSelected ? P5Colors.white : P5Colors.teal),
            const SizedBox(width: 8),
            Text(
              label,
              style: P5Text.body(isSelected ? P5Colors.white : P5Colors.charcoal).copyWith(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumbersBoard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.info_outline_rounded, color: P5Colors.teal, size: 22),
            const SizedBox(width: 8),
            Text(
              'Notice: 21 uses "et un", while 22 to 29 use hyphens (-). Touch any card to listen:',
              style: P5Text.body(P5Colors.charcoal).copyWith(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.4,
            ),
            itemCount: _numbers21to30.length,
            itemBuilder: (context, index) {
              final n = _numbers21to30[index];
              final isSpecial = n['isSpecial'] as bool;
              return Material(
                color: isSpecial ? P5Colors.gold.withOpacity(0.2) : P5Colors.cream,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => _audioService.playPhrase(n['audio'] as String, term: 1),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: isSpecial ? P5Colors.gold : P5Colors.teal,
                          child: Text(
                            '${n['num']}',
                            style: const TextStyle(color: P5Colors.white, fontWeight: FontWeight.w900, fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          n['french'] as String,
                          style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 15, fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                        Text('"${n['phonetic']}"', style: P5Text.caption(P5Colors.teal)),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMathStudio() {
    final result = _mathOperator == '+' ? _mathOperand1 + _mathOperand2 : _mathOperand1 - _mathOperand2;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Interactive French Math Equation Builder',
          style: P5Text.heading(P5Colors.teal).copyWith(fontSize: 22),
        ),
        const SizedBox(height: 10),
        Text(
          'Select numbers and operator to practice saying sums in French:',
          style: P5Text.body(P5Colors.charcoal),
        ),
        const SizedBox(height: 24),

        // Interactive Math Equation Display
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          decoration: BoxDecoration(
            color: P5Colors.cream,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: P5Colors.turquoise, width: 2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('$_mathOperand1', style: P5Text.heroHeading(P5Colors.teal)),
              const SizedBox(width: 16),
              Text(_mathOperator == '+' ? 'plus (+)' : 'moins (-)', style: P5Text.heading(P5Colors.gold)),
              const SizedBox(width: 16),
              Text('$_mathOperand2', style: P5Text.heroHeading(P5Colors.teal)),
              const SizedBox(width: 16),
              Text('font (=)', style: P5Text.heading(P5Colors.charcoal)),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: P5Colors.teal,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text('$result', style: P5Text.heroHeading(P5Colors.white)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Controls
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _mathOperand1 = 20;
                  _mathOperand2 = 5;
                  _mathOperator = '+';
                });
                _audioService.playPhrase('num_25', term: 1);
              },
              child: const Text('20 + 5 = 25 (Vingt-cinq)'),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _mathOperand1 = 20;
                  _mathOperand2 = 8;
                  _mathOperator = '+';
                });
                _audioService.playPhrase('num_28', term: 1);
              },
              child: const Text('20 + 8 = 28 (Vingt-huit)'),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _mathOperand1 = 30;
                  _mathOperand2 = 5;
                  _mathOperator = '-';
                });
                _audioService.playPhrase('num_25', term: 1);
              },
              child: const Text('30 - 5 = 25 (Vingt-cinq)'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCombienQuiz() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.help_center_rounded, size: 48, color: P5Colors.teal),
        const SizedBox(height: 12),
        Text(
          'Combien de crayons y a-t-il ? (How many pencils are there?)',
          style: P5Text.heading(P5Colors.charcoal).copyWith(fontSize: 20),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(
            24,
            (index) => Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: P5Colors.gold.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.edit_rounded, color: P5Colors.charcoal, size: 24),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Answer: "Il y a vingt-quatre (24) crayons."',
          style: P5Text.frenchPhrase(P5Colors.teal),
        ),
      ],
    );
  }
}
