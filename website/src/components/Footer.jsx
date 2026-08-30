'use client';

import React from 'react';
import Link from 'next/link';
import { MessageCircle, Phone, Calendar } from 'lucide-react';

export default function Footer() {
  return (
    <footer className="section bg-dark-footer" style={{ padding: '3.5rem 0 2rem 0' }}>
      <div className="container footer-grid" style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', flexWrap: 'wrap', gap: '2rem' }}>
        <div className="footer-brand">
          <Link href="/" className="brand-logo" style={{ color: 'white' }}>
            lang <span>huey</span>
          </Link>
          <p style={{ marginTop: '0.5rem', color: 'var(--color-secondary)', fontWeight: 600, fontSize: '0.875rem' }}>
            A PRODUCT OF NIT7ER &bull; 2026
          </p>
          <p style={{ color: 'rgba(255, 255, 255, 0.65)', fontSize: '0.85rem', maxWidth: '300px' }}>
            Offline French & foreign language lesson delivery system for Nigerian smartboards.
          </p>
        </div>

        <div className="footer-links" style={{ display: 'flex', flexDirection: 'column', gap: '0.5rem' }}>
          <div style={{ color: 'white', fontWeight: 700, fontSize: '0.9rem', marginBottom: '0.3rem' }}>Navigation</div>
          <a href="#solution" style={{ color: 'rgba(255,255,255,0.7)', textDecoration: 'none', fontSize: '0.85rem' }}>Solution Overview</a>
          <a href="#interactive-demo" style={{ color: 'rgba(255,255,255,0.7)', textDecoration: 'none', fontSize: '0.85rem' }}>Interactive Demo</a>
          <a href="#features" style={{ color: 'rgba(255,255,255,0.7)', textDecoration: 'none', fontSize: '0.85rem' }}>NERDC Curriculum</a>
          <Link href="/executive-brief" style={{ color: 'rgba(255,255,255,0.7)', textDecoration: 'none', fontSize: '0.85rem' }}>Executive Board Brief</Link>
        </div>

        <div className="footer-right" style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem' }}>
          <div style={{ color: 'white', fontWeight: 700, fontSize: '0.9rem' }}>Connect with NIT7ER</div>
          
          {/* JOIN THE COMMUNITY -> CHANNEL */}
          <a 
            href="https://whatsapp.com/channel/0029Vb8YQkw96H4b8tpk0H0h" 
            target="_blank" 
            rel="noopener noreferrer" 
            className="whatsapp-link"
            style={{ display: 'inline-flex', alignItems: 'center', gap: '0.4rem' }}
          >
            <MessageCircle size={16} /> Join the Community &rarr;
          </a>

          {/* CHAT ON WHATSAPP -> NUMBER */}
          <a 
            href="https://wa.me/2347070763135?text=Hello%20Lang%20Huey%20Team%2C%20I%20have%20an%20inquiry%20for%20my%20school." 
            target="_blank" 
            rel="noopener noreferrer" 
            style={{ color: '#68D391', textDecoration: 'none', fontSize: '0.85rem', display: 'inline-flex', alignItems: 'center', gap: '0.4rem', fontWeight: 600 }}
          >
            <Phone size={14} /> Chat on WhatsApp (+234 707 076 3135)
          </a>

          {/* BOOK A SLOT -> NUMBER / FORM */}
          <a 
            href="#waitlist" 
            style={{ color: 'var(--color-accent-gold)', textDecoration: 'none', fontSize: '0.85rem', display: 'inline-flex', alignItems: 'center', gap: '0.4rem', fontWeight: 700 }}
          >
            <Calendar size={14} /> Book a Slot for Your School &rarr;
          </a>
        </div>
      </div>

      <div className="container footer-legal" style={{ marginTop: '2.5rem', borderTop: '1px solid rgba(255,255,255,0.1)', paddingTop: '1.5rem', fontSize: '0.8rem', color: 'rgba(255,255,255,0.5)' }}>
        A PRODUCT OF NIT7ER &bull; 2026 &bull; &copy; Lang Huey. All rights reserved. Built for Nigerian Classrooms.
      </div>
    </footer>
  );
}
