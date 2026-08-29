import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

enum P5SfxType {
  correct,
  incorrect,
  click,
  celebrate,
  whoosh,
}

class P5AudioService {
  static final P5AudioService _instance = P5AudioService._internal();
  factory P5AudioService() => _instance;
  P5AudioService._internal();

  final AudioPlayer _phrasePlayer = AudioPlayer();
  final AudioPlayer _sfxPlayer = AudioPlayer();

  String? _currentlyPlayingKey;
  bool _isPlaying = false;
  double _playbackSpeed = 1.0;

  bool get isPlaying => _isPlaying;
  String? get currentlyPlayingKey => _currentlyPlayingKey;
  double get playbackSpeed => _playbackSpeed;

  Stream<bool> get playingStream => _phrasePlayer.playingStream;

  /// Set playback speed (e.g. 0.8 for slower beginner pronunciation, 1.0 for normal)
  Future<void> setPlaybackSpeed(double speed) async {
    _playbackSpeed = speed.clamp(0.5, 1.5);
    try {
      await _phrasePlayer.setSpeed(_playbackSpeed);
    } catch (_) {}
  }

  /// Play a Primary 5 French vocabulary or phrase audio clip by its key
  Future<void> playPhrase(String audioKey, {int? term}) async {
    try {
      if (_isPlaying) {
        await _phrasePlayer.stop();
      }

      _currentlyPlayingKey = audioKey;
      _isPlaying = true;

      List<String> pathsToTry;
      if (term != null) {
        pathsToTry = [
          'assets/audio/p5_term$term/$audioKey.mp3',
          'assets/audio/p5_term1/$audioKey.mp3',
          'assets/audio/p5_term2/$audioKey.mp3',
          'assets/audio/p5_term3/$audioKey.mp3',
          'assets/audio/$audioKey.mp3',
        ];
      } else {
        pathsToTry = [
          'assets/audio/p5_term1/$audioKey.mp3',
          'assets/audio/p5_term2/$audioKey.mp3',
          'assets/audio/p5_term3/$audioKey.mp3',
          'assets/audio/$audioKey.mp3',
        ];
      }

      bool loaded = false;
      for (final path in pathsToTry) {
        try {
          await _phrasePlayer.setAsset(path);
          loaded = true;
          break;
        } catch (_) {}
      }

      if (loaded) {
        await _phrasePlayer.setSpeed(_playbackSpeed);
        await _phrasePlayer.play();
      }
    } catch (e) {
      if (kDebugMode) {
        print('P5AudioService notice playing $audioKey: $e');
      }
    } finally {
      _isPlaying = false;
      _currentlyPlayingKey = null;
    }
  }

  /// Play sound effects for interactive quizzes, clicks, and celebrations
  Future<void> playSfx(P5SfxType sfx) async {
    try {
      final sfxName = sfx.name;
      final path = 'assets/audio/sfx_$sfxName.mp3';
      await _sfxPlayer.setAsset(path);
      await _sfxPlayer.play();
    } catch (_) {
      // Fallback silent fail
    }
  }

  Future<void> playClick() => playSfx(P5SfxType.click);
  Future<void> playCorrect() => playSfx(P5SfxType.correct);
  Future<void> playIncorrect() => playSfx(P5SfxType.incorrect);
  Future<void> playCelebrate() => playSfx(P5SfxType.celebrate);
  Future<void> playWhoosh() => playSfx(P5SfxType.whoosh);

  Future<void> stop() async {
    await _phrasePlayer.stop();
    await _sfxPlayer.stop();
    _isPlaying = false;
    _currentlyPlayingKey = null;
  }

  void dispose() {
    _phrasePlayer.dispose();
    _sfxPlayer.dispose();
  }
}
