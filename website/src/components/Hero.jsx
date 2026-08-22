import React from 'react';

export default function Hero() {
  return (
    <section class="section bg-deep-teal hero-section">
      <div class="container grid-asymmetric">
        <div class="hero-text-content">
          <span class="caption-label" style={{ color: 'var(--color-secondary)' }}>CLASSROOM EDITION &bull; 2025</span>
          <h1 style={{ fontWeight: 900, marginBottom: '0.5rem' }}>
            french class.<br />
            no teacher.<br />
            no problem.
          </h1>
          <p class="hero-subheadline">
            Lang Huey runs complete French lessons on your school smartboard — offline, structured, and in your hands.
          </p>
          <p class="hero-supporting">
            We're building this for Nigerian schools. Join us. Your input shapes the product.
          </p>
          
          <div class="hero-cta-group">
            {/* GOLD RULE: Amber Gold touches ONE element per screen max */}
            <a href="#waitlist" class="btn btn-gold">Join the Community &rarr;</a>
            <a href="/lang-huey-executive-brief.html" target="_blank" rel="noopener noreferrer" class="btn btn-ghost-white">
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line></svg>
              Board Executive Brief (PDF)
            </a>
          </div>

          <div class="stat-strip">
            <span>1 APP</span> &middot; 
            <span>1 CLASS LEVEL</span> &middot; 
            <span>1 LANGUAGE</span> &middot; 
            <span style={{ color: 'var(--color-secondary)', fontWeight: 700 }}>OFFLINE FOREVER</span>
          </div>
        </div>

        {/* Hero Visual: Animated Video Showcase Placeholder */}
        <div class="hero-visual">
          <div class="smartboard-showcase">
            <div class="showcase-header">
              <span>SMARTBOARD CLASSROOM SHOWCASE &bull; ANIMATED DEMO</span>
              <span>1080P HIGH DEFINITION</span>
            </div>

            <div class="animated-video-screen">
              <div class="video-play-indicator">
                <div class="pulse-dot"></div>
                <span>PLAYING ANIMATED SHOWCASE</span>
              </div>

              <div style={{ textAlign: 'center', margin: '2rem 0' }}>
                <div style={{ fontSize: '2.5rem', marginBottom: '0.25rem' }}>🇫🇷</div>
                <div style={{ fontSize: '2.5rem', fontWeight: 900, color: 'white' }}>Bonjour !</div>
                <div style={{ fontSize: '1.15rem', color: 'var(--color-secondary)', fontWeight: 600 }}>Hello / Good morning</div>
              </div>

              {/* The Core Product Innovation: Teacher Cue Bar */}
              <div class="teacher-cue-bar-container">
                <span class="cue-badge">TEACHER CUE</span>
                <span class="cue-text">Play audio twice. Ask class to repeat "Bonjour" after each play.</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
