import React from 'react';
import { FileText } from 'lucide-react';

export default function Hero() {
  return (
    <section className="section bg-deep-teal hero-section">
      <div className="container grid-asymmetric">
        <div className="hero-text-content">
          <span className="caption-label" style={{ color: 'var(--color-secondary)' }}>CLASSROOM EDITION &bull; 2026</span>
          <h1 style={{ fontWeight: 900, marginBottom: '0.5rem' }}>
            french class.<br />
            no teacher.<br />
            no problem.
          </h1>
          <p className="hero-subheadline">
            Lang Huey runs complete French lessons on your school smartboard: offline, structured, and in your hands.
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

        {/* Hero Visual: Clean Video Player Showcase */}
        <div className="hero-visual">
          <div className="smartboard-showcase">
            <div className="animated-video-screen" style={{ padding: 0, overflow: 'hidden', background: '#000', borderRadius: '14px' }}>
              <video 
                src="/media/showcase.mp4" 
                autoPlay 
                loop 
                muted 
                playsInline 
                controls
                style={{ width: '100%', height: '100%', objectFit: 'cover', borderRadius: '14px', display: 'block' }}
              />
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
