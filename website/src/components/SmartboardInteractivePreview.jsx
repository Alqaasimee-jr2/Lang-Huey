import React, { useState } from 'react';
import { Volume2, Sparkles } from 'lucide-react';

const VOCAB_SAMPLES = [
  {
    id: 'bonjour',
    french: 'Bonjour !',
    english: 'Hello / Good morning',
    audio: '/assets/audio/bonjour.mp3',
    cue: "Teacher Cue: Play the audio twice. Ask Row 1 to repeat 'Bonjour !' with high energy.",
    icon: '👋'
  },
  {
    id: 'merci',
    french: 'Merci beaucoup',
    english: 'Thank you very much',
    audio: '/assets/audio/merci.mp3',
    cue: "Teacher Cue: Ask students: 'What do we say when someone gives us a gift in French?' Tap to listen.",
    icon: '🙏'
  },
  {
    id: 'benin',
    french: 'Le Bénin',
    english: 'Benin Republic (Neighboring Country)',
    audio: '/assets/audio/le_benin.mp3',
    cue: "Teacher Cue: Point to the West African map. Remind students that Benin is Nigeria's French-speaking neighbor.",
    icon: '🗺️'
  },
  {
    id: 'aurevoir',
    french: 'Au revoir !',
    english: 'Goodbye / See you later',
    audio: '/assets/audio/au_revoir.mp3',
    cue: "Teacher Cue: Wave to the class. Have everyone practice saying 'Au revoir' before ending the period.",
    icon: '✨'
  }
];

