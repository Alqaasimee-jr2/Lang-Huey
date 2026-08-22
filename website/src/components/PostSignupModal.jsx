import React from 'react';
import { ShieldCheck, MessageCircle, FileText } from 'lucide-react';

export default function PostSignupModal({ isOpen, schoolName, onClose }) {
  if (!isOpen) return null;

  return (
    <div className="post-signup-modal">
      <div className="post-signup-card">
        <div style={{ fontSize: '3rem', marginBottom: '0.5rem' }}>🎉</div>
        <h2 style={{ color: 'var(--color-primary)', marginBottom: '0.5rem' }}>
          Spot Reserved for <span>{schoolName || 'Your School'}</span>!
        </h2>
        <p style={{ color: '#444', fontSize: '0.95rem', marginBottom: '1.25rem' }}>
          Thank you for joining the founding cohort of Lang Huey by NIT7ER. You are now part of our building team.
        </p>

        {/* Professional Executive Guarantee */}
        <div className="guarantee-box">
          <div className="guarantee-title">
            <ShieldCheck size={18} color="var(--color-primary)" />
            THE LANG HUEY INSTITUTIONAL GUARANTEE
          </div>
          <div className="guarantee-text">
            Lang Huey guarantees 100% offline operational reliability, exact NERDC curriculum alignment, and permanent hardware-bound single license ownership.
          </div>
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem', marginTop: '1.5rem' }}>
          {/* STAGE GOLD RULE: Amber Gold touches ONE element per screen max */}
          <a href="https://chat.whatsapp.com/sample-channel-invite" target="_blank" rel="noopener noreferrer" className="btn btn-gold" style={{ width: '100%' }}>
            <MessageCircle size={18} /> Join Lang Huey WhatsApp Community Channel &rarr;
          </a>

          <a href="/lang-huey-executive-brief.html" target="_blank" rel="noopener noreferrer" className="btn btn-secondary-teal" style={{ width: '100%' }}>
            <FileText size={18} /> Download Executive Board Brief (PDF)
          </a>
        </div>

        <button onClick={onClose} style={{ background: 'none', border: 'none', color: '#888', marginTop: '1.25rem', fontSize: '0.85rem', cursor: 'pointer', textDecoration: 'underline' }}>
          Close Window
        </button>
      </div>
    </div>
  );
}
