import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

class JSS2AudioService {
  static final JSS2AudioService _instance = JSS2AudioService._internal();
  factory JSS2AudioService() => _instance;

  final AudioPlayer _phrasePlayer = AudioPlayer();
  final AudioPlayer _sfxPlayer = AudioPlayer();
  bool _isSlowRate = false;

  JSS2AudioService._internal();

  void setSlowRate(bool isSlow) {
    _isSlowRate = isSlow;
    _phrasePlayer.setSpeed(isSlow ? 0.8 : 1.0);
  }

  Future<void> playPhrase(String audioKey, {int term = 1}) async {
    try {
      final termFolder = 'jss2_term$term';
      final path = 'assets/audio/$termFolder/$audioKey.mp3';
      await _phrasePlayer.setAsset(path);
      await _phrasePlayer.setSpeed(_isSlowRate ? 0.8 : 1.0);
      await _phrasePlayer.play();
    } catch (e) {
      debugPrint('Error playing phrase audio: $e');
    }
  }

  Future<void> playClick() async {
    try {
      await _sfxPlayer.setAsset('assets/audio/sfx_click.mp3');
      await _sfxPlayer.play();
    } catch (e) {
      debugPrint('Error playing click SFX: $e');
    }
  }

  Future<void> playCorrect() async {
    try {
      await _sfxPlayer.setAsset('assets/audio/sfx_correct.mp3');
      await _sfxPlayer.play();
    } catch (e) {
      debugPrint('Error playing correct SFX: $e');
    }
  }

  Future<void> playIncorrect() async {
    try {
      await _sfxPlayer.setAsset('assets/audio/sfx_incorrect.mp3');
      await _sfxPlayer.play();
    } catch (e) {
      debugPrint('Error playing incorrect SFX: $e');
    }
  }

  Future<void> playCelebration() async {
    try {
      await _sfxPlayer.setAsset('assets/audio/sfx_celebrate.mp3');
      await _sfxPlayer.play();
    } catch (e) {
      debugPrint('Error playing celebration SFX: $e');
    }
  }

  Future<void> playWhoosh() async {
    try {
      await _sfxPlayer.setAsset('assets/audio/sfx_whoosh.mp3');
      await _sfxPlayer.play();
    } catch (e) {
      debugPrint('Error playing whoosh SFX: $e');
    }
  }

  void dispose() {
    _phrasePlayer.dispose();
    _sfxPlayer.dispose();
  }
}
