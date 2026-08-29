import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:p5_french/services/p5_audio_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('com.ryanheise.just_audio.methods'),
      (MethodCall methodCall) async {
        if (methodCall.method == 'init') {
          return {'id': 'test-player-id'};
        }
        if (methodCall.method == 'setSpeed') {
          return null;
        }
        if (methodCall.method == 'dispose') {
          return null;
        }
        return null;
      },
    );
  });

  group('P5AudioService Unit Tests', () {
    test('P5AudioService is a singleton', () {
      final s1 = P5AudioService();
      final s2 = P5AudioService();
      expect(identical(s1, s2), isTrue);
    });

    test('Initial speed is 1.0 or clamped accurately', () {
      final service = P5AudioService();
      expect(service.playbackSpeed, inInclusiveRange(0.5, 1.5));
    });

    test('Playback speed clamp limits to [0.5, 1.5]', () async {
      final service = P5AudioService();

      await service.setPlaybackSpeed(0.8);
      expect(service.playbackSpeed, equals(0.8));

      await service.setPlaybackSpeed(0.2); // Below 0.5 -> clamped to 0.5
      expect(service.playbackSpeed, equals(0.5));

      await service.setPlaybackSpeed(2.5); // Above 1.5 -> clamped to 1.5
      expect(service.playbackSpeed, equals(1.5));

      await service.setPlaybackSpeed(1.0); // Reset to 1.0
      expect(service.playbackSpeed, equals(1.0));
    });
  });
}
