import React from 'react';

export default function RealitySection() {
  return (
    <section class="section bg-warm-cream">
      <div class="container grid-asymmetric">
        <div>
          <svg width="100%" height="280" viewBox="0 0 400 280" fill="none" xmlns="http://www.w3.org/2000/svg" style={{ maxWidth: '400px', borderRadius: '16px', boxShadow: '0 4px 16px rgba(0,0,0,0.06)' }}>
            <rect width="400" height="280" rx="16" fill="#FFFFFF"/>
            <rect x="30" y="30" width="340" height="180" rx="12" fill="#EAEAEA"/>
            <circle cx="200" cy="110" r="35" fill="#CBD5E1"/>
            <path d="M175 160 C175 135 225 135 225 160" stroke="#94A3B8" strokeWidth="8" strokeLinecap="round"/>
            <text x="200" y="235" textAnchor="middle" fill="#0D7377" fontWeight="800" fontSize="15">FRENCH PERIOD: VACANT SLOT</text>
          </svg>
        </div>

        <div>
          <span class="caption-label">THE REALITY IN NIGERIAN SCHOOLS</span>
          <h2 style={{ color: 'var(--color-text-charcoal)', marginBottom: '1rem' }}>
            finding a french teacher in nigeria is hard.
          </h2>
          <p style={{ fontSize: '1.0625rem', color: '#333', marginBottom: '1.5rem' }}>
            School proprietors are tired of the constant turnover, high salary demands for specialist teachers, and the nightmare logistics of finding qualified French instructors. You want to offer French. The system makes it harder than it should be.
          </p>
        </div>
      </div>

      {/* Pain Cards */}
      <div class="container pain-cards-grid">
        <div class="pain-card">
          <div class="pain-icon">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><line x1="18" y1="8" x2="23" y2="13"></line><line x1="23" y1="8" x2="18" y2="13"></line></svg>
          </div>
          <h3>No Teacher Available</h3>
          <p>Qualified French teachers are hard to find and harder to keep. Vacant slots disrupt your timetable.</p>
        </div>

        <div class="pain-card">
          <div class="pain-icon">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><line x1="12" y1="1" x2="12" y2="23"></line><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path></svg>
          </div>
          <h3>Budget Drain</h3>
          <p>Virtual live classes drain your monthly school budget and constantly fail over unstable internet.</p>
        </div>

        <div class="pain-card">
          <div class="pain-icon">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"></polyline></svg>
          </div>
          <h3>Students Falling Behind</h3>
          <p>Every missed French period creates a preparation gap for mandatory WAEC and BECE exams.</p>
        </div>
      </div>
    </section>
  );
}
