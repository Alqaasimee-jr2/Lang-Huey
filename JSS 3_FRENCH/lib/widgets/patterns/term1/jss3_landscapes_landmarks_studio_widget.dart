import 'package:flutter/material.dart';
import '../../../models/jss3_lesson_model.dart';
import '../../../services/jss3_audio_service.dart';
import '../../../theme/colors.dart';
import '../../../theme/text_styles.dart';

/// Week 2 — Décrire un paysage et des lieux touristiques
/// Dual Panoramic Tourist Showcase: Nigerian & Francophone landmarks,
/// sensory landscape adjectives, and interactive travel postcard generator.
class JSS3LandscapesLandmarksStudioWidget extends StatefulWidget {
  final JSS3LessonModel lesson;
  const JSS3LandscapesLandmarksStudioWidget({super.key, required this.lesson});

  @override
  State<JSS3LandscapesLandmarksStudioWidget> createState() => _JSS3LandscapesLandmarksStudioWidgetState();
}

class _JSS3LandscapesLandmarksStudioWidgetState extends State<JSS3LandscapesLandmarksStudioWidget>
    with SingleTickerProviderStateMixin {
  final JSS3AudioService _audio = JSS3AudioService();
  late TabController _tabController;

  int _selectedSite = 0;
  String _postcardReceiver = 'Cher ami(e)';
  String _selectedAdjective = 'majestueux';

  static const List<Map<String, dynamic>> _landmarks = [
    {
      'name': 'Zuma Rock (Abuja / Niger State)',
      'country': '🇳🇬 Nigeria',
      'type': 'Rocher gigantesque & montagneux',
      'emoji': '⛰️',
      'color': Color(0xFF6C5B7B),
      'description': 'Un monolithe imposant et majestueux situé près de la capitale Abuja. Haut de 725 mètres au-dessus du sol.',
      'adjectives': ['majestueux', 'gigantesque', 'impressionnant', 'rocheux'],
      'spokenAudio': 'Voici Zuma Rock, un monolithe majestueux et spectaculaire au cœur du Nigeria.',
    },
    {
      'name': 'Plateau d\'Obudu (Cross River)',
      'country': '🇳🇬 Nigeria',
      'type': 'Collines verdoyantes & cascades',
      'emoji': '🌲',
      'color': Color(0xFF2E7D32),
      'description': 'Un plateau montagneux célèbre pour ses collines verdoyantes, son climat frais et son téléphérique panoramique.',
      'adjectives': ['verdoyant', 'montagneux', 'frais', 'pittoresque'],
      'spokenAudio': 'Le plateau d\'Obudu offre un paysage verdoyant et des cascades magnifiques.',
    },
    {
      'name': 'Basilique de Yamoussoukro',
      'country': '🇨🇮 Côte d\'Ivoire',
      'type': 'Monument religieux mondial',
      'emoji': '🏛️',
      'color': Color(0xFFD35400),
      'description': 'La Basilique Notre-Dame de la Paix est l\'un des plus grands édifices chrétiens au monde, entouré de vastes jardins.',
      'adjectives': ['monumental', 'grandiose', 'historique', 'somptueux'],
      'spokenAudio': 'La basilique de Yamoussoukro est un monument grandiose en Côte d\'Ivoire.',
    },
    {
      'name': 'La Tour Eiffel & La Seine (Paris)',
      'country': '🇫🇷 France',
      'type': 'Monument historique & fleuve',
      'emoji': '🗼',
      'color': Color(0xFF1565C0),
      'description': 'Le monument emblématique de Paris, haut de 330 mètres, illuminé chaque soir au bord du fleuve de la Seine.',
      'adjectives': ['célèbre', 'lumineux', 'historique', 'romantique'],
      'spokenAudio': 'La Tour Eiffel est le monument le plus visité de Paris.',
    },
    {
      'name': 'Parc National de la Pendjari',
      'country': '🇧🇯 Bénin',
      'type': 'Réserve de faune & savane',
      'emoji': '🐘',
      'color': Color(0xFFC0392B),
      'description': 'Une réserve faunique majeure d\'Afrique de l\'Ouest abritant des éléphants, des lions et des cascades.',
      'adjectives': ['sauvage', 'naturel', 'aride', 'fascinant'],
      'spokenAudio': 'Le parc de la Pendjari au Bénin protège une faune sauvage exceptionnelle.',
    },
  ];

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
        // Top Header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2E7D32), Color(0xFF0D7377)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.travel_explore_rounded, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Panorama des Paysages & Sites Touristiques',
                  style: LangHueyTextStyles.h2.copyWith(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        // Tabs
        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            labelColor: const Color(0xFF2E7D32),
            unselectedLabelColor: LangHueyColors.textMuted,
            indicatorColor: const Color(0xFF2E7D32),
            tabs: const [
              Tab(icon: Icon(Icons.photo_library_rounded, size: 18), text: 'Sites & Monuments'),
              Tab(icon: Icon(Icons.palette_rounded, size: 18), text: 'Adjectifs Paysagers'),
              Tab(icon: Icon(Icons.mark_email_read_rounded, size: 18), text: 'Générateur de Carte'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildSitesTab(),
              _buildAdjectivesTab(),
              _buildPostcardTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSitesTab() {
    final site = _landmarks[_selectedSite];
    final color = site['color'] as Color;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/jss3_term1/jss3_t1w2_landscapes.jpg',
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const SizedBox(),
            ),
          ),
          const SizedBox(height: 16),

          // Selector chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_landmarks.length, (index) {
                final l = _landmarks[index];
                final isSelected = _selectedSite == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ChoiceChip(
                    avatar: Text(l['emoji'] as String),
                    label: Text(l['name'] as String),
                    selected: isSelected,
                    selectedColor: (l['color'] as Color).withOpacity(0.2),
                    side: BorderSide(color: isSelected ? l['color'] as Color : Colors.black12),
                    onSelected: (val) {
                      if (val) {
                        setState(() {
                          _selectedSite = index;
                          _selectedAdjective = (l['adjectives'] as List<String>).first;
                        });
                        _audio.playClick();
                      }
                    },
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 20),

          // Main Landmark Card
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: color.withOpacity(0.4), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(site['emoji'] as String, style: const TextStyle(fontSize: 40)),
                        const SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(site['name'] as String, style: LangHueyTextStyles.h2.copyWith(fontSize: 18)),
                            Text(
                              '${site['country']} • ${site['type']}',
                              style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Site #${_selectedSite + 1}',
                        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  site['description'] as String,
                  style: TextStyle(fontSize: 14, color: LangHueyColors.charcoal, height: 1.4),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: (site['adjectives'] as List<String>).map((adj) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Text('✨ $adj', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.record_voice_over_rounded, color: color, size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          '« ${site['spokenAudio']} »',
                          style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdjectivesTab() {
    final landscapeAdjectives = [
      {'adj': 'verdoyant(e)', 'def': 'Recouvert d\'une végétation verte et abondante', 'ex': 'Les forêts verdoyantes d\'Afrique de l\'Ouest.'},
      {'adj': 'montagneux / montagneuse', 'def': 'Composé de montagnes ou de hauts reliefs', 'ex': 'Un plateau montagneux avec des cascades.'},
      {'adj': 'aride / désertique', 'def': 'Sec, chaud, avec très peu d\'eau ou de pluie', 'ex': 'La savane aride du nord.'},
      {'adj': 'côtier / côtière', 'def': 'Situé au bord de la mer ou de l\'océan', 'ex': 'Les plages côtières de Lagos et de Grand-Bassam.'},
      {'adj': 'majestueux / majestueuse', 'def': 'Imposant, qui inspire le respect et l\'admiration', 'ex': 'Un rocher majestueux qui domine la région.'},
      {'adj': 'pittoresque', 'def': 'Qui a du charme, digne d\'être peint sur un tableau', 'ex': 'Un village pittoresque avec des maisons traditionnelles.'},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Vocabulaire Spécialisé des Paysages (BECE Format) :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 16),
          ...landscapeAdjectives.map((item) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item['adj']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF2E7D32))),
                      const Icon(Icons.landscape_rounded, color: Color(0xFF2E7D32), size: 20),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(item['def']!, style: TextStyle(color: Colors.grey.shade700, fontSize: 13)),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text('Ex : ${item['ex']}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: LangHueyColors.charcoal)),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildPostcardTab() {
    final site = _landmarks[_selectedSite];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Créez votre Carte Postale Touristique :', style: LangHueyTextStyles.h3),
          const SizedBox(height: 16),

          // Postcard Canvas
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFDF9),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.brown.shade300, width: 2),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 14, offset: const Offset(0, 4)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('CARTE POSTALE DU NIGERIA & D\'AFRIQUE', style: TextStyle(color: Colors.brown.shade800, fontWeight: FontWeight.w900, letterSpacing: 1, fontSize: 12)),
                    Container(
                      width: 44,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.brown.shade100,
                        border: Border.all(color: Colors.brown.shade400),
                      ),
                      child: Center(child: Text(site['emoji'] as String, style: const TextStyle(fontSize: 22))),
                    ),
                  ],
                ),
                const Divider(height: 24, thickness: 1),
                Text('$_postcardReceiver,', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(
                  'Je t\'écris depuis ${site['name']}. C\'est un endroit tout à fait $_selectedAdjective ! Le paysage est impressionnant et les gens sont très accueillants. Tu devrais absolument visiter ce lieu lors de ton prochain voyage !',
                  style: const TextStyle(fontSize: 14, height: 1.5),
                ),
                const SizedBox(height: 16),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text('Amitiés sincères,\nTon ami(e) de JSS 3 🌟', textAlign: TextAlign.right, style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Customizer controls
          Text('Modifier le destinataire :', style: LangHueyTextStyles.h3.copyWith(fontSize: 14)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: ['Cher ami(e)', 'Chers parents', 'Cher professeur', 'Chers camarades'].map((rcv) {
              final isSelected = _postcardReceiver == rcv;
              return ChoiceChip(
                label: Text(rcv),
                selected: isSelected,
                selectedColor: const Color(0xFF2E7D32),
                labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black87),
                onSelected: (val) {
                  if (val) setState(() => _postcardReceiver = rcv);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
