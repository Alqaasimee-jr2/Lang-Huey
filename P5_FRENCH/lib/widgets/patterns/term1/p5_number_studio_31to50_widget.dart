import 'package:flutter/material.dart';
import '../../../services/p5_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class P5NumberStudio31to50Widget extends StatefulWidget {
  final VoidCallback onComplete;

  const P5NumberStudio31to50Widget({super.key, required this.onComplete});

  @override
  State<P5NumberStudio31to50Widget> createState() => _P5NumberStudio31to50WidgetState();
}

class _P5NumberStudio31to50WidgetState extends State<P5NumberStudio31to50Widget> {
  final P5AudioService _audioService = P5AudioService();
  int _activeView = 0; // 0: Market Store, 1: Phone Keypad, 2: Tens Milestone 30-50

  final List<Map<String, dynamic>> _marketItems = [
    {'name': 'Le cahier (Notebook)', 'price': 40, 'frenchPrice': 'Quarante Naira', 'icon': Icons.menu_book_rounded, 'audio': 'num_40'},
    {'name': 'Le stylo (Pen)', 'price': 35, 'frenchPrice': 'Trente-cinq Naira', 'icon': Icons.edit_rounded, 'audio': 'num_35'},
    {'name': 'La règle (Ruler)', 'price': 30, 'frenchPrice': 'Trente Naira', 'icon': Icons.straighten_rounded, 'audio': 'num_30'},
    {'name': 'Le sac à dos (School Bag)', 'price': 50, 'frenchPrice': 'Cinquante Naira', 'icon': Icons.backpack_rounded, 'audio': 'num_50'},
  ];

  String _dialedDigits = '080';

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
                  _buildTab(0, '1. Classroom Market Store', Icons.storefront_rounded),
                  const SizedBox(width: 12),
                  _buildTab(1, '2. Phone Number Dial Pad', Icons.dialpad_rounded),
                  const SizedBox(width: 12),
                  _buildTab(2, '3. Numbers 31–50 Milestones', Icons.looks_4_rounded),
                ],
              ),
              ElevatedButton.icon(
                onPressed: widget.onComplete,
                icon: const Icon(Icons.check_circle_rounded, color: P5Colors.white),
                label: const Text('Complete Store Lab', style: TextStyle(fontWeight: FontWeight.bold)),
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
                ? _buildMarketStore()
                : _activeView == 1
                    ? _buildPhoneKeypad()
                    : _buildMilestonesView(),
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

  Widget _buildMarketStore() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Inquire Prices: "S\'il vous plaît, combien coûte ceci ?" (Touch an item to ask and hear price):',
          style: P5Text.subheading(P5Colors.charcoal).copyWith(fontSize: 17),
        ),
        const SizedBox(height: 14),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2.3,
            ),
            itemCount: _marketItems.length,
            itemBuilder: (context, index) {
              final item = _marketItems[index];
              return Material(
                color: P5Colors.cream,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () => _audioService.playPhrase(item['audio'] as String, term: 1),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: P5Colors.teal,
                          child: Icon(item['icon'] as IconData, color: P5Colors.white, size: 28),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(item['name'] as String, style: P5Text.subheading(P5Colors.charcoal)),
                              const SizedBox(height: 4),
                              Text(
                                'Prix: ₦${item['price']} (${item['frenchPrice']})',
                                style: P5Text.frenchPhrase(P5Colors.teal).copyWith(fontSize: 18),
                              ),
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
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneKeypad() {
    final digits = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '#'];
    return Row(
      children: [
        // Display Screen
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: P5Colors.cream,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: P5Colors.turquoise, width: 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.phone_iphone_rounded, size: 48, color: P5Colors.teal),
                const SizedBox(height: 12),
                Text('Numéro de Téléphone Nigérian:', style: P5Text.body(P5Colors.charcoal)),
                const SizedBox(height: 10),
                Text(_dialedDigits, style: P5Text.heroHeading(P5Colors.teal)),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() => _dialedDigits = '080');
                  },
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('Reset Number'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),

        // Keypad
        Expanded(
          flex: 2,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.3,
            ),
            itemCount: digits.length,
            itemBuilder: (context, index) {
              final d = digits[index];
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: P5Colors.teal,
                  foregroundColor: P5Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {
                  if (d != '*' && d != '#') {
                    if (_dialedDigits.length < 11) {
                      setState(() => _dialedDigits += d);
                    }
                    _audioService.playPhrase('num_$d', term: 1);
                  }
                },
                child: Text(d, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMilestonesView() {
    final milestones = [
      {'num': 30, 'french': 'Trente', 'audio': 'num_30'},
      {'num': 31, 'french': 'Trente et un', 'audio': 'num_31'},
      {'num': 40, 'french': 'Quarante', 'audio': 'num_40'},
      {'num': 41, 'french': 'Quarante et un', 'audio': 'num_41'},
      {'num': 50, 'french': 'Cinquante', 'audio': 'num_50'},
    ];
    return ListView.builder(
      itemCount: milestones.length,
      itemBuilder: (context, index) {
        final m = milestones[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: P5Colors.teal,
              child: Text('${m['num']}', style: const TextStyle(color: P5Colors.white, fontWeight: FontWeight.bold)),
            ),
            title: Text(m['french'] as String, style: P5Text.frenchPhrase(P5Colors.charcoal)),
            trailing: IconButton(
              icon: const Icon(Icons.volume_up_rounded, color: P5Colors.teal),
              onPressed: () => _audioService.playPhrase(m['audio'] as String, term: 1),
            ),
          ),
        );
      },
    );
  }
}
