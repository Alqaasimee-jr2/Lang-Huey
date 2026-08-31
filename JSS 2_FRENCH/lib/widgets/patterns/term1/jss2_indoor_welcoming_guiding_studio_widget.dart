import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS2IndoorWelcomingGuidingStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;

  const JSS2IndoorWelcomingGuidingStudioWidget({
    super.key,
    required this.lesson,
  });

  @override
  State<JSS2IndoorWelcomingGuidingStudioWidget> createState() => _JSS2IndoorWelcomingGuidingStudioWidgetState();
}

class _JSS2IndoorWelcomingGuidingStudioWidgetState extends State<JSS2IndoorWelcomingGuidingStudioWidget> {
  final JSS2AudioService _audioService = JSS2AudioService();
  int _selectedFloorIndex = 0; // 0: RDC, 1: 1er étage, 2: 2e étage

  final List<Map<String, dynamic>> _floors = [
    {
      'name': 'Rez-de-chaussée',
      'rooms': [
        {'name': 'Bureau d\'accueil & Secrétariat', 'guide': 'Entrez, je vous en prie. C\'est la première porte à droite.', 'audio': 'entrez_je_vous_en_prie'},
        {'name': 'Infirmerie scolaire', 'guide': 'Suivez-moi, c\'est au bout du couloir à gauche.', 'audio': 'suivez_moi_sil_vous_plait'},
      ],
    },
    {
      'name': 'Premier étage',
      'rooms': [
        {'name': 'Bureau du Principal', 'guide': 'Montez au premier étage, c\'est au bout du couloir à droite.', 'audio': 'le_bureau_du_principal'},
        {'name': 'Salle des professeurs', 'guide': 'Montez au premier étage, première porte à gauche.', 'audio': 'salle_des_professeurs'},
      ],
    },
    {
      'name': 'Deuxième étage',
      'rooms': [
        {'name': 'Laboratoire de langues / Informatique', 'guide': 'Prenez l\'ascenseur jusqu\'au deuxième étage.', 'audio': 'prenez_lascenseur_ou_lescalier'},
        {'name': 'Bibliothèque & Centre de documentation', 'guide': 'Prenez l\'escalier jusqu\'au 2e étage, en face du couloir.', 'audio': 'montez_au_premier_etage'},
      ],
    },
  ];

  int _selectedRoomIndex = 0;

  @override
  Widget build(BuildContext context) {
    final floor = _floors[_selectedFloorIndex];
    final rooms = floor['rooms'] as List<Map<String, dynamic>>;
    final room = rooms[_selectedRoomIndex.clamp(0, rooms.length - 1)];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Banner
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0F766E), Color(0xFF0D7377)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(Icons.meeting_room_rounded, color: LangHueyColors.amberGold, size: 36),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Studio d\'Accueil & Guidage Intérieur',
                        style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Accueillez les visiteurs et guidez-les à travers les étages (RDC, 1er, 2e étage, au bout du couloir).',
                        style: LangHueyTextStyles.bodySmall.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Floor Selector Tabs
          Row(
            children: List.generate(_floors.length, (index) {
              final f = _floors[index];
              final isSel = _selectedFloorIndex == index;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 0 : 4, right: index == 2 ? 0 : 4),
                  child: ChoiceChip(
                    label: Text(f['name'] as String, style: const TextStyle(fontSize: 12)),
                    selected: isSel,
                    selectedColor: LangHueyColors.deepTeal,
                    labelStyle: TextStyle(color: isSel ? Colors.white : Colors.black87, fontWeight: isSel ? FontWeight.bold : FontWeight.normal),
                    onSelected: (val) {
                      setState(() {
                        _selectedFloorIndex = index;
                        _selectedRoomIndex = 0;
                      });
                      _audioService.playClick();
                    },
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 18),

          // Main Interactive Layout
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Panel: Rooms on this floor
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Salles au ${floor['name']} :', style: LangHueyTextStyles.h3.copyWith(fontSize: 15)),
                      const SizedBox(height: 12),
                      ...List.generate(rooms.length, (idx) {
                        final r = rooms[idx];
                        final isSel = _selectedRoomIndex == idx;

                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: InkWell(
                            onTap: () {
                              setState(() => _selectedRoomIndex = idx);
                              _audioService.playPhrase(r['audio'] as String, term: 1);
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                              decoration: BoxDecoration(
                                color: isSel ? LangHueyColors.softTeal : Colors.grey.shade50,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSel ? LangHueyColors.deepTeal : Colors.black12,
                                  width: isSel ? 2 : 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.door_front_door_rounded, color: isSel ? LangHueyColors.deepTeal : Colors.grey),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      r['name'] as String,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isSel ? LangHueyColors.deepTeal : LangHueyColors.charcoal,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.volume_up_rounded, color: isSel ? LangHueyColors.deepTeal : Colors.grey, size: 20),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Right Panel: Receptionist Escort Prompt
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Guidage du Réceptionniste', style: LangHueyTextStyles.h3.copyWith(fontSize: 15)),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: LangHueyColors.softTeal,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: LangHueyColors.deepTeal.withOpacity(0.3)),
                        ),
                        child: Text(
                          '« ${room['guide']} »',
                          style: LangHueyTextStyles.frenchHighlight.copyWith(fontSize: 14),
                        ),
                      ),
                      const SizedBox(height: 14),
                      ElevatedButton.icon(
                        onPressed: () {
                          _audioService.playPhrase(room['audio'] as String, term: 1);
                        },
                        icon: const Icon(Icons.volume_up_rounded, size: 20),
                        label: const Text('Écouter le Guidage'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LangHueyColors.deepTeal,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