export default function SmartboardInteractivePreview() {
  const [selectedItem, setSelectedItem] = useState(VOCAB_SAMPLES[0]);
  const [speed, setSpeed] = useState(1.0);
  const [quizAnswered, setQuizAnswered] = useState(false);

  const playAudio = (item) => {
    setSelectedItem(item);

    try {
      const audio = new Audio(item.audio);
      audio.playbackRate = speed;
      audio.onerror = () => {
        if ('speechSynthesis' in window) {
          const utterance = new SpeechSynthesisUtterance(item.french);
          utterance.lang = 'fr-FR';
          utterance.rate = speed;
          window.speechSynthesis.speak(utterance);
        }
      };
      audio.play().catch(() => {});
    } catch (e) {
      if ('speechSynthesis' in window) {
        const utterance = new SpeechSynthesisUtterance(item.french);
        utterance.lang = 'fr-FR';
        utterance.rate = speed;
        window.speechSynthesis.speak(utterance);
      }
    }
  };

  const handleQuizChoice = (isCorrect) => {
    setQuizAnswered(true);
    if (isCorrect) {
      try {
        const chime = new Audio('/assets/audio/sfx_correct.mp3');
        chime.play().catch(() => {});
      } catch (e) {}
    }
  };

  return (
    <section className="section bg-warm-cream" id="interactive-demo" style={{ paddingTop: '3rem', paddingBottom: '4rem' }}>
      <div className="container" style={{ textAlign: 'center', marginBottom: '2rem' }}>
        <span className="feature-pill" style={{ background: 'var(--color-primary)', color: 'white', marginBottom: '0.75rem' }}>
          TRY THE INTERACTIVE SMARTBOARD DEMO
        </span>
        <h2 style={{ color: 'var(--color-primary)', fontSize: '2rem' }}>
          experience the teacher cue engine live.
        </h2>
        <p style={{ maxWidth: '650px', margin: '0.5rem auto 0 auto', color: '#555' }}>
          Tap below to test how any teacher guides a class with zero French knowledge.
        </p>
      </div>

      <div className="container">
        {/* Smartboard Display Chassis */}
        <div style={{
          background: '#0D7377',
          borderRadius: '24px',
          padding: '1.25rem',
          boxShadow: '0 20px 50px rgba(13, 115, 119, 0.25)',
          border: '4px solid #14BDCC',
          maxWidth: '900px',
          margin: '0 auto'
        }}>
          {/* Smartboard Top Bar */}
          <div style={{
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center',
            background: 'rgba(0,0,0,0.2)',
            padding: '0.6rem 1.2rem',
            borderRadius: '12px',
            marginBottom: '1rem',
            color: 'white',
            fontSize: '0.875rem'
          }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem', fontWeight: 700 }}>
              <span style={{ width: '10px', height: '10px', borderRadius: '50%', background: '#48BB78' }}></span>
              LANG HUEY SMARTBOARD &bull; PRIMARY 4 / PRIMARY 5 FRENCH
            </div>

            {/* Playback Speed Switch */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
              <span style={{ fontSize: '0.75rem', opacity: 0.8 }}>SPEED:</span>
              <button 
                onClick={() => setSpeed(0.8)}
                style={{
                  background: speed === 0.8 ? 'var(--color-accent-gold)' : 'rgba(255,255,255,0.15)',
                  color: speed === 0.8 ? '#1C1C1C' : 'white',
                  border: 'none',
                  borderRadius: '15px',
                  padding: '3px 10px',
                  fontSize: '0.75rem',
                  fontWeight: 700,
                  cursor: 'pointer'
                }}
              >
                0.8x Slower
              </button>
              <button 
                onClick={() => setSpeed(1.0)}
                style={{
                  background: speed === 1.0 ? 'var(--color-secondary)' : 'rgba(255,255,255,0.15)',
                  color: speed === 1.0 ? '#1C1C1C' : 'white',
                  border: 'none',
                  borderRadius: '15px',
                  padding: '3px 10px',
                  fontSize: '0.75rem',
                  fontWeight: 700,
                  cursor: 'pointer'
                }}
              >
                1.0x Normal
              </button>
            </div>
          </div>

          {/* Interactive Classroom Stage */}
          <div style={{
            background: '#FFFFFF',
            borderRadius: '16px',
            padding: '1.75rem',
            minHeight: '260px'
          }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '1.25rem' }}>
              <span style={{ fontSize: '0.8rem', fontWeight: 800, color: 'var(--color-primary)', letterSpacing: '0.08em' }}>
                PHONETICS & VOCABULARY LAB
              </span>
              <span style={{ fontSize: '0.8rem', color: '#666' }}>
                Tap any card to pronounce
              </span>
            </div>

            {/* Vocabulary Interactive Grid */}
            <div style={{
              display: 'grid',
              gridTemplateColumns: 'repeat(auto-fit, minmax(180px, 1fr))',
              gap: '1rem',
              marginBottom: '1.5rem'
            }}>
              {VOCAB_SAMPLES.map((item) => {
                const isSelected = selectedItem.id === item.id;
                return (
                  <div 
                    key={item.id}
                    onClick={() => playAudio(item)}
                    style={{
                      background: isSelected ? 'rgba(20, 189, 204, 0.12)' : '#F5F0E8',
                      border: isSelected ? '2px solid var(--color-secondary)' : '1px solid #E2D9CC',
                      borderRadius: '14px',
                      padding: '1rem',
                      cursor: 'pointer',
                      transition: 'all 0.2s ease',
                      textAlign: 'center'
                    }}
                  >
                    <div style={{ fontSize: '1.8rem', marginBottom: '0.3rem' }}>{item.icon}</div>
                    <div style={{ fontSize: '1.15rem', fontWeight: 800, color: 'var(--color-primary)' }}>
                      {item.french}
                    </div>
                    <div style={{ fontSize: '0.8rem', color: '#555', marginTop: '0.2rem' }}>
                      {item.english}
                    </div>
                    <div style={{
                      marginTop: '0.6rem',
                      display: 'inline-flex',
                      alignItems: 'center',
                      gap: '0.3rem',
                      fontSize: '0.75rem',
                      fontWeight: 700,
                      color: isSelected ? 'var(--color-primary)' : 'var(--color-secondary)'
                    }}>
                      <Volume2 size={14} /> Tap Audio
                    </div>
                  </div>
                );
              })}
            </div>

            {/* Interactive Check Drill Snippet */}
            <div style={{
              background: '#F9FBFB',
              border: '1px solid #D1EBEB',
              borderRadius: '12px',
              padding: '1rem',
              marginTop: '1rem'
            }}>
              <div style={{ fontSize: '0.85rem', fontWeight: 700, color: 'var(--color-primary)', marginBottom: '0.5rem' }}>
                🎯 Smartboard Quick Check Drill: "How do you say 'Thank you very much' in French?"
              </div>
              <div style={{ display: 'flex', gap: '0.75rem', flexWrap: 'wrap' }}>
                <button
                  onClick={() => handleQuizChoice(false)}
                  style={{
                    padding: '0.5rem 1rem',
                    borderRadius: '8px',
                    border: '1px solid #CCC',
                    background: 'white',
                    cursor: 'pointer',
                    fontSize: '0.85rem'
                  }}
                >
                  A. Bonjour
                </button>
                <button
                  onClick={() => handleQuizChoice(true)}
                  style={{
                    padding: '0.5rem 1rem',
                    borderRadius: '8px',
                    border: quizAnswered ? '2px solid #38A169' : '1px solid #CCC',
                    background: quizAnswered ? '#E6FFFA' : 'white',
                    fontWeight: quizAnswered ? 800 : 500,
                    cursor: 'pointer',
                    fontSize: '0.85rem',
                    color: quizAnswered ? '#234E52' : '#1C1C1C'
                  }}
                >
                  B. Merci beaucoup {quizAnswered && '✅ Correct!'}
                </button>
                <button
                  onClick={() => handleQuizChoice(false)}
                  style={{
                    padding: '0.5rem 1rem',
                    borderRadius: '8px',
                    border: '1px solid #CCC',
                    background: 'white',
                    cursor: 'pointer',
                    fontSize: '0.85rem'
                  }}
                >
                  C. Au revoir
                </button>
              </div>
            </div>
          </div>

          {/* Core Innovation: On-Screen Live Teacher Cue Bar */}
          <div style={{
            marginTop: '1rem',
            background: '#084346',
            borderRadius: '12px',
            padding: '1rem 1.25rem',
            borderLeft: '5px solid var(--color-secondary)',
            display: 'flex',
            alignItems: 'center',
            gap: '0.75rem',
            color: 'white'
          }}>
            <Sparkles size={22} color="var(--color-secondary)" style={{ minWidth: '22px' }} />
            <div>
              <div style={{ fontSize: '0.7rem', fontWeight: 800, color: 'var(--color-secondary)', letterSpacing: '0.08em', textTransform: 'uppercase' }}>
                LIVE TEACHER CUE BAR (ON SMARTBOARD DISPLAY)
              </div>
              <div style={{ fontSize: '0.95rem', fontWeight: 600, marginTop: '0.2rem' }}>
                {selectedItem.cue}
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
