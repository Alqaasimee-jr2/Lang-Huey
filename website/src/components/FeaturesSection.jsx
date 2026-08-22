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

      {/* Authentic NERDC Scheme of Work Snippet Card */}
      <div className="container">
        <div className="nerdc-card">
          <span className="caption-label">GOVERNMENT CURRICULUM ALIGNMENT</span>
          <h3 style={{ color: 'var(--color-primary)', fontSize: '1.5rem', marginBottom: '0.5rem' }}>
            JSS1 French — Term 1 Scheme of Work Snippets
          </h3>
          <p style={{ color: '#444', fontSize: '0.95rem' }}>
            Every lesson in Lang Huey maps directly to the official Nigerian Educational Research & Development Council (NERDC) syllabus for junior secondary schools:
          </p>

          <div className="curriculum-list">
            <div className="curriculum-item">
              <CheckCircle size={18} color="var(--color-secondary)" />
              <div>
                <span style={{ color: 'var(--color-primary)', fontWeight: 800 }}>WEEK 1–2: </span>
                <span>Greetings & Self-Introduction (Salutations et Présentation)</span>
              </div>
            </div>
            <div className="curriculum-item">
              <CheckCircle size={18} color="var(--color-secondary)" />
              <div>
                <span style={{ color: 'var(--color-primary)', fontWeight: 800 }}>WEEK 3–4: </span>
                <span>School Objects & Classroom Environment (L'école et les objets)</span>
              </div>
            </div>
            <div className="curriculum-item">
              <CheckCircle size={18} color="var(--color-secondary)" />
              <div>
                <span style={{ color: 'var(--color-primary)', fontWeight: 800 }}>WEEK 5–6: </span>
                <span>Numbers 1–100 & Age (Les Nombres et l'Âge)</span>
              </div>
            </div>
            <div className="curriculum-item">
              <CheckCircle size={18} color="var(--color-secondary)" />
              <div>
                <span style={{ color: 'var(--color-primary)', fontWeight: 800 }}>WEEK 7–8: </span>
                <span>Family & Home (La Famille)</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
