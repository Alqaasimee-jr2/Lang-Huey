import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/mascot/lang_huey_mascot_head_widget.dart';
import '../term/p4_term_select_screen.dart';

class OnboardingScreen extends StatefulWidget {
  final bool isReplayMode; // true if opened from Term Select header
  final Widget? destinationScreen; // Screen to go to when completed

  const OnboardingScreen({
    super.key,
    this.isReplayMode = false,
    this.destinationScreen,
  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final AudioPlayer _audioPlayer = AudioPlayer();
  int _currentSlide = 0;
  bool _isTalking = false;

  final List<Map<String, String>> _slides = [
    {
      'frenchTitle': 'Bonjour tout le monde !',
      'englishTitle': 'Hello everyone!',
      'frenchBody':
          'Je m\'appelle Huey, votre compagnon de français. Ensemble, nous allons découvrir, pratiquer et parler une nouvelle langue.',
      'englishBody':
          'I am Huey, your French companion. Together, we are going to discover, practice, and speak a new language.',
      'audioAsset': 'assets/audio/onboarding/onboarding_slide1_bonjour.mp3',
    },
    {
      'frenchTitle': 'Ici, on apprend à voix haute !',
      'englishTitle': 'Here, we learn out loud!',
      'frenchBody':
          'Quand vous entendez un mot, répétez-le avec fierté. N\'ayez jamais peur des erreurs : c\'est ainsi que l\'on progresse tous ensemble !',
      'englishBody':
          'When you hear a word, repeat it with pride. Never be afraid of making mistakes: that is how we all make progress together!',
      'audioAsset': 'assets/audio/onboarding/onboarding_slide2_voix_haute.mp3',
    },
    {
      'frenchTitle': 'L\'aventure commence aujourd\'hui !',
      'englishTitle': 'The adventure begins today!',
      'frenchBody':
          'Venez participer, répondre aux défis et gagner des trophées en équipe. Toute la classe forme une seule équipe !',
      'englishBody':
          'Come participate, answer challenges, and win trophies as a team. The whole class forms one single team!',
      'audioAsset': 'assets/audio/onboarding/onboarding_slide3_aventure.mp3',
    },
  ];

  @override
  void initState() {
    super.initState();

    // Listen to player state to sync mouth talking animation
    _audioPlayer.playerStateStream.listen((state) {
      if (mounted) {
        setState(() {
          _isTalking = state.playing && state.processingState != ProcessingState.completed;
        });
      }
    });

    // Auto-play the first audio cue with a gentle delay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _playCurrentAudio();
    });
  }

  Future<void> _playCurrentAudio() async {
    try {
      final audioPath = _slides[_currentSlide]['audioAsset']!;
      await _audioPlayer.stop().catchError((_) => null);
      await _audioPlayer
          .setAsset(audioPath)
          .timeout(const Duration(milliseconds: 400))
          .catchError((_) => null);
      await _audioPlayer
          .play()
          .timeout(const Duration(milliseconds: 400))
          .catchError((_) => null);
    } catch (e) {
      // Graceful fallback if audio asset is unreadable
      debugPrint('Audio playback error: $e');
    }
  }

  Future<void> _finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('lang_huey_onboarding_completed', true);

    try {
      await _audioPlayer
          .stop()
          .timeout(const Duration(milliseconds: 300))
          .catchError((_) => null);
    } catch (_) {}

    if (!mounted) return;

