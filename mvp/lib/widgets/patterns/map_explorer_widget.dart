import 'package:flutter/material.dart';
import '../../models/p4_lesson_model.dart';
import '../../services/p4_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

/// Week 1 Pattern: Interactive Border Countries of Nigeria & French Alphabet Soundboard
class MapExplorerWidget extends StatefulWidget {
  final P4Lesson lesson;

  const MapExplorerWidget({super.key, required this.lesson});

  @override
  State<MapExplorerWidget> createState() => _MapExplorerWidgetState();
}

class _MapExplorerWidgetState extends State<MapExplorerWidget> {
  int _selectedCountryIndex = 0;
  int _selectedAlphabetIndex = 0;
  bool _showAlphabet = false;

  final List<Map<String, String>> _countries = [
    {
      'name': 'Le Bénin',
      'direction': 'West (Ouest)',
      'capital': 'Porto-Novo',
      'border': 'Western border (Seme & Idiroko)',
      'greeting': 'Bonjour le Bénin !',
      'french': 'Bénin',
      'audio': 'le_benin',
      'flag': 'assets/images/p4_term1/flag_benin.png',
      'color': '0xFF0D7377',
    },
    {
      'name': 'Le Niger',
      'direction': 'North (Nord)',
      'capital': 'Niamey',
      'border': 'Northern border (Sokoto, Katsina, Borno)',
      'greeting': 'Bonjour le Niger !',
      'french': 'Niger',
      'audio': 'le_niger',
      'flag': 'assets/images/p4_term1/flag_niger.png',
      'color': '0xFF14BDCC',
    },
    {
      'name': 'Le Tchad',
      'direction': 'North-East (Nord-Est)',
      'capital': 'N\'Djamena',
      'border': 'North-Eastern border (Lake Chad)',
      'greeting': 'Bonjour le Tchad !',
      'french': 'Tchad',
      'audio': 'le_tchad',
      'flag': 'assets/images/p4_term1/flag_tchad.png',
      'color': '0xFFF4A832',
    },
    {
      'name': 'Le Cameroun',
      'direction': 'East (Est)',
      'capital': 'Yaoundé',
      'border': 'Eastern border (Taraba, Adamawa, Cross River)',
      'greeting': 'Bonjour le Cameroun !',
      'french': 'Cameroun',
      'audio': 'le_cameroun',
      'flag': 'assets/images/p4_term1/flag_cameroun.png',
      'color': '0xFF4CAF82',
    },
  ];

  final List<Map<String, String>> _alphabet = [
    {'letter': 'A', 'sound': 'ah', 'hint': 'Open wide like "ah" in father', 'example': 'Afrique', 'audio': 'alphabet_a'},
    {'letter': 'B', 'sound': 'bay', 'hint': 'Short and crisp like "bay"', 'example': 'Bénin', 'audio': 'alphabet_b'},
    {'letter': 'C', 'sound': 'say', 'hint': 'Smooth soft "say"', 'example': 'Cameroun', 'audio': 'alphabet_c'},
    {'letter': 'D', 'sound': 'day', 'hint': 'Tongue behind top teeth', 'example': 'Directeur', 'audio': 'alphabet_d'},
    {'letter': 'E', 'sound': 'uh', 'hint': 'Relaxed jaw like "uh" in "the"', 'example': 'École', 'audio': 'alphabet_e'},
  ];

