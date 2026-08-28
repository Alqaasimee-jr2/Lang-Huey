import 'package:flutter/material.dart';
import '../../models/p4_lesson_model.dart';
import '../../services/p4_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

/// Week 3 Pattern: "Les Mots Magiques" Courtesy Chest & "La Bise" Cultural Showcase
class MagicWordsWidget extends StatefulWidget {
  final P4Lesson lesson;

  const MagicWordsWidget({super.key, required this.lesson});

  @override
  State<MagicWordsWidget> createState() => _MagicWordsWidgetState();
}

class _MagicWordsWidgetState extends State<MagicWordsWidget> {
  int _selectedWordIndex = 0;
  bool _showCulturalCard = false;

  final List<Map<String, dynamic>> _magicWords = [
    {
      'french': 'S\'il vous plaît',
      'phonetics': 'seel voo pleh',
      'english': 'Please (Formal / to Adults)',
      'usage': 'Use when asking a teacher or elder for help or permission.',
      'icon': Icons.volunteer_activism_rounded,
      'category': 'Request',
      'audio': 'sil_vous_plait',
      'subPhrases': [
        {'text': 'S\'il vous plaît (Formal)', 'audio': 'sil_vous_plait'},
      ],
    },
    {
      'french': 'S\'il te plaît',
      'phonetics': 'seel tuh pleh',
      'english': 'Please (Informal / to Classmates)',
      'usage': 'Use when borrowing a pencil or eraser from a friend in class.',
      'icon': Icons.handshake_rounded,
      'category': 'Request',
      'audio': 'sil_te_plait',
      'subPhrases': [
        {'text': 'S\'il te plaît (Informal)', 'audio': 'sil_te_plait'},
      ],
    },
    {
      'french': 'Merci / Merci beaucoup',
      'phonetics': 'mair-see / mair-see boh-koo',
      'english': 'Thank you / Thank you very much',
      'usage': 'The universal magic word of appreciation and gratitude.',
      'icon': Icons.favorite_rounded,
      'category': 'Gratitude',
      'audio': 'merci',
      'subPhrases': [
        {'text': 'Merci (Thanks)', 'audio': 'merci'},
        {'text': 'Merci beaucoup (Thank you very much)', 'audio': 'merci_beaucoup'},
      ],
    },
    {
      'french': 'De rien',
      'phonetics': 'duh ryehn',
      'english': 'You\'re welcome (Literally: "It is nothing")',
      'usage': 'Always reply with "De rien" when someone thanks you.',
      'icon': Icons.check_circle_rounded,
      'category': 'Gratitude',
      'audio': 'de_rien',
      'subPhrases': [
        {'text': 'De rien (You\'re welcome)', 'audio': 'de_rien'},
      ],
    },
    {
      'french': 'Pardon / Excusez-moi',
      'phonetics': 'pahr-dohn / ex-koo-zay mwah',
      'english': 'Sorry / Excuse me',
      'usage': 'When you accidentally bump into someone or want to pass politely.',
      'icon': Icons.front_hand_rounded,
      'category': 'Courtesy',
      'audio': 'pardon',
      'subPhrases': [
        {'text': 'Pardon (Sorry)', 'audio': 'pardon'},
        {'text': 'Excusez-moi (Excuse me)', 'audio': 'excusez_moi'},
      ],
    },
    {
      'french': 'Au revoir / À demain',
      'phonetics': 'oh ruh-vwahr / ah duh-mahn',
      'english': 'Goodbye / See you tomorrow',
      'usage': 'Polite parting words at dismissal.',
      'icon': Icons.waving_hand_rounded,
      'category': 'Farewell',
      'audio': 'au_revoir',
      'subPhrases': [
        {'text': 'Au revoir (Goodbye)', 'audio': 'au_revoir'},
        {'text': 'À demain (See you tomorrow)', 'audio': 'a_demain'},
      ],
    },
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
        border: Border.all(color: LHColors.turquoise.withOpacity(0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Header & Mode Toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _showCulturalCard ? 'Cultural Spotlight: "La Bise"' : 'Les Mots Magiques (Magic Courtesy Words)',
                    style: LHText.heading(LHColors.teal).copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _showCulturalCard
                        ? 'Compare French cheek greetings with Nigerian greetings'
                        : 'Tap any magic word to open its usage chest and hear native French pronunciation',
                    style: LHText.body(LHColors.grey).copyWith(fontSize: 15),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: LHColors.cream,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: LHColors.teal.withOpacity(0.2)),
                ),
                child: Row(
                  children: [
                    _buildTabButton('✨ Magic Words Chest', !_showCulturalCard, () {
                      setState(() => _showCulturalCard = false);
                    }),
                    _buildTabButton('🌍 Culture: La Bise', _showCulturalCard, () {
                      setState(() => _showCulturalCard = true);
                      _playAudio('la_bise');
                    }),
                  ],
                ),
              ),
            ],
          ),

          const Divider(height: 24),

          // Main View Body
          Expanded(
            child: _showCulturalCard ? _buildCulturalShowcase() : _buildMagicWordsChest(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, bool isSelected, VoidCallback onTap) {
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

  Widget _buildMagicWordsChest() {
    final word = _magicWords[_selectedWordIndex];

    return Row(
      children: [
        // Left Magic Words Grid
        Expanded(
          flex: 6,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 2.2,
            ),
            itemCount: _magicWords.length,
            itemBuilder: (context, index) {
              final item = _magicWords[index];
              final isSelected = index == _selectedWordIndex;

              return Material(
                color: isSelected ? LHColors.teal : LHColors.cream.withOpacity(0.6),
                borderRadius: BorderRadius.circular(18),
                elevation: isSelected ? 4 : 0,
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    setState(() => _selectedWordIndex = index);
                    _playAudio(item['audio'] as String?);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: isSelected ? LHColors.white : LHColors.teal.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            item['icon'] as IconData,
                            color: isSelected ? LHColors.teal : LHColors.charcoal,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item['french'] as String,
                                style: LHText.subheading(isSelected ? LHColors.white : LHColors.charcoal).copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '[ ${item['phonetics']} ]',
                                style: LHText.body(isSelected ? LHColors.gold : LHColors.teal).copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.volume_up_rounded,
                          color: isSelected ? LHColors.gold : LHColors.teal,
                          size: 22,
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

        // Right Magic Chest Usage Spotlight Card
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: LHColors.cream,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: LHColors.gold.withOpacity(0.5), width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: LHColors.teal,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'CATEGORY: ${(word['category'] as String).toUpperCase()}',
                        style: LHText.label(LHColors.white).copyWith(fontSize: 12),
                      ),
                    ),
                    IconButton.filled(
                      style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                      icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal, size: 24),
                      onPressed: () => _playAudio(word['audio'] as String?),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      word['french'] as String,
                      style: LHText.heading(LHColors.teal).copyWith(fontSize: 26),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      word['english'] as String,
                      style: LHText.subheading(LHColors.charcoal).copyWith(fontSize: 18),
                    ),
                  ],
                ),

                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: LHColors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: LHColors.turquoise.withOpacity(0.4)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Classroom Usage: ${word['usage']}',
                        style: LHText.body(LHColors.charcoal).copyWith(fontSize: 14, height: 1.4),
                      ),
                      if (word['subPhrases'] != null) ...[
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: (word['subPhrases'] as List<Map<String, String>>).map((sub) {
                            return ActionChip(
                              avatar: const Icon(Icons.volume_up_rounded, size: 16, color: LHColors.teal),
                              label: Text(
                                sub['text']!,
                                style: LHText.label(LHColors.charcoal).copyWith(fontSize: 12),
                              ),
                              backgroundColor: LHColors.cream,
                              onPressed: () => _playAudio(sub['audio']),
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: LHColors.teal.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star_rounded, color: LHColors.gold, size: 24),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Magic rule: Always use polite words with a warm smile!',
                          style: LHText.body(LHColors.teal).copyWith(fontSize: 13, fontWeight: FontWeight.w700),
                        ),
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

  Widget _buildCulturalShowcase() {
    return Row(
      children: [
        // French Custom: La Bise
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: LHColors.cream,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: LHColors.teal, width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '🇫🇷 In France: "La Bise"',
                      style: LHText.heading(LHColors.teal).copyWith(fontSize: 22),
                    ),
                    IconButton.filled(
                      style: IconButton.styleFrom(backgroundColor: LHColors.gold),
                      icon: const Icon(Icons.volume_up_rounded, color: LHColors.charcoal),
                      onPressed: () => _playAudio('la_bise'),
                    ),
                  ],
                ),
                const Divider(),
                Text(
                  'Friends and family greet each other by lightly touching cheeks and making a soft kissing sound in the air ("la bise"). Depending on the French region, people give 2, 3, or even 4 cheek kisses!',
                  style: LHText.body(LHColors.charcoal).copyWith(fontSize: 16, height: 1.5),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: LHColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Key phrase: "On se fait la bise ?" (Shall we greet with la bise?)',
                    style: LHText.body(LHColors.teal).copyWith(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 24),

        // Nigerian Comparison
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: LHColors.cream,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: LHColors.gold, width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '🇳🇬 In Nigeria: Cultural Respect',
                  style: LHText.heading(LHColors.charcoal).copyWith(fontSize: 22),
                ),
                const Divider(),
                Text(
                  'In Nigeria, we greet elders and friends with deep respect through firm warm handshakes, bowing slightly, kneeling (Idobale), or waving happily to our peers.',
                  style: LHText.body(LHColors.charcoal).copyWith(fontSize: 16, height: 1.5),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: LHColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Lesson: Both cultures prize warmth, respect, and kindness!',
                    style: LHText.body(LHColors.charcoal).copyWith(fontSize: 14, fontWeight: FontWeight.w700),
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
