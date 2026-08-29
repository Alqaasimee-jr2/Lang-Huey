import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5ClassroomBorrowingWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5ClassroomBorrowingWidget({super.key, required this.onComplete});

  @override
  State<P5ClassroomBorrowingWidget> createState() => _P5ClassroomBorrowingWidgetState();
}

class _P5ClassroomBorrowingWidgetState extends State<P5ClassroomBorrowingWidget> {
  final P5AudioService _audioService = P5AudioService();
  String _selectedItem = 'ton stylo';

  final List<Map<String, dynamic>> _stationery = [
    {'name': 'Le stylo', 'possessive': 'ton stylo', 'isFem': false, 'audio': 'le_stylo', 'icon': Icons.edit_rounded},
    {'name': 'Le crayon', 'possessive': 'ton crayon', 'isFem': false, 'audio': 'le_crayon', 'icon': Icons.create_rounded},
    {'name': 'La règle', 'possessive': 'ta règle', 'isFem': true, 'audio': 'la_regle', 'icon': Icons.straighten_rounded},
    {'name': 'La gomme', 'possessive': 'ta gomme', 'isFem': true, 'audio': 'la_gomme', 'icon': Icons.layers_clear_rounded},
    {'name': 'Le cahier', 'possessive': 'ton cahier', 'isFem': false, 'audio': 'le_livre_et_le_cahier', 'icon': Icons.book_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    final politeSentence = 'Prête-moi $_selectedItem, s\'il te plaît !';

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: P5Colors.cream,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: P5Colors.teal, width: 3),
      ),
      child: Row(
        children: [
          // Left: Stationery Grid
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('1. Choisir un Objet de Classe :', style: P5Text.subheading(P5Colors.charcoal)),
                const SizedBox(height: 12),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.3,
                    ),
                    itemCount: _stationery.length,
                    itemBuilder: (context, index) {
                      final item = _stationery[index];
                      final isSel = item['possessive'] == _selectedItem;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedItem = item['possessive'];
                          });
                          _audioService.playPhrase(item['audio'], term: 3);
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isSel ? P5Colors.teal : P5Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSel ? P5Colors.gold : P5Colors.teal.withValues(alpha: 0.3),
                              width: isSel ? 2.5 : 1,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(item['icon'] as IconData, size: 32, color: isSel ? P5Colors.gold : P5Colors.teal),
                              const SizedBox(height: 6),
                              Text(
                                item['name'] as String,
                                style: P5Text.body(isSel ? P5Colors.white : P5Colors.charcoal).copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                item['isFem'] ? 'Féminin (ta)' : 'Masculin (ton)',
                                style: P5Text.caption(isSel ? P5Colors.cream : P5Colors.charcoal).copyWith(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 20),

          // Right: Polite Request Station
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: P5Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: P5Colors.gold, width: 2.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Demande Polie de Prêt', style: P5Text.subheading(P5Colors.teal), textAlign: TextAlign.center),
                  const Divider(height: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.handshake_rounded, size: 48, color: P5Colors.gold),
                        const SizedBox(height: 12),
                        Text(
                          politeSentence,
                          style: P5Text.heading(P5Colors.charcoal).copyWith(fontSize: 19),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'English: Lend me your ${_selectedItem.replaceAll('ton ', '').replaceAll('ta ', '')}, please!',
                          style: P5Text.caption(P5Colors.teal).copyWith(fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: P5Colors.teal,
                      foregroundColor: P5Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      _audioService.playPhrase('prete_moi_ton_stylo', term: 3);
                    },
                    icon: const Icon(Icons.volume_up_rounded),
                    label: const Text('Prononcer la Demande'),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: P5Colors.gold,
                      foregroundColor: P5Colors.charcoal,
                    ),
                    onPressed: () {
                      _audioService.playClick();
                      widget.onComplete();
                    },
                    icon: const Icon(Icons.check_circle_rounded),
                    label: const Text('Valider le Prêt'),
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
