'use client';

import React from 'react';
import { ShieldCheck, MessageCircle, FileText, Phone } from 'lucide-react';
import Link from 'next/link';

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
          Thank you for joining the founding community of Lang Huey by NIT7ER. Your inquiry has been generated.
        </p>

        {/* Institutional Guarantee Box */}
        <div className="guarantee-box">
          <div className="guarantee-title">
            <ShieldCheck size={18} color="var(--color-primary)" />
            THE LANG HUEY INSTITUTIONAL GUARANTEE
          </div>
          <div className="guarantee-text">
            Lang Huey guarantees 100% offline operational reliability, exact NERDC curriculum alignment, and permanent single-license hardware ownership.
          </div>
        </div>

        <div style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem', marginTop: '1.5rem' }}>
          {/* STAGE GOLD RULE: Amber Gold touches ONE element per screen max */}
          <a 
            href="https://whatsapp.com/channel/0029Vb8YQkw96H4b8tpk0H0h" 
            target="_blank" 
            rel="noopener noreferrer" 
            className="btn btn-gold" 
            style={{ width: '100%' }}
          >
            <MessageCircle size={18} /> Join WhatsApp Community Channel &rarr;
          </a>

          <a 
            href="https://wa.me/2347070763135?text=Hello%20Lang%20Huey%20Team%2C%20I%20just%20submitted%20the%20prelaunch%20form%20for%20my%20school." 
            target="_blank" 
            rel="noopener noreferrer" 
            className="btn btn-secondary-teal" 
            style={{ width: '100%' }}
          >
            <Phone size={18} /> Direct WhatsApp Message (+234 707 076 3135)
          </a>

          <Link 
            href="/executive-brief" 
            target="_blank"
            className="btn btn-ghost-white" 
            style={{ width: '100%', color: 'var(--color-primary)', border: '1px solid var(--color-primary)' }}
          >
            <FileText size={18} /> View Executive Board Brief (PDF)
          </Link>
        </div>

        <button 
          onClick={onClose} 
          style={{ background: 'none', border: 'none', color: '#888', marginTop: '1.25rem', fontSize: '0.85rem', cursor: 'pointer', textDecoration: 'underline' }}
        >
          Close Window
        </button>
      </div>
    </div>
  );
}
