import 'package:flutter/material.dart';
import '../../../models/jss2_lesson_model.dart';
import '../../../services/jss2_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

class JSS2ShoppingAndBargainingStudioWidget extends StatefulWidget {
  final JSS2LessonModel lesson;

  const JSS2ShoppingAndBargainingStudioWidget({
    super.key,
    required this.lesson,
  });

  @override
  State<JSS2ShoppingAndBargainingStudioWidget> createState() => _JSS2ShoppingAndBargainingStudioWidgetState();
}

class _JSS2ShoppingAndBargainingStudioWidgetState extends State<JSS2ShoppingAndBargainingStudioWidget> {
  final JSS2AudioService _audioService = JSS2AudioService();

  int _selectedProductIndex = 0;
  double _buyerOffer = 3500;
  bool _dealAgreed = false;
  String _paymentMethod = 'espèces'; // 'espèces' or 'carte'

  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Panier d\'ignames blanches',
      'askingPrice': 5000,
      'minAcceptable': 3500,
      'currency': 'Naira (₦)',
      'icon': Icons.bakery_dining_rounded,
      'audio': 'cest_combien_le_panier',
    },
    {
      'name': 'Sac de riz parfumé (5 kg)',
      'askingPrice': 7000,
      'minAcceptable': 5500,
      'currency': 'Naira (₦)',
      'icon': Icons.shopping_bag_rounded,
      'audio': 'je_voudrais_deux_kilos_de_riz',
    },
    {
      'name': 'Pagne traditionnel Ankara (6 yards)',
      'askingPrice': 12000,
      'minAcceptable': 9000,
      'currency': 'Naira (₦)',
      'icon': Icons.style_rounded,
      'audio': 'combien_coute_ce_paquet',
    },
    {
      'name': 'Panier de mangues mûres',
      'askingPrice': 2500,
      'minAcceptable': 1800,
      'currency': 'Naira (₦)',
      'icon': Icons.eco_rounded,
      'audio': 'cest_combien_le_panier',
    },
  ];

  @override
  void initState() {
    super.initState();
    _resetForProduct();
  }

  void _resetForProduct() {
    final p = _products[_selectedProductIndex];
    _buyerOffer = (p['askingPrice'] as int) * 0.7;
    _dealAgreed = false;
  }

  void _checkNegotiation() {
    final p = _products[_selectedProductIndex];
    final minPrice = p['minAcceptable'] as int;

    if (_buyerOffer >= minPrice) {
      setState(() => _dealAgreed = true);
      _audioService.playCorrect();
      _audioService.playPhrase('daccord_je_le_prends', term: 2);
    } else {
      setState(() => _dealAgreed = false);
      _audioService.playIncorrect();
      _audioService.playPhrase('cest_trop_cher_monsieur', term: 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = _products[_selectedProductIndex];
    final askingPrice = p['askingPrice'] as int;

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
                colors: [Color(0xFFF4A832), Color(0xFFE28B15)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(Icons.handshake_rounded, color: Colors.white, size: 36),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Simulateur de Marchandage & Négociation au Marché',
                        style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Demandez le prix, marchandez avec le vendeur et réglez vos achats en espèces ou par carte.',
                        style: LangHueyTextStyles.bodySmall.copyWith(color: Colors.white.withOpacity(0.9)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // Product Selector
          Row(
            children: List.generate(_products.length, (index) {
              final prod = _products[index];
              final isSelected = _selectedProductIndex == index;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 0 : 4,
                    right: index == _products.length - 1 ? 0 : 4,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedProductIndex = index;
                        _resetForProduct();
                      });
                      _audioService.playClick();
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isSelected ? LangHueyColors.deepTeal : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? LangHueyColors.deepTeal : Colors.black12,
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            prod['icon'] as IconData,
                            color: isSelected ? Colors.white : LangHueyColors.deepTeal,
                            size: 24,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            prod['name'] as String,
                            style: TextStyle(
                              color: isSelected ? Colors.white : LangHueyColors.charcoal,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                              fontSize: 11,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 18),

          // Negotiation Simulator Arena
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Panel: Live Stall Dialogue
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Article sélectionné : ${p['name']}', style: LangHueyTextStyles.h3.copyWith(fontSize: 15)),
                          IconButton(
                            icon: const Icon(Icons.volume_up_rounded, color: LangHueyColors.deepTeal),
                            onPressed: () => _audioService.playPhrase(p['audio'] as String, term: 2),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Vendor Bubble (Prix de départ)
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.orange.shade200),
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: LangHueyColors.amberGold,
                              child: Icon(Icons.store_rounded, color: Colors.white),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Vendeur :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                  Text(
                                    'Bonjour ! Ce produit de premier choix coûte $askingPrice ${p['currency']}.',
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Buyer Bargaining Slider
                      Text(
                        'Votre Proposition de Prix : ${_buyerOffer.toInt()} ${p['currency']}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: LangHueyColors.deepTeal),
                      ),
                      Slider(
                        value: _buyerOffer,
                        min: (askingPrice * 0.4).roundToDouble(),
                        max: askingPrice.toDouble(),
                        divisions: 20,
                        activeColor: LangHueyColors.deepTeal,
                        inactiveColor: LangHueyColors.softTeal,
                        label: '${_buyerOffer.toInt()} ₦',
                        onChanged: (val) {
                          setState(() {
                            _buyerOffer = val;
                            _dealAgreed = false;
                          });
                        },
                      ),

                      const SizedBox(height: 8),

                      // Negotiation Action Buttons
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {
                                _audioService.playPhrase('cest_trop_cher_monsieur', term: 2);
                              },
                              icon: const Icon(Icons.record_voice_over_rounded, size: 16),
                              label: const Text('« C\'est trop cher ! »', style: TextStyle(fontSize: 11)),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _checkNegotiation,
                              icon: const Icon(Icons.handshake_rounded, size: 16),
                              label: const Text('Négocier', style: TextStyle(fontSize: 11)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: LangHueyColors.deepTeal,
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      // Vendor Result Feedback
                      if (_dealAgreed)
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.green.shade300),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.check_circle_rounded, color: Colors.green, size: 24),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  '🎉 Accord trouvé à ${_buyerOffer.toInt()} ₦ ! Le vendeur accepte votre proposition.',
                                  style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Right Panel: Payment & Phrases
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
                      Text('Mode de Règlement', style: LangHueyTextStyles.h3.copyWith(fontSize: 15)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: ChoiceChip(
                              label: const Text('💵 Espèces', style: TextStyle(fontSize: 11)),
                              selected: _paymentMethod == 'espèces',
                              selectedColor: LangHueyColors.softTeal,
                              onSelected: (val) {
                                setState(() => _paymentMethod = 'espèces');
                                _audioService.playPhrase('je_paie_en_especes', term: 2);
                              },
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: ChoiceChip(
                              label: const Text('💳 Carte', style: TextStyle(fontSize: 11)),
                              selected: _paymentMethod == 'carte',
                              selectedColor: LangHueyColors.softTeal,
                              onSelected: (val) {
                                setState(() => _paymentMethod = 'carte');
                                _audioService.playPhrase('je_regle_par_carte_bancaire', term: 2);
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Text('Phrases Clés du Marché :', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: LangHueyColors.deepTeal)),
                      const SizedBox(height: 6),
                      _buildPhraseItem('« Faites-moi un bon prix »', 'faites_moi_un_bon_prix'),
                      _buildPhraseItem('« Vous me faites une réduction ? »', 'vous_me_faites_une_reduction'),
                      _buildPhraseItem('« D\'accord, je le prends »', 'daccord_je_le_prends'),
                      _buildPhraseItem('« Voici votre monnaie »', 'voici_votre_monnaie'),
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

  Widget _buildPhraseItem(String text, String audioKey) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: InkWell(
        onTap: () => _audioService.playPhrase(audioKey, term: 2),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: LangHueyColors.warmCream,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text(text, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis)),
              const Icon(Icons.volume_up_rounded, color: LangHueyColors.deepTeal, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
