import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

enum JSS1SfxType {
  correct,
  incorrect,
  click,
  celebrate,
  whoosh,
}

class JSS1AudioService {
  static final JSS1AudioService _instance = JSS1AudioService._internal();
  factory JSS1AudioService() => _instance;
  JSS1AudioService._internal();

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

  /// Play a JSS1 French vocabulary or phrase audio clip by its key
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
          'assets/audio/jss1_term$term/$audioKey.mp3',
          'assets/audio/jss1_term1/$audioKey.mp3',
          'assets/audio/jss1_term2/$audioKey.mp3',
          'assets/audio/jss1_term3/$audioKey.mp3',
          'assets/audio/$audioKey.mp3',
        ];
      } else {
        pathsToTry = [
          'assets/audio/jss1_term1/$audioKey.mp3',
          'assets/audio/jss1_term2/$audioKey.mp3',
          'assets/audio/jss1_term3/$audioKey.mp3',
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
        print('JSS1AudioService notice playing $audioKey: $e');
      }
    } finally {
      _isPlaying = false;
      _currentlyPlayingKey = null;
    }
  }

  /// Play sound effects for interactive quizzes, clicks, and celebrations
  Future<void> playSfx(JSS1SfxType sfx) async {
    try {
      final sfxName = sfx.name;
      final path = 'assets/audio/sfx_$sfxName.mp3';
      await _sfxPlayer.setAsset(path);
      await _sfxPlayer.play();
    } catch (_) {
      // Fallback silent fail
    }
  }

  Future<void> playClick() => playSfx(JSS1SfxType.click);
  Future<void> playCorrect() => playSfx(JSS1SfxType.correct);
  Future<void> playIncorrect() => playSfx(JSS1SfxType.incorrect);
  Future<void> playCelebrate() => playSfx(JSS1SfxType.celebrate);
  Future<void> playWhoosh() => playSfx(JSS1SfxType.whoosh);

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
