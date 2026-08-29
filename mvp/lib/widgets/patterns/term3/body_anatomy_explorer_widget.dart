import 'package:flutter/material.dart';
import '../../../services/p4_audio_service.dart';

/// Bespoke Smartboard Pattern Widget for Week 7: Body Anatomy Explorer
class BodyAnatomyExplorerWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const BodyAnatomyExplorerWidget({
    Key? key,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<BodyAnatomyExplorerWidget> createState() => _BodyAnatomyExplorerWidgetState();
}

class _BodyAnatomyExplorerWidgetState extends State<BodyAnatomyExplorerWidget> {
  final P4AudioService _audioService = P4AudioService();
  int _activeNodeIndex = 0;

  final List<Map<String, dynamic>> _bodyParts = [
    {
      'french': 'La tête',
      'english': 'The head',
      'article': 'Féminin (La)',
      'plural': 'Les têtes',
      'audioKey': 'la_tete',
      'icon': Icons.face_rounded,
      'color': const Color(0xFF0D7377),
    },
    {
      'french': 'Les yeux',
      'english': 'The eyes',
      'article': 'Pluriel irrégulier (Les)',
      'plural': 'Singulier: L\'œil',
      'audioKey': 'les_yeux',
      'icon': Icons.visibility_rounded,
      'color': const Color(0xFF0284C7),
    },
    {
      'french': 'Le nez',
      'english': 'The nose',
      'article': 'Masculin (Le)',
      'plural': 'Les nez (Invariable)',
      'audioKey': 'le_nez',
      'icon': Icons.sentiment_satisfied_rounded,
      'color': const Color(0xFFD97706),
    },
    {
      'french': 'La bouche',
      'english': 'The mouth',
      'article': 'Féminin (La)',
      'plural': 'Les bouches',
      'audioKey': 'la_bouche',
      'icon': Icons.mood_rounded,
      'color': const Color(0xFFE11D48),
    },
    {
      'french': 'Les oreilles',
      'english': 'The ears',
      'article': 'Pluriel (Les)',
      'plural': 'Singulier: L\'oreille',
      'audioKey': 'les_oreilles',
      'icon': Icons.hearing_rounded,
      'color': const Color(0xFF10B981),
    },
    {
      'french': 'Le bras / Les bras',
      'english': 'The arm / The arms',
      'article': 'Masculin (Le / Les)',
      'plural': 'Invariable (Ends in \'s\')',
      'audioKey': 'le_bras',
      'icon': Icons.fitness_center_rounded,
      'color': const Color(0xFF6366F1),
    },
    {
      'french': 'La main / Les mains',
      'english': 'The hand / The hands',
      'article': 'Féminin (La / Les)',
      'plural': 'Ajouter \'s\' -> mains',
      'audioKey': 'la_main',
      'icon': Icons.pan_tool_rounded,
      'color': const Color(0xFF14BDCC),
    },
    {
      'french': 'La jambe / Les jambes',
      'english': 'The leg / The legs',
      'article': 'Féminin (La / Les)',
      'plural': 'Ajouter \'s\' -> jambes',
      'audioKey': 'la_jambe',
      'icon': Icons.directions_walk_rounded,
      'color': const Color(0xFF8B5CF6),
    },
    {
      'french': 'Le pied / Les pieds',
      'english': 'The foot / The feet',
      'article': 'Masculin (Le / Les)',
      'plural': 'Ajouter \'s\' -> pieds',
      'audioKey': 'le_pied',
      'icon': Icons.do_not_step_rounded,
      'color': const Color(0xFFF4A832),
    },
  ];

  void _playAudio(String key) {
    _audioService.playPhrase(key, term: 3);
  }

  @override
  Widget build(BuildContext context) {
    final activePart = _bodyParts[_activeNodeIndex];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0D7377), Color(0xFF14BDCC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.accessibility_new_rounded, color: Colors.white, size: 36),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "LES PARTIES DU CORPS · HUMAN ANATOMY EXPLORER",
                        style: TextStyle(
                          color: Color(0xFFF4A832),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Découvrir le Corps Humain",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Tap any anatomical node to hear its French name and study its grammatical gender & plural form!",
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Active Body Node Spotlight
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: (activePart['color'] as Color).withValues(alpha: 0.3), width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: (activePart['color'] as Color).withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(activePart['icon'] as IconData, color: activePart['color'] as Color, size: 48),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: activePart['color'] as Color,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              activePart['article'] as String,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            activePart['plural'] as String,
                            style: TextStyle(
                              color: activePart['color'] as Color,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        activePart['french'] as String,
                        style: const TextStyle(
                          color: Color(0xFF1E293B),
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        activePart['english'] as String,
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () => _playAudio(activePart['audioKey'] as String),
                        icon: const Icon(Icons.volume_up_rounded, size: 20),
                        label: const Text("Listen Pronunciation (Écouter)"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: activePart['color'] as Color,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 9 Anatomical Nodes Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _bodyParts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.0,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final part = _bodyParts[index];
              final isSelected = index == _activeNodeIndex;
              return InkWell(
                onTap: () {
                  setState(() => _activeNodeIndex = index);
                  _playAudio(part['audioKey'] as String);
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? (part['color'] as Color) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? (part['color'] as Color) : const Color(0xFFE2E8F0),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        part['icon'] as IconData,
                        color: isSelected ? Colors.white : (part['color'] as Color),
                        size: 28,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              part['french'] as String,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: isSelected ? Colors.white : const Color(0xFF1E293B),
                                fontWeight: FontWeight.w900,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              part['english'] as String,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: isSelected ? Colors.white.withValues(alpha: 0.9) : const Color(0xFF64748B),
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),

          // Completion Button
          ElevatedButton.icon(
            onPressed: () {
              _audioService.playSfx(P4SfxType.correct);
              widget.onComplete();
            },
            icon: const Icon(Icons.check_circle_rounded, size: 22),
            label: const Text("Complete Anatomy Lab & Continue", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0D7377),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
        ],
      ),
    );
  }
}