  void _playAudio(String? audioKey) {
    if (audioKey != null && audioKey.isNotEmpty) {
      P4AudioService().playPhrase(audioKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mode Switcher Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _showAlphabet
                        ? 'French Alphabet Soundboard (A to E)'
                        : 'Nigeria\'s Francophone Neighbor Map Lab',
                    style: LHText.heading(LHColors.teal).copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _showAlphabet
                        ? 'Tap any letter to hear the native French pronunciation mouth shape'
                        : 'Tap any neighbor country to explore its location, border & pronunciation',
                    style: LHText.body(LHColors.grey).copyWith(fontSize: 15),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: LHColors.cream,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: LHColors.teal.withValues(alpha: 0.2)),
                ),
                child: Row(
                  children: [
                    _buildModeButton('🌍 4 Border Neighbors', !_showAlphabet, () {
                      setState(() => _showAlphabet = false);
                    }),
                    _buildModeButton('🔤 Alphabet (A–E)', _showAlphabet, () {
                      setState(() => _showAlphabet = true);
                    }),
                  ],
                ),
              ),
            ],
          ),

          const Divider(height: 24),

          // Main Interactive Body
          Expanded(
            child: _showAlphabet ? _buildAlphabetSoundboard() : _buildMapNeighborExplorer(),
          ),
        ],
      ),
    );
  }

  Widget _buildModeButton(String label, bool isSelected, VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? LHColors.teal : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: LHText.body(isSelected ? LHColors.white : LHColors.charcoal).copyWith(
            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildMapNeighborExplorer() {
    final country = _countries[_selectedCountryIndex];

    return Row(
      children: [
        // Left: 4 Country Selector Cards
        Expanded(
          flex: 5,
          child: ListView.separated(
            itemCount: _countries.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final c = _countries[index];
              final isSelected = index == _selectedCountryIndex;
              final color = Color(int.parse(c['color']!));

              return Material(
                color: isSelected ? color : LHColors.cream.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(18),
                elevation: isSelected ? 4 : 0,
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    setState(() => _selectedCountryIndex = index);
                    _playAudio(c['audio']);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: isSelected ? LHColors.white : color.withValues(alpha: 0.15),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.location_on_rounded,
                                  color: isSelected ? color : LHColors.charcoal,
                                  size: 24,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  c['name']!,
                                  style: LHText.subheading(isSelected ? LHColors.white : LHColors.charcoal).copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  c['direction']!,
                                  style: LHText.body(isSelected ? LHColors.white.withValues(alpha: 0.85) : LHColors.grey).copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.volume_up_rounded,
                            color: isSelected ? LHColors.gold : LHColors.teal,
                            size: 26,
                          ),
                          onPressed: () => _playAudio(c['audio']),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(width: 24),

        // Right: Country Spotlight Card with Flag Badge
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: LHColors.cream,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: LHColors.teal.withValues(alpha: 0.3), width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: LHColors.teal,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'BORDER DIRECTION: ${country['direction']!.toUpperCase()}',
                        style: LHText.label(LHColors.white).copyWith(fontSize: 12),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () => _playAudio(country['audio']),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: LHColors.gold,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 20),
                            const SizedBox(width: 6),
                            Text(
                              'Listen',
                              style: LHText.label(LHColors.charcoal).copyWith(fontSize: 12, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    if (country['flag'] != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          country['flag']!,
                          width: 90,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const SizedBox(),
                        ),
                      ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            country['name']!,
                            style: LHText.heading(LHColors.teal).copyWith(fontSize: 28),
                          ),
                          Text(
                            'Capital: ${country['capital']}',
                            style: LHText.subheading(LHColors.charcoal).copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: LHColors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.4)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.pin_drop_rounded, color: LHColors.teal, size: 24),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Nigeria Border corridor: ${country['border']}',
                          style: LHText.body(LHColors.charcoal).copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: LHColors.teal.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.record_voice_over_rounded, color: LHColors.teal, size: 24),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'French Pronunciation: "${country['name']}"',
                          style: LHText.body(LHColors.teal).copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.volume_up_rounded, color: LHColors.teal),
                        onPressed: () => _playAudio(country['audio']),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAlphabetSoundboard() {
    return Row(
      children: [
        // 5 Letter soundboard tiles
        Expanded(
          flex: 6,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.85,
            ),
            itemCount: _alphabet.length,
            itemBuilder: (context, idx) {
              final item = _alphabet[idx];
              final isSelected = idx == _selectedAlphabetIndex;

              return Material(
                color: isSelected ? LHColors.teal : LHColors.cream.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(18),
                elevation: isSelected ? 4 : 0,
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    setState(() => _selectedAlphabetIndex = idx);
                    _playAudio(item['audio']);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['letter']!,
                          style: LHText.heading(isSelected ? LHColors.white : LHColors.teal).copyWith(
                            fontSize: 36,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: isSelected ? LHColors.gold : LHColors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '[ ${item['sound']} ]',
                            style: LHText.body(LHColors.charcoal).copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.volume_up_rounded,
                          size: 20,
                          color: isSelected ? LHColors.white : LHColors.teal,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(width: 24),

        // Letter details & pronunciation coach card
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: LHColors.cream,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: LHColors.gold.withValues(alpha: 0.5), width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Letter ${_alphabet[_selectedAlphabetIndex]['letter']}',
                      style: LHText.heading(LHColors.teal).copyWith(fontSize: 26),
                    ),
                    IconButton.filled(
                      style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                      icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal),
                      onPressed: () => _playAudio(_alphabet[_selectedAlphabetIndex]['audio']),
                    ),
                  ],
                ),
                const Divider(),
                Text(
                  'Phonetic Sound: [ ${_alphabet[_selectedAlphabetIndex]['sound']} ]',
                  style: LHText.subheading(LHColors.charcoal).copyWith(fontSize: 20),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: LHColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Mouth Guide: ${_alphabet[_selectedAlphabetIndex]['hint']}',
                    style: LHText.body(LHColors.charcoal).copyWith(fontSize: 15, height: 1.4),
                  ),
                ),
                Text(
                  'Example Word: "${_alphabet[_selectedAlphabetIndex]['example']}"',
                  style: LHText.body(LHColors.teal).copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
