'use client';

import React from 'react';

export default function WaveBanner() {
  return (
    <div style={{ position: 'relative', background: 'var(--color-base-cream)' }}>
      {/* Curved SVG Wave Divider */}
      <div style={{ width: '100%', overflow: 'hidden', lineHeight: 0, transform: 'rotate(180deg)' }}>
        <svg viewBox="0 0 1200 120" preserveAspectRatio="none" style={{ position: 'relative', display: 'block', width: 'calc(100% + 1.3px)', height: '50px' }}>
          <path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z" fill="#0D7377"></path>
        </svg>
      </div>

      <div className="container" style={{ padding: '3.5rem 0 4.5rem 0', textAlign: 'center' }}>
        <h2>build lang huey with us for your school.</h2>
        <p style={{ margin: '0.75rem 0 1.5rem 0', fontSize: '1.1rem', color: '#444' }}>
          Connect directly with NIT7ER and fellow school owners in our WhatsApp channel.
        </p>
        <a href="#waitlist" className="btn btn-secondary-teal">Join the WhatsApp Community &rarr;</a>
      </div>
    </div>
  );
}
