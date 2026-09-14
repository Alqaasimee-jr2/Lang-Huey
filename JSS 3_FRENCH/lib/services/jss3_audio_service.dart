import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

class JSS3AudioService {
  static final JSS3AudioService _instance = JSS3AudioService._internal();
  factory JSS3AudioService() => _instance;

  final AudioPlayer _phrasePlayer = AudioPlayer();
  final AudioPlayer _sfxPlayer = AudioPlayer();
  bool _isSlowRate = false;

  JSS3AudioService._internal();

  void setSlowRate(bool isSlow) {
    _isSlowRate = isSlow;
    _phrasePlayer.setSpeed(isSlow ? 0.8 : 1.0);
  }

  Future<void> playPhrase(String audioKey, {int term = 1}) async {
    try {
      final termFolder = 'jss3_term$term';
      final path = 'assets/audio/$termFolder/$audioKey.mp3';
      await _phrasePlayer.setAsset(path);
      await _phrasePlayer.setSpeed(_isSlowRate ? 0.8 : 1.0);
      await _phrasePlayer.play();
    } catch (e) {
      debugPrint('Error playing phrase audio ($audioKey): $e');
    }
  }

  Future<void> _playSfxFile(String sfxBaseName) async {
    try {
      await _sfxPlayer.stop();
      final candidatePaths = [
        'assets/audio/sfx_$sfxBaseName.mp3',
        'assets/audio/$sfxBaseName.mp3',
        'assets/audio/sfx/$sfxBaseName.mp3',
        'assets/audio/jss3_term1/sfx_$sfxBaseName.mp3',
      ];
      for (final path in candidatePaths) {
        try {
          await _sfxPlayer.setAsset(path);
          await _sfxPlayer.play();
          break;
        } catch (_) {}
      }
    } catch (e) {
      debugPrint('Error playing SFX $sfxBaseName: $e');
    }
  }

  Future<void> playClick() => _playSfxFile('click');
  Future<void> playCorrect() => _playSfxFile('correct');
  Future<void> playIncorrect() => _playSfxFile('incorrect');
  Future<void> playCelebration() => _playSfxFile('celebrate');
  Future<void> playCelebrate() => playCelebration();
  Future<void> playWhoosh() => _playSfxFile('whoosh');

  void dispose() {
    _phrasePlayer.dispose();
    _sfxPlayer.dispose();
  }
}
