import React from 'react';

export default function FeaturesSection() {
  return (
    <section class="section bg-white" id="features">
      <div class="container" style={{ textAlign: 'center' }}>
        <span class="caption-label">BUILT FOR NIGERIAN CLASSROOMS</span>
        <h2 style={{ color: 'var(--color-text-charcoal)' }}>everything your school needs.</h2>
      </div>

      <div class="container features-grid">
        <div class="feature-card">
          <div class="feature-icon-wrapper">
            <svg width="36" height="36" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
          </div>
          <h3>JSS1 French Pack</h3>
          <p>Comprehensive NERDC scheme of work. 3 terms, 24 structured lessons with native audio recordings, vocabulary cards, and end-of-lesson checks.</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon-wrapper">
            <svg width="36" height="36" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><line x1="1" y1="1" x2="23" y2="23"></line><path d="M16.72 11.06A10.94 10.94 0 0 1 19 12.55"></path><path d="M5 12.55a10.94 10.94 0 0 1 5.17-2.39"></path><path d="M10.71 5.05A16 16 0 0 1 22.58 9"></path><path d="M1.42 9a15.91 15.91 0 0 1 4.7-2.88"></path><path d="M8.53 16.11a6 6 0 0 1 6.95 0"></path><line x1="12" y1="20" x2="12.01" y2="20"></line></svg>
          </div>
          <h3>Fully Offline</h3>
          <p>Zero internet dependency. Once installed, it runs reliably in every classroom, every single period, without network lag or data costs.</p>
        </div>

        <div class="feature-card">
          <div class="feature-icon-wrapper">
            <svg width="36" height="36" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
          </div>
          <h3>One-Time Payment</h3>
          <p>No subscriptions. No monthly strain. Pay once, license to your Smartboard hardware, and own the curriculum pack permanently.</p>
        </div>
      </div>

      {/* Authentic NERDC Scheme of Work Snippet Card */}
      <div class="container">
        <div class="nerdc-card">
          <span class="caption-label">GOVERNMENT CURRICULUM ALIGNMENT</span>
          <h3 style={{ color: 'var(--color-primary)', fontSize: '1.5rem', marginBottom: '0.5rem' }}>
            JSS1 French — Term 1 Scheme of Work Snippets
          </h3>
          <p style={{ color: '#444', fontSize: '0.95rem' }}>
            Every lesson in Lang Huey maps directly to the official Nigerian Educational Research & Development Council (NERDC) syllabus for junior secondary schools:
          </p>

          <div class="curriculum-list">
            <div class="curriculum-item">
              <span style={{ color: 'var(--color-primary)', fontWeight: 800 }}>WEEK 1–2:</span>
              <span>Greetings & Self-Introduction (Salutations et Présentation)</span>
            </div>
            <div class="curriculum-item">
              <span style={{ color: 'var(--color-primary)', fontWeight: 800 }}>WEEK 3–4:</span>
              <span>School Objects & Classroom Environment (L'école et les objets)</span>
            </div>
            <div class="curriculum-item">
              <span style={{ color: 'var(--color-primary)', fontWeight: 800 }}>WEEK 5–6:</span>
              <span>Numbers 1–100 & Age (Les Nombres et l'Âge)</span>
            </div>
            <div class="curriculum-item">
              <span style={{ color: 'var(--color-primary)', fontWeight: 800 }}>WEEK 7–8:</span>
              <span>Family & Home (La Famille)</span>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
