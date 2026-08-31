import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 4 — Au Restaurant et au Café
/// Full restaurant simulation: reservation desk, interactive menu ordering,
/// bill calculator, and dialogue reconstruction.
class JSS2RestaurantCafeStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;
  const JSS2RestaurantCafeStudioWidget({super.key, required this.lesson});

  @override
  State<JSS2RestaurantCafeStudioWidget> createState() => _JSS2RestaurantCafeStudioWidgetState();
}

class _JSS2RestaurantCafeStudioWidgetState extends State<JSS2RestaurantCafeStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS2AudioService _audio = JSS2AudioService();
  late TabController _tabController;

  // Reservation
  int _tableFor = 2;
  String _timeSlot = '19h00';
  bool _reserved = false;

  // Order
  final Map<String, int> _order = {};
  bool _billRequested = false;

  // Dialogue
  int _dialogStep = 0;

  static const List<Map<String, dynamic>> _menu = [
    // Entrées
    {'category': 'Entrée', 'name': 'Salade niçoise', 'price': 1500, 'emoji': '🥗'},
    {'category': 'Entrée', 'name': 'Soupe de légumes', 'price': 1200, 'emoji': '🍲'},
    // Plats
    {'category': 'Plat principal', 'name': 'Poulet rôti', 'price': 3500, 'emoji': '🍗'},
    {'category': 'Plat principal', 'name': 'Riz au gras', 'price': 2800, 'emoji': '🍚'},
    {'category': 'Plat principal', 'name': 'Poisson braisé', 'price': 3200, 'emoji': '🐟'},
    // Desserts
    {'category': 'Dessert', 'name': 'Glace au chocolat', 'price': 1000, 'emoji': '🍦'},
    {'category': 'Dessert', 'name': 'Tarte aux fruits', 'price': 1200, 'emoji': '🥧'},
    // Boissons
    {'category': 'Boisson', 'name': "Jus d'orange", 'price': 600, 'emoji': '🍊'},
    {'category': 'Boisson', 'name': 'Eau minérale', 'price': 400, 'emoji': '💧'},
    {'category': 'Boisson', 'name': 'Café', 'price': 500, 'emoji': '☕'},
  ];

  static const List<Map<String, String>> _dialogue = [
    {'speaker': 'Client', 'line': 'Bonjour ! Avez-vous une table pour deux personnes ?', 'tip': 'Opening greeting + reservation request'},
    {'speaker': 'Serveur', 'line': "Oui, bien sûr. Par ici, s'il vous plaît. Voici la carte.", 'tip': 'Confirming table + offering menu'},
    {'speaker': 'Client', 'line': "Je voudrais le poulet rôti et un jus d'orange, s'il vous plaît.", 'tip': '"Je voudrais" = polite conditional order'},
    {'speaker': 'Serveur', 'line': 'Très bien. Et comme dessert, que désirez-vous ?', 'tip': 'Asking about dessert'},
    {'speaker': 'Client', 'line': "Une glace au chocolat, s'il vous plaît.", 'tip': 'Ordering dessert'},
    {'speaker': 'Serveur', 'line': "Parfait. Je vous apporte ça tout de suite. Bon appétit !", 'tip': '"Bon appétit !" before the meal'},
    {'speaker': 'Client', 'line': "C'était délicieux ! L'addition, s'il vous plaît.", 'tip': 'Compliment + requesting the bill'},
    {'speaker': 'Serveur', 'line': "Voici l'addition. Ça fait 5 200 nairas.", 'tip': 'Bill = l\'addition'},
  ];

  static const List<String> _timeSlots = ['12h00', '12h30', '13h00', '19h00', '19h30', '20h00', '20h30'];

  int get _total => _order.entries.fold(0, (sum, e) {
    final item = _menu.firstWhere((m) => m['name'] == e.key, orElse: () => {'price': 0});
    return sum + ((item['price'] as int) * e.value);
  });

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2C3E50), Color(0xFF8E44AD)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.restaurant_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Le Bistrot Franco-Nigérian', style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 16)),
                    const Text('Restaurant • Simulation interactive', style: TextStyle(color: Colors.white60, fontSize: 11)),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            labelColor: const Color(0xFF2C3E50),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFF8E44AD),
            tabs: const [
              Tab(icon: Icon(Icons.calendar_today_rounded, size: 18), text: 'Réservation'),
              Tab(icon: Icon(Icons.menu_book_rounded, size: 18), text: 'Carte & Commande'),
              Tab(icon: Icon(Icons.chat_rounded, size: 18), text: 'Dialogue'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [_buildReservationTab(), _buildOrderTab(), _buildDialogueTab()],
          ),
        ),
      ],
    );
  }

  Widget _buildReservationTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.black12),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.phone_rounded, color: Color(0xFF8E44AD)),
                    const SizedBox(width: 8),
                    Text('Réservation par téléphone', style: LangHueyTextStyles.h2.copyWith(fontSize: 15)),
                  ],
                ),
                const SizedBox(height: 20),

                // Number of people
                Text('Pour combien de personnes ?', style: LangHueyTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: List.generate(6, (i) {
                    final n = i + 1;
                    final selected = _tableFor == n;
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: GestureDetector(
                          onTap: () { setState(() => _tableFor = n); _audio.playClick(); },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: 48,
                            decoration: BoxDecoration(
                              color: selected ? const Color(0xFF8E44AD) : Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: selected ? const Color(0xFF8E44AD) : Colors.black12),
                            ),
                            child: Center(
                              child: Text('$n', style: TextStyle(fontWeight: FontWeight.bold, color: selected ? Colors.white : Colors.black54, fontSize: 16)),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),

                // Time slot
                Text('À quelle heure ?', style: LangHueyTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _timeSlots.map((t) {
                    final selected = _timeSlot == t;
                    return GestureDetector(
                      onTap: () { setState(() => _timeSlot = t); _audio.playClick(); },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: selected ? const Color(0xFF8E44AD) : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: selected ? const Color(0xFF8E44AD) : Colors.black12),
                        ),
                        child: Text(t, style: TextStyle(fontWeight: FontWeight.bold, color: selected ? Colors.white : Colors.black87)),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),

                // Reservation sentence
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(color: const Color(0xFF8E44AD).withOpacity(0.08), borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    '📞 "Bonjour ! Je voudrais réserver une table pour $_tableFor personne${_tableFor > 1 ? 's' : ''} ce soir à ${ _timeSlot}, s\'il vous plaît."',
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF2C3E50), height: 1.4),
                  ),
                ),
                const SizedBox(height: 16),
                if (_reserved)
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2ECC71).withOpacity(0.12),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFF2ECC71)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle_rounded, color: Color(0xFF2ECC71)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Réservation confirmée pour $_tableFor personne${_tableFor > 1 ? 's' : ''} à $_timeSlot !',
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF27AE60)),
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() => _reserved = true);
                      _audio.playCelebrate();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('✅ Réservation confirmée ! À ce soir.', style: TextStyle(fontWeight: FontWeight.bold)),
                        backgroundColor: Color(0xFF8E44AD),
                        behavior: SnackBarBehavior.floating,
                      ));
                    },
                    icon: Icon(_reserved ? Icons.edit_calendar_rounded : Icons.check_circle_rounded),
                    label: Text(_reserved ? 'Modifier la réservation' : 'Confirmer la réservation'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8E44AD),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderTab() {
    final categories = ['Entrée', 'Plat principal', 'Dessert', 'Boisson'];
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...categories.map((cat) {
            final items = _menu.where((m) => m['category'] == cat).toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 8, top: 16),
                  child: Text(cat, style: LangHueyTextStyles.h2.copyWith(fontSize: 15, color: const Color(0xFF8E44AD))),
                ),
                ...items.map((item) {
                  final name = item['name'] as String;
                  final qty = _order[name] ?? 0;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: qty > 0 ? const Color(0xFF8E44AD).withOpacity(0.08) : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: qty > 0 ? const Color(0xFF8E44AD).withOpacity(0.3) : Colors.black12),
                    ),
                    child: Row(
                      children: [
                        Text(item['emoji'] as String, style: const TextStyle(fontSize: 28)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                              Text('₦${item['price']}', style: TextStyle(color: qty > 0 ? const Color(0xFF8E44AD) : Colors.black54, fontSize: 12, fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() { if (((_order[name] ?? 0) > 0)) _order[name] = (_order[name] ?? 0) - 1; });
                                _audio.playClick();
                              },
                              child: Container(
                                width: 30, height: 30,
                                decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8)),
                                child: const Icon(Icons.remove_rounded, size: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text('$qty', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() => _order[name] = (_order[name] ?? 0) + 1);
                                _audio.playClick();
                              },
                              child: Container(
                                width: 30, height: 30,
                                decoration: BoxDecoration(color: const Color(0xFF8E44AD), borderRadius: BorderRadius.circular(8)),
                                child: const Icon(Icons.add_rounded, color: Colors.white, size: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              ],
            );
          }),

          // Bill
          if (_total > 0) ...[
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF2C3E50),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    const Text('TOTAL', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 14)),
                    Text('₦$_total', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)),
                  ]),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() => _billRequested = true);
                        _audio.playCelebrate();
                      },
                      icon: const Icon(Icons.receipt_long_rounded),
                      label: const Text("L'addition, s'il vous plaît !"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8E44AD),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  if (_billRequested) ...[
                    const SizedBox(height: 12),
                    Text('✅ "Voici l\'addition. Ça fait $_total nairas. Merci !"', style: const TextStyle(color: Color(0xFF2ECC71), fontWeight: FontWeight.bold)),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDialogueTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: const Color(0xFF2C3E50), borderRadius: BorderRadius.circular(14)),
            child: const Row(
              children: [
                Icon(Icons.chat_bubble_rounded, color: Colors.white),
                SizedBox(width: 8),
                Expanded(child: Text('Dialogue de restaurant — Tapez pour révéler les répliques', style: TextStyle(color: Colors.white, fontSize: 13))),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ..._dialogue.asMap().entries.map((e) {
            final isVisible = e.key <= _dialogStep;
            final isClient = e.value['speaker'] == 'Client';
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isVisible ? 1 : 0.2,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: isClient ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    if (!isClient) ...[
                      Container(
                        width: 36, height: 36,
                        decoration: BoxDecoration(color: const Color(0xFF2C3E50), borderRadius: BorderRadius.circular(10)),
                        child: const Center(child: Icon(Icons.support_agent_rounded, color: Colors.white, size: 18)),
                      ),
                      const SizedBox(width: 8),
                    ],
                    Flexible(
                      child: Column(
                        crossAxisAlignment: isClient ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          Text(e.value['speaker']!, style: TextStyle(fontSize: 11, color: isClient ? const Color(0xFF8E44AD) : const Color(0xFF2C3E50), fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isClient ? const Color(0xFF8E44AD) : Colors.white,
                              borderRadius: BorderRadius.circular(14).copyWith(
                                topLeft: isClient ? const Radius.circular(14) : Radius.zero,
                                topRight: isClient ? Radius.zero : const Radius.circular(14),
                              ),
                              border: isClient ? null : Border.all(color: Colors.black12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(e.value['line']!, style: TextStyle(color: isClient ? Colors.white : Colors.black87, fontSize: 13, fontWeight: FontWeight.w500)),
                                const SizedBox(height: 4),
                                Text('💡 ${e.value['tip']!}', style: TextStyle(fontSize: 10, color: isClient ? Colors.white60 : Colors.black45, fontStyle: FontStyle.italic)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isClient) ...[
                      const SizedBox(width: 8),
                      Container(
                        width: 36, height: 36,
                        decoration: BoxDecoration(color: const Color(0xFF8E44AD), borderRadius: BorderRadius.circular(10)),
                        child: const Center(child: Icon(Icons.person_rounded, color: Colors.white, size: 18)),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 16),
          Row(
            children: [
              if (_dialogStep > 0)
                OutlinedButton.icon(
                  onPressed: () { setState(() => _dialogStep--); _audio.playClick(); },
                  icon: const Icon(Icons.arrow_back_rounded),
                  label: const Text('Précédent'),
                  style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                ),
              const Spacer(),
              if (_dialogStep < _dialogue.length - 1)
                ElevatedButton.icon(
                  onPressed: () { setState(() => _dialogStep++); _audio.playClick(); },
                  icon: const Icon(Icons.arrow_forward_rounded),
                  label: const Text('Suivant'),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF8E44AD), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                )
              else
                ElevatedButton.icon(
                  onPressed: () { setState(() => _dialogStep = 0); _audio.playCelebrate(); },
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('Recommencer'),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2C3E50), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