    if (widget.isReplayMode) {
      Navigator.of(context).pop();
    } else {
      final next = widget.destinationScreen ?? const P4TermSelectScreen();
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => next,
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 350),
        ),
      );
    }
  }

  void _goToSlide(int index) {
    if (index >= 0 && index < _slides.length) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const creamBg = Color(0xFFF5F0E8);
    const deepTeal = Color(0xFF0D7377);
    const turquoise = Color(0xFF14BDCC);
    const amberGold = Color(0xFFF4A832);
    const charcoal = Color(0xFF1C1C1C);

    return Scaffold(
      backgroundColor: creamBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
          child: Column(
            children: [
              // 1. Top Navigation Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Segmented Progress Bar (Duolingo style)
                  Expanded(
                    child: Row(
                      children: List.generate(_slides.length, (index) {
                        final isFilled = index <= _currentSlide;
                        final isCurrent = index == _currentSlide;
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: 8,
                              decoration: BoxDecoration(
                                color: isFilled ? deepTeal : deepTeal.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(4),
                                border: isCurrent
                                    ? Border.all(color: amberGold, width: 2)
                                    : null,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  const SizedBox(width: 24),

                  // Skip / Close Button
                  TextButton.icon(
                    onPressed: _finishOnboarding,
                    style: TextButton.styleFrom(
                      foregroundColor: deepTeal,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      backgroundColor: deepTeal.withValues(alpha: 0.08),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: Icon(
                      widget.isReplayMode ? Icons.close_rounded : Icons.fast_forward_rounded,
                      size: 18,
                    ),
                    label: Text(
                      widget.isReplayMode ? 'Fermer / Close' : 'Passer / Skip',
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // 2. Central Page Content (PageView)
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      _currentSlide = index;
                    });
                    _playCurrentAudio();
                  },
                  itemCount: _slides.length,
                  itemBuilder: (context, index) {
                    final slide = _slides[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Huey Mascot Head (Teal head on Cream background)
                        GestureDetector(
                          onTap: _playCurrentAudio, // tap to replay audio
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              LangHueyMascotHeadWidget(
                                size: 180,
                                isLightHead: false, // Teal head on cream
                                isTalking: _isTalking,
                                isBobbing: true,
                              ),
                              // Replay Audio Floating Badge
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: amberGold,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: charcoal.withValues(alpha: 0.15),
                                      blurRadius: 6,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  _isTalking ? Icons.volume_up_rounded : Icons.replay_rounded,
                                  color: charcoal,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // French Title (Bold & Prominent)
                        Text(
                          slide['frenchTitle']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w900,
                            color: deepTeal,
                            letterSpacing: -0.5,
                          ),
                        ),

                        const SizedBox(height: 4),

                        // English Title Translation
                        Text(
                          slide['englishTitle']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: charcoal.withValues(alpha: 0.6),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // French Body Text
                        Container(
                          constraints: const BoxConstraints(maxWidth: 720),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: turquoise.withValues(alpha: 0.3), width: 1.5),
                            boxShadow: [
                              BoxShadow(
                                color: charcoal.withValues(alpha: 0.04),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                slide['frenchBody']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                  color: deepTeal,
                                  height: 1.35,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                slide['englishBody']!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: charcoal.withValues(alpha: 0.7),
                                  height: 1.35,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              // 3. Bottom Controls Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button (hidden on slide 0)
                  if (_currentSlide > 0)
                    OutlinedButton.icon(
                      onPressed: () => _goToSlide(_currentSlide - 1),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: deepTeal,
                        side: const BorderSide(color: deepTeal, width: 2),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      icon: const Icon(Icons.arrow_back_rounded, size: 20),
                      label: const Text(
                        'Précédent / Back',
                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                    )
                  else
                    const SizedBox(width: 140),

                  // Next / Finish Button (Chunky 3D style)
                  ElevatedButton(
                    onPressed: () {
                      if (_currentSlide < _slides.length - 1) {
                        _goToSlide(_currentSlide + 1);
                      } else {
                        _finishOnboarding();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _currentSlide == _slides.length - 1 ? amberGold : deepTeal,
                      foregroundColor: _currentSlide == _slides.length - 1 ? charcoal : creamBg,
                      elevation: 4,
                      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _currentSlide == _slides.length - 1
                              ? 'C\'est parti ! / Let\'s Begin ! 🚀'
                              : 'Continuer / Next →',
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
