import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 1 — Opérations de Calcul Simple
/// Interactive arithmetic calculator studio with 4 operation modes,
/// number sentence builder, and a market transaction simulation.
class JSS2MathCalculationsStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;
  const JSS2MathCalculationsStudioWidget({super.key, required this.lesson});

  @override
  State<JSS2MathCalculationsStudioWidget> createState() => _JSS2MathCalculationsStudioWidgetState();
}

class _JSS2MathCalculationsStudioWidgetState extends State<JSS2MathCalculationsStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS2AudioService _audio = JSS2AudioService();
  late TabController _tabController;

  // Calculator state
  int _numA = 0;
  int _numB = 0;
  String _operation = '+';
  int? _result;
  bool _showResult = false;

  // Market state
  int _qty = 1;
  int _pricePerUnit = 100;
  int _paid = 500;

  // Quiz state
  int _quizIndex = 0;
  int _quizScore = 0;
  bool _quizAnswered = false;
  int? _selectedAnswer;

  static const List<Map<String, dynamic>> _quizzes = [
    {'q': 'Huit plus neuf font ___', 'a': 17, 'ops': [17, 16, 18, 15]},
    {'q': 'Vingt moins treize font ___', 'a': 7, 'ops': [7, 8, 6, 9]},
    {'q': 'Six fois sept font ___', 'a': 42, 'ops': [42, 40, 48, 36]},
    {'q': 'Cinquante divisé par dix font ___', 'a': 5, 'ops': [5, 4, 6, 10]},
    {'q': 'Onze plus quinze font ___', 'a': 26, 'ops': [26, 25, 27, 28]},
  ];

  final List<String> _operations = ['+', '−', '×', '÷'];
  final Map<String, String> _opFrench = {
    '+': 'plus',
    '−': 'moins',
    '×': 'fois',
    '÷': 'divisé par',
  };
  final Map<String, Color> _opColors = {
    '+': const Color(0xFF2ECC71),
    '−': const Color(0xFFE74C3C),
    '×': const Color(0xFF3498DB),
    '÷': const Color(0xFF9B59B6),
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _generateNumbers();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _generateNumbers() {
    setState(() {
      _showResult = false;
      _result = null;
      if (_operation == '+') {
        _numA = (5 + (DateTime.now().millisecond % 20));
        _numB = (3 + (DateTime.now().microsecond % 15));
      } else if (_operation == '−') {
        _numB = (2 + (DateTime.now().millisecond % 10));
        _numA = _numB + (3 + (DateTime.now().microsecond % 10));
      } else if (_operation == '×') {
        _numA = (2 + (DateTime.now().millisecond % 8));
        _numB = (2 + (DateTime.now().microsecond % 8));
      } else {
        _numB = [2, 3, 4, 5, 6, 7, 8, 9, 10][DateTime.now().millisecond % 9];
        _numA = _numB * (2 + (DateTime.now().microsecond % 8));
      }
    });
  }

  void _calculate() {
    setState(() {
      _showResult = true;
      switch (_operation) {
        case '+': _result = _numA + _numB; break;
        case '−': _result = _numA - _numB; break;
        case '×': _result = _numA * _numB; break;
        case '÷': _result = (_numB != 0) ? (_numA ~/ _numB) : 0; break;
      }
    });
    _audio.playCorrect();
  }

  String _numberToFrench(int n) {
    const ones = ['zéro', 'un', 'deux', 'trois', 'quatre', 'cinq', 'six', 'sept', 'huit', 'neuf',
      'dix', 'onze', 'douze', 'treize', 'quatorze', 'quinze', 'seize', 'dix-sept', 'dix-huit', 'dix-neuf'];
    const tens = ['', '', 'vingt', 'trente', 'quarante', 'cinquante', 'soixante', 'soixante-dix', 'quatre-vingts', 'quatre-vingt-dix'];
    if (n < 20) return ones[n];
    if (n < 100) {
      final t = n ~/ 10;
      final o = n % 10;
      if (o == 0) return tens[t];
      if (t == 7) return '${tens[6]}-${ones[10 + o]}';
      if (t == 9) return 'quatre-vingt-${ones[10 + o]}';
      if (o == 1 && t < 8) return '${tens[t]}-et-${ones[o]}';
      return '${tens[t]}-${ones[o]}';
    }
    if (n == 100) return 'cent';
    return '$n';
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
              colors: [Color(0xFF6C3483), Color(0xFF9B59B6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.calculate_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Studio de Calcul — Les 4 Opérations',
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
            labelColor: const Color(0xFF6C3483),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFF6C3483),
            tabs: const [
              Tab(icon: Icon(Icons.calculate_rounded, size: 18), text: 'Calculer'),
              Tab(icon: Icon(Icons.shopping_cart_rounded, size: 18), text: 'Marché'),
              Tab(icon: Icon(Icons.quiz_rounded, size: 18), text: 'Quiz'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [_buildCalculatorTab(), _buildMarketTab(), _buildQuizTab()],
          ),
        ),
      ],
    );
  }

  Widget _buildCalculatorTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Operation selector
          Text('Choisissez l\'opération :', style: LangHueyTextStyles.h2.copyWith(fontSize: 16)),
          const SizedBox(height: 12),
          Row(
            children: _operations.map((op) {
              final selected = _operation == op;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: GestureDetector(
                    onTap: () {
                      setState(() => _operation = op);
                      _generateNumbers();
                      _audio.playClick();
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 60,
                      decoration: BoxDecoration(
                        color: selected ? _opColors[op] : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: selected ? _opColors[op]! : Colors.black12,
                          width: selected ? 2 : 1,
                        ),
                        boxShadow: selected ? [BoxShadow(color: _opColors[op]!.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 3))] : [],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(op, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: selected ? Colors.white : _opColors[op])),
                          Text(_opFrench[op]!, style: TextStyle(fontSize: 9, color: selected ? Colors.white70 : Colors.grey, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),

          // Number display
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _opColors[_operation]!.withOpacity(0.3)),
              boxShadow: [BoxShadow(color: _opColors[_operation]!.withOpacity(0.1), blurRadius: 12, offset: const Offset(0, 4))],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildNumBox(_numA, _opColors[_operation]!),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(_operation, style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: _opColors[_operation])),
                    ),
                    _buildNumBox(_numB, _opColors[_operation]!),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('=', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black54)),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: _showResult ? _opColors[_operation]! : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: _showResult ? _opColors[_operation]! : Colors.black12),
                      ),
                      child: Center(
                        child: Text(
                          _showResult ? (_result?.toString() ?? '?') : '?',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: _showResult ? Colors.white : Colors.black38),
                        ),
                      ),
                    ),
                  ],
                ),
                if (_showResult) ...[
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: _opColors[_operation]!.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '📣 ${_numberToFrench(_numA)} ${_opFrench[_operation]!} ${_numberToFrench(_numB)} font ${_numberToFrench(_result ?? 0)}.',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: _opColors[_operation]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _calculate,
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text('Calculer !'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _opColors[_operation],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              OutlinedButton.icon(
                onPressed: _generateNumbers,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Nouveau'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumBox(int n, Color color) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Center(
        child: Text('$n', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color)),
      ),
    );
  }

  Widget _buildMarketTab() {
    final total = _qty * _pricePerUnit;
    final change = _paid - total;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF1ABC9C), Color(0xFF2ECC71)]),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                const Icon(Icons.storefront_rounded, color: Colors.white, size: 36),
                const SizedBox(height: 8),
                Text('Simulation de Marché', style: LangHueyTextStyles.h2.copyWith(color: Colors.white)),
                const SizedBox(height: 4),
                const Text('Pratiquer les calculs dans un contexte réel', style: TextStyle(color: Colors.white70, fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Price per unit
          _buildSliderCard(
            label: 'Prix unitaire (₦)',
            value: _pricePerUnit.toDouble(),
            min: 50,
            max: 500,
            divisions: 9,
            color: const Color(0xFF3498DB),
            onChanged: (v) => setState(() => _pricePerUnit = v.round()),
          ),
          const SizedBox(height: 12),

          // Quantity
          _buildSliderCard(
            label: 'Quantité achetée',
            value: _qty.toDouble(),
            min: 1,
            max: 20,
            divisions: 19,
            color: const Color(0xFFE74C3C),
            onChanged: (v) => setState(() => _qty = v.round()),
          ),
          const SizedBox(height: 12),

          // Amount paid
          _buildSliderCard(
            label: 'Montant payé (₦)',
            value: _paid.toDouble(),
            min: total.toDouble(),
            max: (total + 1000).toDouble(),
            divisions: 10,
            color: const Color(0xFF9B59B6),
            onChanged: (v) => setState(() => _paid = v.round()),
          ),
          const SizedBox(height: 20),

          // Result
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFF1ABC9C).withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('🧾 Récapitulatif de l\'achat :', style: LangHueyTextStyles.h2.copyWith(fontSize: 15)),
                const SizedBox(height: 12),
                _buildCalcLine('${_numberToFrench(_qty)} × ${_numberToFrench(_pricePerUnit)} nairas', '= ₦$total', const Color(0xFF3498DB)),
                _buildCalcLine(
                  '${_numberToFrench(_paid)} nairas − ${_numberToFrench(total)} nairas',
                  change >= 0 ? '= ₦$change (monnaie)' : '❌ Pas assez !',
                  change >= 0 ? const Color(0xFF2ECC71) : const Color(0xFFE74C3C),
                ),
                const Divider(height: 20),
                Text(
                  '📣 "${_numberToFrench(_qty)} fois ${_numberToFrench(_pricePerUnit)} font ${_numberToFrench(total)}."',
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1ABC9C)),
                ),
                if (change >= 0) ...[
                  const SizedBox(height: 6),
                  Text(
                    '📣 "${_numberToFrench(_paid)} moins ${_numberToFrench(total)} font ${_numberToFrench(change)}. J\'ai ${_numberToFrench(change)} nairas de monnaie."',
                    style: const TextStyle(fontSize: 13, color: Color(0xFF27AE60)),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliderCard({required String label, required double value, required double min, required double max, required int divisions, required Color color, required ValueChanged<double> onChanged}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: Colors.black12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
              child: Text('${value.round()}', style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 16)),
            ),
          ]),
          Slider(value: value, min: min, max: max, divisions: divisions, activeColor: color, onChanged: onChanged),
        ],
      ),
    );
  }

  Widget _buildCalcLine(String left, String right, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(left, style: const TextStyle(fontSize: 13, color: Colors.black87)),
        Text(right, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 13)),
      ]),
    );
  }

  Widget _buildQuizTab() {
    if (_quizIndex >= _quizzes.length) {
      return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.emoji_events_rounded, color: Color(0xFFFFD700), size: 64),
          const SizedBox(height: 16),
          Text('Quiz terminé !', style: LangHueyTextStyles.h1),
          const SizedBox(height: 8),
          Text('Score : $_quizScore / ${_quizzes.length}', style: LangHueyTextStyles.h2.copyWith(color: LangHueyColors.deepTeal)),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => setState(() { _quizIndex = 0; _quizScore = 0; _quizAnswered = false; _selectedAnswer = null; }),
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Recommencer'),
            style: ElevatedButton.styleFrom(backgroundColor: LangHueyColors.deepTeal, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          ),
        ]),
      );
    }

    final quiz = _quizzes[_quizIndex];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Question ${_quizIndex + 1}/${_quizzes.length}', style: LangHueyTextStyles.bodySmall),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(color: LangHueyColors.deepTeal, borderRadius: BorderRadius.circular(20)),
              child: Text('Score : $_quizScore', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ]),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF6C3483), Color(0xFF9B59B6)]),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(quiz['q'] as String, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ),
          const SizedBox(height: 20),
          ...(quiz['ops'] as List<int>).asMap().entries.map((e) {
            final isCorrect = e.value == quiz['a'];
            final isSelected = _selectedAnswer == e.key;
            Color bgColor = Colors.white;
            if (_quizAnswered) {
              if (isCorrect) bgColor = const Color(0xFF2ECC71);
              else if (isSelected) bgColor = const Color(0xFFE74C3C);
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: _quizAnswered ? null : () {
                  setState(() { _selectedAnswer = e.key; _quizAnswered = true; if (isCorrect) _quizScore++; });
                  isCorrect ? _audio.playCorrect() : _audio.playIncorrect();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: isSelected && !_quizAnswered ? const Color(0xFF6C3483) : Colors.black12, width: isSelected ? 2 : 1),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text('${_numberToFrench(e.value)} (${e.value})',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _quizAnswered && (isCorrect || isSelected) ? Colors.white : Colors.black87)),
                    if (_quizAnswered && isCorrect) const Icon(Icons.check_circle_rounded, color: Colors.white),
                    if (_quizAnswered && isSelected && !isCorrect) const Icon(Icons.cancel_rounded, color: Colors.white),
                  ]),
                ),
              ),
            );
          }),
          if (_quizAnswered) ...[
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => setState(() { _quizIndex++; _quizAnswered = false; _selectedAnswer = null; }),
                icon: const Icon(Icons.arrow_forward_rounded),
                label: Text(_quizIndex + 1 < _quizzes.length ? 'Question suivante' : 'Voir le score'),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6C3483), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
