import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

enum P4SfxType {
  correct,
  incorrect,
  click,
  celebrate,
}

class P4AudioService {
  static final P4AudioService _instance = P4AudioService._internal();
  factory P4AudioService() => _instance;

  P4AudioService._internal() {
    _phrasePlayer = AudioPlayer();
    _sfxPlayer = AudioPlayer();
  }

  late final AudioPlayer _phrasePlayer;
  late final AudioPlayer _sfxPlayer;

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

  /// Play a Primary 4 French vocabulary or phrase audio clip by its key
  Future<void> playPhrase(String audioKey, {int? term}) async {
    try {
      _currentlyPlayingKey = audioKey;
      _isPlaying = true;
      await _phrasePlayer.stop();

      List<String> pathsToTry = [];
      if (term == 3) {
        pathsToTry = [
          'assets/audio/p4_term3/$audioKey.mp3',
          'assets/audio/p4_term2/$audioKey.mp3',
          'assets/audio/p4_term1/$audioKey.mp3',
          'assets/audio/$audioKey.mp3',
        ];
      } else if (term == 2) {
        pathsToTry = [
          'assets/audio/p4_term2/$audioKey.mp3',
          'assets/audio/p4_term3/$audioKey.mp3',
          'assets/audio/p4_term1/$audioKey.mp3',
          'assets/audio/$audioKey.mp3',
        ];
      } else {
        pathsToTry = [
          'assets/audio/p4_term1/$audioKey.mp3',
          'assets/audio/p4_term2/$audioKey.mp3',
          'assets/audio/p4_term3/$audioKey.mp3',
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
        print('P4AudioService notice playing $audioKey: $e');
      }
    } finally {
      _isPlaying = false;
      _currentlyPlayingKey = null;
    }
  }

  /// Play interactive smartboard SFX feedback (correct chime, click pop, celebrate fanfare)
  Future<void> playSfx(P4SfxType type) async {
    try {
      String sfxName;
      switch (type) {
        case P4SfxType.correct:
          sfxName = 'sfx_correct';
          break;
        case P4SfxType.incorrect:
          sfxName = 'sfx_incorrect';
          break;
        case P4SfxType.click:
          sfxName = 'sfx_click';
          break;
        case P4SfxType.celebrate:
          sfxName = 'sfx_celebrate';
          break;
      }

      await _sfxPlayer.stop();
      await _sfxPlayer.setAsset('assets/audio/p4_term1/$sfxName.mp3');
      await _sfxPlayer.play();
    } catch (e) {
      if (kDebugMode) {
        print('P4AudioService: SFX notice: $e');
      }
    }
  }

  /// Stop current playback
  Future<void> stop() async {
    try {
      await _phrasePlayer.stop();
      await _sfxPlayer.stop();
    } catch (_) {}
    _isPlaying = false;
    _currentlyPlayingKey = null;
  }

  void dispose() {
    _phrasePlayer.dispose();
    _sfxPlayer.dispose();
  }
}
