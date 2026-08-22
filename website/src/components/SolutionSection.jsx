import React from 'react';
import { CheckCircle2, Monitor, Sparkles } from 'lucide-react';

export default function SolutionSection() {
  return (
    <>
      <section className="section bg-deep-teal" id="solution">
        <div className="container grid-asymmetric">
          <div>
            <span className="caption-label" style={{ color: 'var(--color-secondary)' }}>INTRODUCING LANG HUEY</span>
            <h2>any staff member can run a french class.</h2>
            <p style={{ fontSize: '1.1rem', color: 'rgba(255, 255, 255, 0.9)', margin: '1rem 0 1.5rem 0' }}>
              Lang Huey is a single offline software application installed on your Smartboard. With our built-in <strong>Teacher Cue Bar</strong>, any staff member can script, guide, and facilitate a complete 30-minute French class, even if they don't speak a single word of French.
            </p>

            <div className="feature-pill-group">
              <span className="feature-pill"><CheckCircle2 size={16} color="var(--color-primary)" /> NERDC Curriculum</span>
              <span className="feature-pill"><CheckCircle2 size={16} color="var(--color-primary)" /> 100% Offline Engine</span>
              <span className="feature-pill"><CheckCircle2 size={16} color="var(--color-primary)" /> Hardware Owned</span>
            </div>

            <a href="#features" className="btn btn-ghost-white">See What's Inside &darr;</a>
          </div>

          <div>
            <div style={{ background: 'rgba(255,255,255,0.06)', padding: '2rem', borderRadius: '20px', border: '1px solid rgba(20, 189, 204, 0.3)' }}>
              <span className="caption-label" style={{ color: 'var(--color-secondary)' }}>CORE PRODUCT INNOVATION</span>
              <h3 style={{ color: 'white', marginBottom: '0.75rem' }}>The On-Screen Teacher Cue Bar</h3>
              <p style={{ fontSize: '0.9375rem', color: 'rgba(255,255,255,0.85)', marginBottom: '1.5rem' }}>
                At the bottom of every slide, Lang Huey tells the supervising staff member exactly what to say or do next in Standard English:
              </p>

              <div style={{ background: '#084346', padding: '1.25rem', borderRadius: '12px', borderLeft: '4px solid var(--color-secondary)' }}>
                <div style={{ fontSize: '0.75rem', color: 'var(--color-secondary)', fontWeight: 800, textTransform: 'uppercase' }}>ON-SCREEN PROMPT</div>
                <div style={{ fontSize: '1.05rem', color: 'white', fontWeight: 600, marginTop: '0.3rem' }}>
                  "Ask Student A to come to the board and touch the image for 'l'école'."
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <div className="accent-bar">
        Works on Android Smartboards &bull; JSS1 French Launching First &bull; Chinese Language Coming Next
      </div>
    </>
  );
}
