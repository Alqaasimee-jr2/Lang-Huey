import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5NumberStudio51to60Widget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5NumberStudio51to60Widget({super.key, required this.onComplete});

  @override
  State<P5NumberStudio51to60Widget> createState() => _P5NumberStudio51to60WidgetState();
}

class _P5NumberStudio51to60WidgetState extends State<P5NumberStudio51to60Widget> {
  final P5AudioService _audioService = P5AudioService();
  int _activeView = 0; // 0: Master Tens Board (10-60), 1: 51-60 Numbers, 2: Subtraction Challenge

  final List<Map<String, dynamic>> _tens = [
    {'num': 10, 'french': 'Dix', 'phonetic': 'dees', 'audio': 'num_10'},
    {'num': 20, 'french': 'Vingt', 'phonetic': 'van', 'audio': 'num_20'},
    {'num': 30, 'french': 'Trente', 'phonetic': 'trahnt', 'audio': 'num_30'},
    {'num': 40, 'french': 'Quarante', 'phonetic': 'kah-rahnt', 'audio': 'num_40'},
    {'num': 50, 'french': 'Cinquante', 'phonetic': 'sank-ahnt', 'audio': 'num_50'},
    {'num': 60, 'french': 'Soixante', 'phonetic': 'swah-sahnt', 'audio': 'num_60'},
  ];

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
                  _buildTab(0, '1. Master Tens (10–60)', Icons.format_list_numbered_rounded),
                  const SizedBox(width: 12),
                  _buildTab(1, '2. Numbers 51–60 Relay', Icons.looks_6_rounded),
                  const SizedBox(width: 12),
                  _buildTab(2, '3. Mental Subtraction Lab', Icons.remove_circle_outline_rounded),
                ],
              ),
              ElevatedButton.icon(
                onPressed: widget.onComplete,
                icon: const Icon(Icons.check_circle_rounded, color: P5Colors.white),
                label: const Text('Complete Tens Lab', style: TextStyle(fontWeight: FontWeight.bold)),
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
            child: _activeView == 0
                ? _buildTensBoard()
                : _activeView == 1
                    ? _buildNumbers51to60()
                    : _buildSubtractionLab(),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(int index, String label, IconData icon) {
    final isSelected = _activeView == index;
    return InkWell(
      onTap: () {
        setState(() => _activeView = index);
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

  Widget _buildTensBoard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Master All Base Tens (10 to 60) - Touch cards to listen and practice speed recite:',
          style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 17),
        ),
        const SizedBox(height: 14),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 2.1,
            ),
            itemCount: _tens.length,
            itemBuilder: (context, index) {
              final t = _tens[index];
              return Material(
                color: P5Colors.cream,
                borderRadius: BorderRadius.circular(18),
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () => _audioService.playPhrase(t['audio'] as String, term: 1),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: P5Colors.teal,
                          child: Text(
                            '${t['num']}',
                            style: const TextStyle(color: P5Colors.white, fontWeight: FontWeight.w900, fontSize: 20),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(t['french'] as String, style: P5Text.frenchPhrase(P5Colors.charcoal)),
                              Text('"${t['phonetic']}"', style: P5Text.caption(P5Colors.teal)),
                            ],
                          ),
                        ),
                        const Icon(Icons.volume_up_rounded, color: P5Colors.teal, size: 24),
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

  Widget _buildNumbers51to60() {
    final numbers51to60 = [
      {'num': 51, 'french': 'Cinquante et un', 'audio': 'num_51'},
      {'num': 52, 'french': 'Cinquante-deux', 'audio': 'num_52'},
      {'num': 53, 'french': 'Cinquante-trois', 'audio': 'num_53'},
      {'num': 54, 'french': 'Cinquante-quatre', 'audio': 'num_54'},
      {'num': 55, 'french': 'Cinquante-cinq', 'audio': 'num_55'},
      {'num': 56, 'french': 'Cinquante-six', 'audio': 'num_56'},
      {'num': 57, 'french': 'Cinquante-sept', 'audio': 'num_57'},
      {'num': 58, 'french': 'Cinquante-huit', 'audio': 'num_58'},
      {'num': 59, 'french': 'Cinquante-neuf', 'audio': 'num_59'},
      {'num': 60, 'french': 'Soixante', 'audio': 'num_60'},
    ];
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.4,
      ),
      itemCount: numbers51to60.length,
      itemBuilder: (context, index) {
        final n = numbers51to60[index];
        return Material(
          color: P5Colors.cream,
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () => _audioService.playPhrase(n['audio'] as String, term: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: n['num'] == 60 ? P5Colors.gold : P5Colors.teal,
                  child: Text('${n['num']}', style: const TextStyle(color: P5Colors.white, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 6),
                Text(
                  n['french'] as String,
                  style: P5Text.body(P5Colors.charcoal).copyWith(fontSize: 13, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSubtractionLab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Mental Subtraction with "Moins":', style: P5Text.heading(P5Colors.teal)),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: P5Colors.cream,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: P5Colors.turquoise),
          ),
          child: Text(
            'Soixante (60)  moins  dix (10)  font  Cinquante (50)',
            style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () => _audioService.playPhrase('num_50', term: 1),
          icon: const Icon(Icons.volume_up_rounded),
          label: const Text('Listen: "Soixante moins dix font cinquante"'),
        ),
      ],
    );
  }
}
