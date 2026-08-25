import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

class AudioService {
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;
  AudioService._internal();

  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  Future<void> playAsset(String assetPath) async {
    try {
      _isPlaying = true;
      await _player.setAsset(assetPath);
      await _player.play();
    } catch (e) {
      if (kDebugMode) {
        print('AudioService fallback: $assetPath (Error: $e)');
      }
    } finally {
      _isPlaying = false;
    }
  }

  Future<void> stop() async {
    await _player.stop();
    _isPlaying = false;
  }

  void dispose() {
    _player.dispose();
  }
}
