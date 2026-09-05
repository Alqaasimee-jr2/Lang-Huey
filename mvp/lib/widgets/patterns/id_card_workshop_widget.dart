import 'package:flutter/material.dart';
import '../../models/p4_lesson_model.dart';
import '../../services/p4_audio_service.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

/// Week 10 Pattern: "Carte d'Identité Scolaire" Workshop & Speech Presentation Podium
class IdCardWorkshopWidget extends StatefulWidget {
  final P4Lesson lesson;

  const IdCardWorkshopWidget({super.key, required this.lesson});

  @override
  State<IdCardWorkshopWidget> createState() => _IdCardWorkshopWidgetState();
}

class _IdCardWorkshopWidgetState extends State<IdCardWorkshopWidget> {
  int _tabIndex = 0; // 0: ID Card Generator, 1: Speech Presentation Podium
  String _selectedSurname = 'ADEBAYO';
  String _selectedFirstname = 'Chiamaka';
  int _selectedAge = 9;
  bool _isGirl = true;

  final List<String> _surnames = ['ADEBAYO', 'OKONKWO', 'IBRAHIM', 'BELLO', 'DANJUMA', 'BALOGUN'];
  final List<String> _firstnames = ['Chiamaka', 'Zainab', 'Emeka', 'Tunde', 'Fatima', 'Kofi'];

  void _playAudio(String? key) {
    if (key != null && key.isNotEmpty) {
      P4AudioService().playPhrase(key);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Mode Switcher
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTab(
              title: '🪪 1. "Carte d\'Identité" ID Card Maker',
              isActive: _tabIndex == 0,
              onTap: () => setState(() => _tabIndex = 0),
            ),
            const SizedBox(width: 16),
            _buildTab(
              title: '🎤 2. Classroom Presentation Podium',
              isActive: _tabIndex == 1,
              onTap: () => setState(() => _tabIndex = 1),
            ),
          ],
        ),
        const SizedBox(height: 20),

