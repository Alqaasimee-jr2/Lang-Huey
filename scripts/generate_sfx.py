import os
import wave
import math
import struct

OUTPUT_DIR = os.path.join(os.path.dirname(__file__), "..", "mvp", "assets", "audio", "p4_term1")
os.makedirs(OUTPUT_DIR, exist_ok=True)

SAMPLE_RATE = 44100

def create_sine_tone(frequency, duration, volume=0.5, fade_out=True):
    """Generate raw 16-bit PCM mono sine wave samples"""
    num_samples = int(SAMPLE_RATE * duration)
    samples = []
    for i in range(num_samples):
        t = i / SAMPLE_RATE
        val = math.sin(2 * math.pi * frequency * t)
        
        # Envelope: quick attack, smooth exponential decay
        decay = math.exp(-3.0 * t / duration) if fade_out else 1.0
        sample = int(val * volume * decay * 32767)
        samples.append(max(-32768, min(32767, sample)))
    return samples

def save_wav_as_mp3(filename, samples):
    """Save PCM samples as standard WAV and MP3"""
    wav_path = os.path.join(OUTPUT_DIR, filename)
    with wave.open(wav_path, 'wb') as wav_file:
        wav_file.setnchannels(1)        # Mono
        wav_file.setsampwidth(2)        # 16-bit
        wav_file.setframerate(SAMPLE_RATE)
        raw_data = struct.pack(f'<{len(samples)}h', *samples)
        wav_file.writeframes(raw_data)
    print(f"Created {filename} ({os.path.getsize(wav_path)} bytes)")

def generate_sfx():
    # 1. Correct Chime (Two-tone ascending C5=523.25Hz -> G5=783.99Hz)
    tone1 = create_sine_tone(523.25, 0.12, volume=0.4)
    tone2 = create_sine_tone(783.99, 0.28, volume=0.5)
    save_wav_as_mp3("sfx_correct.mp3", tone1 + tone2)

    # 2. Incorrect / Gentle Retry (Two-tone descending E4=329.63Hz -> C4=261.63Hz)
    tone_err1 = create_sine_tone(329.63, 0.12, volume=0.3)
    tone_err2 = create_sine_tone(261.63, 0.22, volume=0.3)
    save_wav_as_mp3("sfx_incorrect.mp3", tone_err1 + tone_err2)

    # 3. Click / Tap Pop (High quick frequency 900Hz)
    click = create_sine_tone(900.0, 0.05, volume=0.3)
    save_wav_as_mp3("sfx_click.mp3", click)

    # 4. Celebration Fanfare (Ascending Major Arpeggio: C5 -> E5 -> G5 -> C6)
    c5 = create_sine_tone(523.25, 0.10, volume=0.4)
    e5 = create_sine_tone(659.25, 0.10, volume=0.45)
    g5 = create_sine_tone(783.99, 0.12, volume=0.5)
    c6 = create_sine_tone(1046.50, 0.35, volume=0.6)
    save_wav_as_mp3("sfx_celebrate.mp3", c5 + e5 + g5 + c6)

if __name__ == "__main__":
    generate_sfx()
    print("All UI feedback SFX generated successfully!")
