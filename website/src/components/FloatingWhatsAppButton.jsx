'use client';

import React from 'react';
import { MessageCircle } from 'lucide-react';

export default function FloatingWhatsAppButton() {
  return (
    <aside aria-label="WhatsApp Quick Inquiry" style={{
      position: 'fixed',
      bottom: '24px',
      right: '24px',
      zIndex: 999
    }}>
      <a 
        href="https://wa.me/2347070763135?text=Hello%20Lang%20Huey%20Team%2C%20I%20have%20an%20inquiry%20about%20your%20offline%20smartboard%20French%20system."
        target="_blank"
        rel="noopener noreferrer"
        style={{
          display: 'flex',
          alignItems: 'center',
          gap: '0.6rem',
          background: '#25D366',
          color: 'white',
          padding: '0.75rem 1.25rem',
          borderRadius: '50px',
          boxShadow: '0 8px 24px rgba(37, 211, 102, 0.4)',
          fontWeight: 800,
          fontSize: '0.9rem',
          textDecoration: 'none',
          transition: 'transform 0.2s ease, box-shadow 0.2s ease',
        }}
        onMouseEnter={(e) => e.currentTarget.style.transform = 'translateY(-2px)'}
        onMouseLeave={(e) => e.currentTarget.style.transform = 'translateY(0)'}
      >
        <MessageCircle size={20} />
        <span>Chat with Us</span>
      </a>
    </aside>
  );
}