        Expanded(
          child: _tabIndex == 0 ? _buildIdCardWorkstation() : _buildSpeechPodium(),
        ),
      ],
    );
  }

  Widget _buildTab({required String title, required bool isActive, required VoidCallback onTap}) {
    return Material(
      color: isActive ? LHColors.teal : LHColors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: isActive ? 4 : 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Text(
            title,
            style: LHText.subheading(isActive ? LHColors.white : LHColors.charcoal).copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIdCardWorkstation() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.3), width: 2),
      ),
      child: Row(
        children: [
          // Left: ID Field Selectors
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. Surname / Nom de Famille:',
                      style: LHText.subheading(LHColors.teal).copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      children: _surnames.map((name) {
                        final isSelected = name == _selectedSurname;
                        return ChoiceChip(
                          label: Text(name, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
                          selected: isSelected,
                          selectedColor: LHColors.gold,
                          backgroundColor: LHColors.cream,
                          onSelected: (_) => setState(() => _selectedSurname = name),
                        );
                      }).toList(),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2. First Name / Prénom:',
                      style: LHText.subheading(LHColors.teal).copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      children: _firstnames.map((name) {
                        final isSelected = name == _selectedFirstname;
                        return ChoiceChip(
                          label: Text(name, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
                          selected: isSelected,
                          selectedColor: LHColors.gold,
                          backgroundColor: LHColors.cream,
                          onSelected: (_) => setState(() => _selectedFirstname = name),
                        );
                      }).toList(),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '3. Gender / Sexe:',
                      style: LHText.subheading(LHColors.teal).copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        ChoiceChip(
                          label: const Text('Féminin (F)'),
                          selected: _isGirl,
                          selectedColor: LHColors.gold,
                          backgroundColor: LHColors.cream,
                          onSelected: (_) => setState(() => _isGirl = true),
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('Masculin (M)'),
                          selected: !_isGirl,
                          selectedColor: LHColors.gold,
                          backgroundColor: LHColors.cream,
                          onSelected: (_) => setState(() => _isGirl = false),
                        ),
                      ],
                    ),
                  ],
                ),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: LHColors.teal.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Vocabulary Note: In French, "Nom" means Surname, while "Prénom" means First Name!',
                    style: LHText.body(LHColors.teal).copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 28),

          // Right: Generated "Carte d'Identité Scolaire" Card
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: LHColors.cream,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: LHColors.teal, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: LHColors.charcoal.withValues(alpha: 0.12),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ID Card Header
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: LHColors.teal,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'RÉPUBLIQUE DU NIGERIA',
                          style: LHText.label(LHColors.white).copyWith(fontSize: 12),
                        ),
                        Text(
                          'CARTE D\'IDENTITÉ SCOLAIRE',
                          style: LHText.label(LHColors.gold).copyWith(fontSize: 12, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),

                  // Photo & Fields Row
                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 110,
                        decoration: BoxDecoration(
                          color: LHColors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: LHColors.teal.withValues(alpha: 0.4), width: 2),
                        ),
                        child: Center(
                          child: Icon(
                            _isGirl ? Icons.girl_rounded : Icons.boy_rounded,
                            size: 64,
                            color: LHColors.teal,
                          ),
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildIdField('NOM', _selectedSurname, () => _playAudio('nom')),
                            _buildIdField('PRÉNOM', _selectedFirstname, () => _playAudio('prenom')),
                            _buildIdField('ÂGE', '$_selectedAge ans', () => _playAudio('age')),
                            _buildIdField('NATIONALITÉ', _isGirl ? 'Nigériane' : 'Nigérian', () => _playAudio(_isGirl ? 'je_suis_nigeriane' : 'je_suis_nigerian')),
                            _buildIdField('PAYS', 'Le Nigeria', () => _playAudio('pays')),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Bottom Stamp
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: LHColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('GRADE 4 FRENCH', style: LHText.label(LHColors.grey).copyWith(fontSize: 11)),
                        Text('ANNÉE SCOLAIRE 2026', style: LHText.label(LHColors.teal).copyWith(fontSize: 11)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIdField(String label, String value, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(
                '$label:',
                style: LHText.label(LHColors.grey).copyWith(fontSize: 12),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: LHText.body(LHColors.charcoal).copyWith(fontSize: 15, fontWeight: FontWeight.w800),
              ),
            ),
            const Icon(Icons.volume_up_rounded, size: 16, color: LHColors.teal),
          ],
        ),
      ),
    );
  }

  Widget _buildSpeechPodium() {
    final speechText =
        'Bonjour ! Je m\'appelle $_selectedFirstname $_selectedSurname. J\'ai $_selectedAge ans. Je suis ${_isGirl ? "Nigériane" : "Nigérian"}. Je suis un${_isGirl ? "e fille" : " garçon"}. Au revoir !';

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: LHColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: LHColors.turquoise.withValues(alpha: 0.3), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Classroom Self-Introduction Speech Podium',
                    style: LHText.heading(LHColors.teal).copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Pupils stand at the smartboard and practice speaking line by line or listen to the model speech',
                    style: LHText.body(LHColors.grey).copyWith(fontSize: 15),
                  ),
                ],
              ),
              FilledButton.icon(
                style: FilledButton.styleFrom(backgroundColor: LHColors.gold, foregroundColor: LHColors.charcoal),
                icon: const Icon(Icons.volume_up_rounded, size: 22),
                label: const Text('🎧 Model Speech (Tunde)', style: TextStyle(fontWeight: FontWeight.w800)),
                onPressed: () => _playAudio('presentation_speech'),
              ),
            ],
          ),

          const Divider(),

          // Speech Teleprompter Box
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: LHColors.cream,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: LHColors.gold, width: 2.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.record_voice_over_rounded, color: LHColors.teal, size: 26),
                    const SizedBox(width: 10),
                    Text(
                      'French Teleprompter Script:',
                      style: LHText.subheading(LHColors.teal).copyWith(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  speechText,
                  style: LHText.heading(LHColors.charcoal).copyWith(fontSize: 22, height: 1.4),
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    ActionChip(
                      avatar: const Icon(Icons.volume_up_rounded, size: 16, color: LHColors.teal),
                      label: const Text('1. Bonjour !'),
                      backgroundColor: LHColors.white,
                      onPressed: () => _playAudio('bonjour'),
                    ),
                    ActionChip(
                      avatar: const Icon(Icons.volume_up_rounded, size: 16, color: LHColors.teal),
                      label: Text('2. Je m\'appelle $_selectedFirstname'),
                      backgroundColor: LHColors.white,
                      onPressed: () => _playAudio('je_mappelle'),
                    ),
                    ActionChip(
                      avatar: const Icon(Icons.volume_up_rounded, size: 16, color: LHColors.teal),
                      label: Text('3. J\'ai $_selectedAge ans'),
                      backgroundColor: LHColors.white,
                      onPressed: () {
                        if (_selectedAge == 8) {
                          _playAudio('jai_huit_ans');
                        } else if (_selectedAge == 9) {
                          _playAudio('jai_neuf_ans');
                        } else if (_selectedAge == 10) {
                          _playAudio('jai_dix_ans');
                        } else {
                          _playAudio('num_$_selectedAge');
                        }
                      },
                    ),
                    ActionChip(
                      avatar: const Icon(Icons.volume_up_rounded, size: 16, color: LHColors.teal),
                      label: Text('4. Je suis ${_isGirl ? "Nigériane" : "Nigérian"}'),
                      backgroundColor: LHColors.white,
                      onPressed: () => _playAudio(_isGirl ? 'je_suis_nigeriane' : 'je_suis_nigerian'),
                    ),
                    ActionChip(
                      avatar: const Icon(Icons.volume_up_rounded, size: 16, color: LHColors.teal),
                      label: const Text('5. Au revoir !'),
                      backgroundColor: LHColors.white,
                      onPressed: () => _playAudio('au_revoir'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Speech Presentation Tips
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: LHColors.teal.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(Icons.tips_and_updates_rounded, color: LHColors.gold, size: 26),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Presentation Tips: Stand upright, speak with a loud confident voice, make eye contact with your classmates, and smile!',
                    style: LHText.body(LHColors.teal).copyWith(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
