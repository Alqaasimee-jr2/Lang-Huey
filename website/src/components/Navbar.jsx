'use client';

import React, { useState } from 'react';
import { Menu, X, MessageCircle, Calendar } from 'lucide-react';
import Link from 'next/link';

export default function Navbar() {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  return (
    <header className="navbar">
      <div className="container" style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <Link href="/" className="brand-logo">
          lang <span>huey</span>
        </Link>

        {/* Desktop Navigation */}
        <nav className="desktop-nav" style={{ display: 'flex', alignItems: 'center', gap: '1.25rem' }}>
          <a href="#solution" style={{ color: 'white', textDecoration: 'none', fontSize: '0.875rem', fontWeight: 600 }}>
            Solution
          </a>
          <a href="#interactive-demo" style={{ color: 'white', textDecoration: 'none', fontSize: '0.875rem', fontWeight: 600 }}>
            Demo
          </a>
          <a href="#features" style={{ color: 'white', textDecoration: 'none', fontSize: '0.875rem', fontWeight: 600 }}>
            Curriculum
          </a>
          <Link href="/executive-brief" style={{ color: 'white', textDecoration: 'none', fontSize: '0.875rem', fontWeight: 600 }}>
            Executive Brief
          </Link>
          <a 
            href="https://whatsapp.com/channel/0029Vb8YQkw96H4b8tpk0H0h"
            target="_blank"
            rel="noopener noreferrer"
            className="btn btn-ghost-teal" 
            style={{ padding: '0.45rem 1rem', fontSize: '0.825rem' }}
          >
            <MessageCircle size={15} /> Join the Community
          </a>
          <a 
            href="#waitlist" 
            className="btn btn-ghost-white" 
            style={{ padding: '0.45rem 1rem', fontSize: '0.825rem' }}
          >
            <Calendar size={15} /> Book a Slot
          </a>
        </nav>

        {/* Mobile Hamburger Button */}
        <button 
          className="mobile-menu-btn"
          onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
          aria-label="Toggle menu"
          style={{
            display: 'none',
            background: 'none',
            border: 'none',
            color: 'white',
            cursor: 'pointer',
            padding: '0.5rem'
          }}
        >
          {mobileMenuOpen ? <X size={26} /> : <Menu size={26} />}
        </button>
      </div>

      {/* Mobile Menu Drawer */}
      {mobileMenuOpen && (
        <div style={{
          background: 'var(--color-primary-dark)',
          borderTop: '1px solid rgba(255,255,255,0.1)',
          padding: '1.5rem 1rem',
          display: 'flex',
          flexDirection: 'column',
          gap: '1rem'
        }}>
          <a 
            href="#solution" 
            onClick={() => setMobileMenuOpen(false)}
            style={{ color: 'white', textDecoration: 'none', fontSize: '1rem', fontWeight: 600, padding: '0.5rem 0' }}
          >
            Solution
          </a>
          <a 
            href="#interactive-demo" 
            onClick={() => setMobileMenuOpen(false)}
            style={{ color: 'white', textDecoration: 'none', fontSize: '1rem', fontWeight: 600, padding: '0.5rem 0' }}
          >
            Interactive Demo
          </a>
          <a 
            href="#features" 
            onClick={() => setMobileMenuOpen(false)}
            style={{ color: 'white', textDecoration: 'none', fontSize: '1rem', fontWeight: 600, padding: '0.5rem 0' }}
          >
            Curriculum
          </a>
          <Link 
            href="/executive-brief" 
            onClick={() => setMobileMenuOpen(false)}
            style={{ color: 'white', textDecoration: 'none', fontSize: '1rem', fontWeight: 600, padding: '0.5rem 0' }}
          >
            Executive Board Brief
          </Link>
          <a 
            href="https://whatsapp.com/channel/0029Vb8YQkw96H4b8tpk0H0h"
            target="_blank"
            rel="noopener noreferrer"
            className="btn btn-ghost-teal"
            style={{ textAlign: 'center' }}
          >
            <MessageCircle size={18} /> Join the Community &rarr;
          </a>
          <a 
            href="#waitlist" 
            onClick={() => setMobileMenuOpen(false)}
            className="btn btn-ghost-white"
            style={{ textAlign: 'center' }}
          >
            <Calendar size={18} /> Book a Slot &rarr;
          </a>
        </div>
      )}
    </header>
  );
}
