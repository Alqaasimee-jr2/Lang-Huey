import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5HeadAndFaceExplorerWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5HeadAndFaceExplorerWidget({super.key, required this.onComplete});

  @override
  State<P5HeadAndFaceExplorerWidget> createState() => _P5HeadAndFaceExplorerWidgetState();
}

class _P5HeadAndFaceExplorerWidgetState extends State<P5HeadAndFaceExplorerWidget> {
  final P5AudioService _audioService = P5AudioService();
  String? _selectedPart;

  final List<Map<String, dynamic>> _headParts = [
    {'name': 'La tête', 'en': 'The head', 'phonetic': 'lah tett', 'icon': Icons.face_rounded, 'audio': 'la_tete'},
    {'name': 'Les cheveux', 'en': 'The hair (Plural)', 'phonetic': 'lay shuh-vuh', 'icon': Icons.brush_rounded, 'audio': 'les_cheveux'},
    {'name': 'Les yeux', 'en': 'The eyes (l\'œil)', 'phonetic': 'lay zyuh', 'icon': Icons.visibility_rounded, 'audio': 'les_yeux'},
    {'name': 'Le nez', 'en': 'The nose', 'phonetic': 'luh nay', 'icon': Icons.air_rounded, 'audio': 'le_nez'},
    {'name': 'La bouche', 'en': 'The mouth', 'phonetic': 'lah boosh', 'icon': Icons.record_voice_over_rounded, 'audio': 'la_bouche'},
    {'name': 'Les oreilles', 'en': 'The ears', 'phonetic': 'lay zoh-ray', 'icon': Icons.hearing_rounded, 'audio': 'les_oreilles'},
    {'name': 'Les dents', 'en': 'The teeth', 'phonetic': 'lay dahn', 'icon': Icons.sentiment_satisfied_alt_rounded, 'audio': 'les_dents'},
    {'name': 'Le visage', 'en': 'The face', 'phonetic': 'luh vee-zahzh', 'icon': Icons.face_retouching_natural_rounded, 'audio': 'le_visage'},
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
                  const Icon(Icons.face_retouching_natural_rounded, color: P5Colors.teal, size: 28),
                  const SizedBox(width: 10),
                  Text(
                    'Anatomy Station: La Tête et Le Visage',
                    style: P5Text.heading(P5Colors.teal).copyWith(fontSize: 22),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: widget.onComplete,
                icon: const Icon(Icons.check_circle_rounded, color: P5Colors.white),
                label: const Text('Complete Anatomy Lab', style: TextStyle(fontWeight: FontWeight.bold)),
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
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 1.4,
              ),
              itemCount: _headParts.length,
              itemBuilder: (context, index) {
                final part = _headParts[index];
                final isSelected = _selectedPart == part['name'];
                return Material(
                  color: isSelected ? P5Colors.turquoise.withOpacity(0.3) : P5Colors.cream,
                  borderRadius: BorderRadius.circular(18),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      setState(() => _selectedPart = part['name'] as String);
                      _audioService.playPhrase(part['audio'] as String, term: 1);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: P5Colors.teal,
                            child: Icon(part['icon'] as IconData, color: P5Colors.white, size: 24),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            part['name'] as String,
                            style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 16, fontWeight: FontWeight.w800),
                            textAlign: TextAlign.center,
                          ),
                          Text('"${part['phonetic']}"', style: P5Text.caption(P5Colors.gold)),
                          Text(part['en'] as String, style: P5Text.caption(P5Colors.charcoal).copyWith(fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
