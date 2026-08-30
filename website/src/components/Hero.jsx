'use client';

import React from 'react';
import { FileText, MessageCircle, Calendar } from 'lucide-react';
import Link from 'next/link';

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
            We're building this for Nigerian schools. Join our community or book a slot for your school.
          </p>
          
          <div className="hero-cta-group" style={{ display: 'flex', gap: '0.75rem', flexWrap: 'wrap' }}>
            {/* STAGE GOLD RULE: Amber Gold touches EXCLUSIVELY ONE element per screen max */}
            <a 
              href="https://whatsapp.com/channel/0029Vb8YQkw96H4b8tpk0H0h" 
              target="_blank" 
              rel="noopener noreferrer" 
              className="btn btn-gold"
            >
              <MessageCircle size={18} /> Join the Community &rarr;
            </a>

            <a 
              href="#waitlist" 
              className="btn btn-ghost-white"
            >
              <Calendar size={18} /> Book a Slot
            </a>

            <Link 
              href="/executive-brief" 
              className="btn btn-ghost-white" 
              style={{ opacity: 0.9 }}
            >
              <FileText size={18} /> Brief (PDF)
            </Link>
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
