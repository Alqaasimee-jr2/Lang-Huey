import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5AlphabetAndRevisionWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5AlphabetAndRevisionWidget({super.key, required this.onComplete});

  @override
  State<P5AlphabetAndRevisionWidget> createState() => _P5AlphabetAndRevisionWidgetState();
}

class _P5AlphabetAndRevisionWidgetState extends State<P5AlphabetAndRevisionWidget> {
  final P5AudioService _audioService = P5AudioService();
  int _activeTab = 0; // 0: Alphabet Soundboard, 1: Greetings Dial, 2: Numbers 1-20
  String? _selectedLetter;

  final List<Map<String, String>> _alphabet = [
    {'letter': 'A', 'sound': 'ah', 'audio': 'alpha_a'},
    {'letter': 'B', 'sound': 'bay', 'audio': 'alpha_b'},
    {'letter': 'C', 'sound': 'say', 'audio': 'alpha_c'},
    {'letter': 'D', 'sound': 'day', 'audio': 'alpha_d'},
    {'letter': 'E', 'sound': 'euh', 'audio': 'alpha_e'},
    {'letter': 'F', 'sound': 'eff', 'audio': 'alpha_f'},
    {'letter': 'G', 'sound': 'zhay', 'audio': 'alpha_g'},
    {'letter': 'H', 'sound': 'ash', 'audio': 'alpha_h'},
    {'letter': 'I', 'sound': 'ee', 'audio': 'alpha_i'},
    {'letter': 'J', 'sound': 'zhee', 'audio': 'alpha_j'},
    {'letter': 'K', 'sound': 'kah', 'audio': 'alpha_k'},
    {'letter': 'L', 'sound': 'ell', 'audio': 'alpha_l'},
    {'letter': 'M', 'sound': 'em', 'audio': 'alpha_m'},
    {'letter': 'N', 'sound': 'en', 'audio': 'alpha_n'},
    {'letter': 'O', 'sound': 'oh', 'audio': 'alpha_o'},
    {'letter': 'P', 'sound': 'pay', 'audio': 'alpha_p'},
    {'letter': 'Q', 'sound': 'kew', 'audio': 'alpha_q'},
    {'letter': 'R', 'sound': 'air', 'audio': 'alpha_r'},
    {'letter': 'S', 'sound': 'ess', 'audio': 'alpha_s'},
    {'letter': 'T', 'sound': 'tay', 'audio': 'alpha_t'},
    {'letter': 'U', 'sound': 'ew', 'audio': 'alpha_u'},
    {'letter': 'V', 'sound': 'vay', 'audio': 'alpha_v'},
    {'letter': 'W', 'sound': 'doobl-vay', 'audio': 'alpha_w'},
    {'letter': 'X', 'sound': 'eeks', 'audio': 'alpha_x'},
    {'letter': 'Y', 'sound': 'ee-grek', 'audio': 'alpha_y'},
    {'letter': 'Z', 'sound': 'zed', 'audio': 'alpha_z'},
  ];

  final List<Map<String, dynamic>> _greetings = [
    {
      'title': 'Bonjour',
      'sub': 'Morning & Daytime',
      'phonetic': 'bohn-zhoor',
      'icon': Icons.wb_sunny_rounded,
      'color': P5Colors.teal,
      'audio': 'bonjour',
    },
    {
      'title': 'Bonsoir',
      'sub': 'Evening Departure',
      'phonetic': 'bohn-swahr',
      'icon': Icons.nightlight_round,
      'color': P5Colors.indigo,
      'audio': 'bonsoir',
    },
    {
      'title': 'Salut !',
      'sub': 'Casual Friends',
      'phonetic': 'sah-loo',
      'icon': Icons.waving_hand_rounded,
      'color': P5Colors.orange,
      'audio': 'salut',
    },
    {
      'title': 'Au revoir',
      'sub': 'Polite Goodbye',
      'phonetic': 'oh ruh-vwahr',
      'icon': Icons.door_back_door_rounded,
      'color': P5Colors.purple,
      'audio': 'au_revoir',
    },
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
          // Sub-Tab Switcher
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildTabButton(0, '1. French Alphabet Soundboard', Icons.font_download_rounded),
                  const SizedBox(width: 12),
                  _buildTabButton(1, '2. Time-of-Day Greetings', Icons.access_time_filled_rounded),
                  const SizedBox(width: 12),
                  _buildTabButton(2, '3. Numbers 1–20 Relay', Icons.numbers_rounded),
                ],
              ),
              ElevatedButton.icon(
                onPressed: widget.onComplete,
                icon: const Icon(Icons.check_circle_rounded, color: P5Colors.white),
                label: const Text('Complete Station', style: TextStyle(fontWeight: FontWeight.bold)),
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

          // Main View Content
          Expanded(
            child: _activeTab == 0
                ? _buildAlphabetView()
                : _activeTab == 1
                    ? _buildGreetingsView()
                    : _buildNumbersView(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(int index, String label, IconData icon) {
    final isSelected = _activeTab == index;
    return InkWell(
      onTap: () {
        setState(() => _activeTab = index);
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

  Widget _buildAlphabetView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Touch any French letter to hear its authentic phonetic name:',
              style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 18),
            ),
            if (_selectedLetter != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: P5Colors.gold.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: P5Colors.gold, width: 2),
                ),
                child: Text(
                  'Selected: $_selectedLetter',
                  style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
        const SizedBox(height: 14),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.3,
            ),
            itemCount: _alphabet.length,
            itemBuilder: (context, index) {
              final item = _alphabet[index];
              final isSelected = _selectedLetter == item['letter'];
              return Material(
                color: isSelected ? P5Colors.turquoise : P5Colors.cream,
                borderRadius: BorderRadius.circular(14),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () {
                    setState(() => _selectedLetter = item['letter']);
                    _audioService.playPhrase(item['audio']!, term: 1);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item['letter']!,
                        style: P5Text.heading(isSelected ? P5Colors.white : P5Colors.teal).copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        '(${item['sound']!})',
                        style: P5Text.caption(isSelected ? P5Colors.white : P5Colors.charcoal).copyWith(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGreetingsView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.2,
      ),
      itemCount: _greetings.length,
      itemBuilder: (context, index) {
        final g = _greetings[index];
        return Material(
          color: (g['color'] as Color).withOpacity(0.08),
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => _audioService.playPhrase(g['audio'] as String, term: 1),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: g['color'] as Color,
                    child: Icon(g['icon'] as IconData, color: P5Colors.white, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(g['title'] as String, style: P5Text.frenchPhrase(g['color'] as Color)),
                        Text('"${g['phonetic']}"', style: P5Text.phonetic()),
                        const SizedBox(height: 4),
                        Text(g['sub'] as String, style: P5Text.caption(P5Colors.charcoal)),
                      ],
                    ),
                  ),
                  const Icon(Icons.volume_up_rounded, color: P5Colors.teal, size: 28),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNumbersView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rapid 1 to 20 Counting Sprint (Listen & Repeat):',
          style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 18),
        ),
        const SizedBox(height: 14),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.8,
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              final num = index + 1;
              return Material(
                color: P5Colors.cream,
                borderRadius: BorderRadius.circular(14),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () => _audioService.playPhrase('num_$num', term: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: P5Colors.teal,
                        child: Text('$num', style: const TextStyle(color: P5Colors.white, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.volume_up_rounded, size: 18, color: P5Colors.teal),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
