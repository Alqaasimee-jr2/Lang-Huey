import React from 'react';
import { FileText, Play, Volume2 } from 'lucide-react';

export default function Hero() {
  return (
    <section className="section bg-deep-teal hero-section">
      <div className="container grid-asymmetric">
        <div className="hero-text-content">
          <span className="caption-label" style={{ color: 'var(--color-secondary)' }}>A PRODUCT OF NIT7ER &bull; 2025</span>
          <h1 style={{ fontWeight: 900, marginBottom: '0.5rem' }}>
            french class.<br />
            no teacher.<br />
            no problem.
          </h1>
          <p className="hero-subheadline">
            Lang Huey runs complete French lessons on your school smartboard — offline, structured, and in your hands.
          </p>
          <p className="hero-supporting">
            We're building this for Nigerian schools. Join us. Your input shapes the product.
          </p>
          
          <div className="hero-cta-group">
            {/* STAGE GOLD RULE: Amber Gold touches EXCLUSIVELY ONE element per screen max */}
            <a href="#waitlist" className="btn btn-gold">Join the Community &rarr;</a>
            <a href="/lang-huey-executive-brief.html" target="_blank" rel="noopener noreferrer" className="btn btn-ghost-white">
              <FileText size={18} />
              Board Executive Brief (PDF)
            </a>
          </div>

          <div className="stat-strip">
            <span>1 APP</span> &middot; 
            <span>1 CLASS LEVEL</span> &middot; 
            <span>1 LANGUAGE</span> &middot; 
            <span style={{ color: 'var(--color-secondary)', fontWeight: 700 }}>OFFLINE FOREVER</span>
          </div>
        </div>

        {/* Hero Visual: Animated Video Showcase Container */}
        <div className="hero-visual">
          <div className="smartboard-showcase">
            <div className="showcase-header">
              <span>SMARTBOARD CLASSROOM SHOWCASE &bull; ANIMATED DEMO</span>
              <span>1080P HIGH DEFINITION</span>
            </div>

            <div className="animated-video-screen">
              <div className="video-play-indicator">
                <div className="pulse-dot"></div>
                <span>PLAYING ANIMATED SHOWCASE</span>
              </div>

              <div style={{ textAlign: 'center', margin: '2rem 0' }}>
                <div className="flag-badge-fr" style={{ display: 'inline-flex', alignItems: 'center', gap: '0.4rem', background: 'rgba(255,255,255,0.15)', padding: '0.3rem 0.8rem', borderRadius: '9999px', fontSize: '0.85rem', marginBottom: '0.75rem' }}>
                  <svg width="20" height="14" viewBox="0 0 3 2"><rect width="1" height="2" fill="#002395"/><rect x="1" width="1" height="2" fill="#FFFFFF"/><rect x="2" width="1" height="2" fill="#ED2939"/></svg>
                  <span>French &bull; JSS1 Term 1</span>
                </div>
                <div style={{ fontSize: '2.75rem', fontWeight: 900, color: 'white', letterSpacing: '-0.02em' }}>Bonjour !</div>
                <div style={{ fontSize: '1.15rem', color: 'var(--color-secondary)', fontWeight: 600 }}>Hello / Good morning</div>
              </div>

              {/* Core Innovation: On-Screen Teacher Cue Bar */}
              <div className="teacher-cue-bar-container">
                <span className="cue-badge">TEACHER CUE</span>
                <span className="cue-text">Play audio twice. Ask class to repeat "Bonjour" after each play.</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
