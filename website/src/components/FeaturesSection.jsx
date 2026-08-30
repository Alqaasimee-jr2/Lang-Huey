'use client';

import React from 'react';
import { BookOpen, WifiOff, ShieldCheck, CheckCircle } from 'lucide-react';

export default function FeaturesSection() {
  return (
    <section className="section bg-white" id="features">
      <div className="container" style={{ textAlign: 'center' }}>
        <span className="caption-label">BUILT FOR NIGERIAN CLASSROOMS</span>
        <h2 style={{ color: 'var(--color-text-charcoal)' }}>everything your school needs.</h2>
      </div>

      <div className="container features-grid">
        <div className="feature-card">
          <div className="feature-icon-wrapper">
            <BookOpen size={36} />
          </div>
          <h3>JSS1 French Pack</h3>
          <p>Comprehensive NERDC scheme of work. 3 terms, 24 structured lessons with native audio recordings, vocabulary cards, and end-of-lesson checks.</p>
        </div>

        <div className="feature-card">
          <div className="feature-icon-wrapper">
            <WifiOff size={36} />
          </div>
          <h3>Fully Offline</h3>
          <p>Zero internet dependency. Once installed, it runs reliably in every classroom, every single period, without network lag or data costs.</p>
        </div>

        <div className="feature-card">
          <div className="feature-icon-wrapper">
            <ShieldCheck size={36} />
          </div>
          <h3>Hardware Locked</h3>
          <p>Hardware-locked license bound to your Smartboard device. Simple single installation that stays on your board permanently.</p>
        </div>
      </div>

      {/* Authentic NERDC Scheme of Work Showcase */}
      <div className="container">
        <div className="nerdc-card">
          <span className="caption-label">GOVERNMENT CURRICULUM ALIGNMENT</span>
          <h3 style={{ color: 'var(--color-primary)', fontSize: '1.5rem', marginBottom: '0.5rem' }}>
            Comprehensive Primary & Secondary French Coverage (78+ Weeks Digitized)
          </h3>
          <p style={{ color: '#444', fontSize: '0.95rem', marginBottom: '1.5rem' }}>
            Every lesson in Lang Huey maps directly to the official Nigerian Educational Research & Development Council (NERDC) syllabus:
          </p>

          <div className="curriculum-list" style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(280px, 1fr))', gap: '1rem' }}>
            <div className="curriculum-item" style={{ background: '#F5F0E8', padding: '1rem', borderRadius: '10px' }}>
              <CheckCircle size={20} color="var(--color-primary)" />
              <div>
                <span style={{ color: 'var(--color-primary)', fontWeight: 800 }}>PRIMARY 4 (39 WEEKS): </span>
                <p style={{ fontSize: '0.85rem', color: '#444', margin: '0.2rem 0 0 0' }}>
                  Greetings, Numbers 1–20, Francophone Geography, School Environment, Time, Daily Routine, Food Buffet, Body Clinic & Weather.
                </p>
              </div>
            </div>

            <div className="curriculum-item" style={{ background: '#F5F0E8', padding: '1rem', borderRadius: '10px' }}>
              <CheckCircle size={20} color="var(--color-primary)" />
              <div>
                <span style={{ color: 'var(--color-primary)', fontWeight: 800 }}>PRIMARY 5 (39 WEEKS): </span>
                <p style={{ fontSize: '0.85rem', color: '#444', margin: '0.2rem 0 0 0' }}>
                  Alphabet Sounds, Counting 21–60 & Market Naira Math, Extended Family, Community Neighbors, Gratitude Letters, Timetable & Dream Careers.
                </p>
              </div>
            </div>

            <div className="curriculum-item" style={{ background: '#F5F0E8', padding: '1rem', borderRadius: '10px' }}>
              <CheckCircle size={20} color="var(--color-primary)" />
              <div>
                <span style={{ color: 'var(--color-primary)', fontWeight: 800 }}>JSS1 FRENCH PACK: </span>
                <p style={{ fontSize: '0.85rem', color: '#444', margin: '0.2rem 0 0 0' }}>
                  Greetings & Self-Introduction, Classroom Objects, Numbers 1–100 & Age, Family & Home, WAEC Foundation preparation.
                </p>
              </div>
            </div>

            <div className="curriculum-item" style={{ background: '#F5F0E8', padding: '1rem', borderRadius: '10px' }}>
              <CheckCircle size={20} color="var(--color-secondary)" />
              <div>
                <span style={{ color: 'var(--color-primary)', fontWeight: 800 }}>30 INTERACTIVE PATTERNS: </span>
                <p style={{ fontSize: '0.85rem', color: '#444', margin: '0.2rem 0 0 0' }}>
                  Map Explorer, Time Dials, Market Kiosk, Body Anatomy Node Explorer, Doctor Pain Clinic, 4-Station Speed Revision Buzzer Rallies.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
