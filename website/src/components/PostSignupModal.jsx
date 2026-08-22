import React from 'react';

export default function PostSignupModal({ isOpen, schoolName, onClose }) {
  if (!isOpen) return null;

  return (
    <div class="post-signup-modal">
      <div class="post-signup-card">
        <div style={{ fontSize: '3rem', marginBottom: '0.5rem' }}>🎉</div>
        <h2 style={{ color: 'var(--color-primary)', marginBottom: '0.5rem' }}>
          Spot Reserved for <span>{schoolName || 'Your School'}</span>!
        </h2>
        <p style={{ color: '#444', fontSize: '0.95rem', marginBottom: '1.25rem' }}>
          Thank you for joining the founding cohort of Lang Huey. You are now part of our building team.
        </p>

        {/* Professional Executive Guarantee */}
        <div class="guarantee-box">
          <div class="guarantee-title">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>
            THE LANG HUEY INSTITUTIONAL GUARANTEE
          </div>
          <div class="guarantee-text">
            Lang Huey guarantees 100% offline operational reliability, zero recurring subscription fees, exact NERDC curriculum alignment, and permanent hardware-bound single license ownership.
          </div>
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem', marginTop: '1.5rem' }}>
          <a href="https://chat.whatsapp.com/sample-channel-invite" target="_blank" rel="noopener noreferrer" class="btn btn-gold" style={{ width: '100%' }}>
            💬 Join Lang Huey WhatsApp Community Channel &rarr;
          </a>

          <a href="/lang-huey-executive-brief.html" target="_blank" rel="noopener noreferrer" class="btn btn-secondary-teal" style={{ width: '100%' }}>
            📄 Download Executive Board Brief (PDF)
          </a>
        </div>

        <button onClick={onClose} style={{ background: 'none', border: 'none', color: '#888', marginTop: '1.25rem', fontSize: '0.85rem', cursor: 'pointer', textDecoration: 'underline' }}>
          Close Window
        </button>
      </div>
    </div>
  );
}
