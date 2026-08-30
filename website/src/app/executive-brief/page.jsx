'use client';

import React from 'react';
import { ArrowLeft, Printer, MessageCircle, Phone, CheckCircle, ShieldCheck } from 'lucide-react';
import Link from 'next/link';

export default function ExecutiveBriefPage() {
  return (
    <div style={{ background: '#F5F0E8', minHeight: '100vh', padding: '2rem 1rem' }}>
      <div style={{ maxWidth: '850px', margin: '0 auto' }}>
        {/* Navigation & Print Controls */}
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '1.5rem' }} className="no-print">
          <Link 
            href="/" 
            style={{ 
              display: 'inline-flex', 
              alignItems: 'center', 
              gap: '0.4rem', 
              color: 'var(--color-primary)', 
              fontWeight: 700, 
              textDecoration: 'none' 
            }}
          >
            <ArrowLeft size={18} /> Back to Lang Huey
          </Link>

          <button 
            onClick={() => window.print()}
            style={{
              display: 'inline-flex',
              alignItems: 'center',
              gap: '0.5rem',
              background: 'var(--color-accent-gold)',
              color: '#1C1C1C',
              border: 'none',
              padding: '0.6rem 1.2rem',
              borderRadius: '20px',
              fontWeight: 800,
              fontSize: '0.875rem',
              cursor: 'pointer'
            }}
          >
            <Printer size={16} /> Print / Save as PDF
          </button>
        </div>

        {/* Executive Document Paper */}
        <div style={{
          background: '#FFFFFF',
          padding: '3rem 2.5rem',
          borderRadius: '16px',
          boxShadow: '0 10px 30px rgba(0,0,0,0.06)',
          borderTop: '6px solid var(--color-primary)'
        }}>
          {/* Header */}
          <div style={{
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center',
            borderBottom: '2px solid #E2D9CC',
            paddingBottom: '1.5rem',
            marginBottom: '2rem'
          }}>
            <div>
              <div style={{ fontSize: '1.8rem', fontWeight: 900, color: 'var(--color-primary)' }}>
                lang <span style={{ color: 'var(--color-secondary)' }}>huey</span>
              </div>
              <div style={{ fontSize: '0.75rem', fontWeight: 700, color: '#666', letterSpacing: '0.08em', marginTop: '0.2rem' }}>
                EDUCATION TECHNOLOGY &bull; A PRODUCT OF NIT7ER
              </div>
            </div>

            <div style={{
              background: 'var(--color-warm-cream)',
              color: 'var(--color-primary)',
              padding: '6px 14px',
              borderRadius: '20px',
              fontWeight: 800,
              fontSize: '0.75rem',
              border: '1px solid #D9CEBE'
            }}>
              EXECUTIVE BOARD BRIEF &bull; 2026
            </div>
          </div>

          <h1 style={{ fontSize: '1.75rem', color: 'var(--color-primary)', marginBottom: '0.5rem', lineHeight: 1.3 }}>
            Solving the Foreign Language Teacher Shortage in Nigerian Schools
          </h1>
          <p style={{ color: '#666', fontSize: '0.9rem', marginBottom: '2rem' }}>
            <strong>Prepared for:</strong> School Proprietors, Principals, & Boards of Governors &bull; <strong>Subject:</strong> Primary 4, Primary 5 & JSS1 French Curriculum Delivery
          </p>

          {/* Core Problem & Solution Grid */}
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(280px, 1fr))', gap: '1.5rem', marginBottom: '2rem' }}>
            <div style={{ background: '#FFF7ED', padding: '1.5rem', borderRadius: '12px', borderLeft: '4px solid #EA580C' }}>
              <h3 style={{ color: '#9A3412', marginTop: 0, fontSize: '1.1rem' }}>The Operational Challenge</h3>
              <p style={{ fontSize: '0.9rem', color: '#431407', lineHeight: 1.6, margin: 0 }}>
                Qualified French teachers in Nigeria are scarce, expensive, and have high turnover rates. Vacant timetable slots leave students unprepared for exams, while virtual live classes fail over unstable school internet and power cuts.
              </p>
            </div>

            <div style={{ background: '#F0FDFA', padding: '1.5rem', borderRadius: '12px', borderLeft: '4px solid var(--color-secondary)' }}>
              <h3 style={{ color: 'var(--color-primary)', marginTop: 0, fontSize: '1.1rem' }}>The Lang Huey Solution</h3>
              <p style={{ fontSize: '0.9rem', color: '#134E4A', lineHeight: 1.6, margin: 0 }}>
                Lang Huey is an <strong>offline language lesson delivery engine</strong> installed directly on Android Smartboards. Using our proprietary <strong>Teacher Cue Bar</strong>, any supervising staff member can facilitate complete, structured French classes with zero prior French knowledge.
              </p>
            </div>
          </div>

          {/* Architecture Pillars */}
          <h2 style={{ fontSize: '1.25rem', color: 'var(--color-primary)', marginBottom: '1rem' }}>
            Core Solution Architecture
          </h2>
          
          <div style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem', marginBottom: '2rem' }}>
            <div style={{ display: 'flex', gap: '0.75rem', alignItems: 'flex-start' }}>
              <CheckCircle size={20} color="var(--color-primary)" style={{ minWidth: '20px', marginTop: '2px' }} />
              <div>
                <strong>100% NERDC Curriculum Aligned:</strong> Full scheme of work coverage across Primary 4, Primary 5, and JSS1 French (78+ complete weeks).
              </div>
            </div>

            <div style={{ display: 'flex', gap: '0.75rem', alignItems: 'flex-start' }}>
              <CheckCircle size={20} color="var(--color-primary)" style={{ minWidth: '20px', marginTop: '2px' }} />
              <div>
                <strong>100% Offline Engine:</strong> Zero internet dependency. Operates with complete consistency regardless of Wi-Fi or NEPA outages.
              </div>
            </div>

            <div style={{ display: 'flex', gap: '0.75rem', alignItems: 'flex-start' }}>
              <CheckCircle size={20} color="var(--color-primary)" style={{ minWidth: '20px', marginTop: '2px' }} />
              <div>
                <strong>Teacher-As-Facilitator System:</strong> On-screen English prompts guide the teacher through every step (*"Play audio twice. Ask Row 1 to repeat 'Bonjour'."*).
              </div>
            </div>

            <div style={{ display: 'flex', gap: '0.75rem', alignItems: 'flex-start' }}>
              <CheckCircle size={20} color="var(--color-primary)" style={{ minWidth: '20px', marginTop: '2px' }} />
              <div>
                <strong>One-Time Ownership License:</strong> Hardware-locked single payment model. Zero recurring monthly software subscriptions.
              </div>
            </div>
          </div>

          {/* Institutional Guarantee Box */}
          <div style={{
            background: 'var(--color-primary)',
            color: 'white',
            padding: '1.75rem',
            borderRadius: '12px',
            marginBottom: '2rem'
          }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem', color: 'var(--color-accent-gold)', fontWeight: 800, fontSize: '0.9rem', marginBottom: '0.5rem' }}>
              <ShieldCheck size={22} /> THE LANG HUEY INSTITUTIONAL GUARANTEE
            </div>
            <p style={{ margin: 0, fontSize: '0.95rem', lineHeight: 1.6, color: 'rgba(255, 255, 255, 0.95)' }}>
              Lang Huey guarantees 100% offline operational reliability, exact NERDC curriculum alignment, and permanent single-hardware license ownership. Your school maintains full control of classroom delivery.
            </p>
          </div>

          {/* Direct Contacts & Actions */}
          <div style={{
            borderTop: '2px solid #E2D9CC',
            paddingTop: '1.5rem',
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center',
            flexWrap: 'wrap',
            gap: '1rem'
          }}>
            <div style={{ fontSize: '0.85rem', color: '#555' }}>
              <div><strong>Direct Inquiries:</strong> +234 707 076 3135</div>
              <div><strong>Prelaunch Platform:</strong> lang-huey.vercel.app</div>
            </div>

            <div style={{ display: 'flex', gap: '0.75rem' }} className="no-print">
              <a 
                href="https://wa.me/2347070763135?text=Hello%20Lang%20Huey%20Team%2C%20I%20am%20a%20school%20administrator%20inquiring%20about%20your%20Executive%20Brief."
                target="_blank"
                rel="noopener noreferrer"
                style={{
                  display: 'inline-flex',
                  alignItems: 'center',
                  gap: '0.4rem',
                  background: '#25D366',
                  color: 'white',
                  padding: '0.5rem 1rem',
                  borderRadius: '20px',
                  fontWeight: 700,
                  fontSize: '0.85rem',
                  textDecoration: 'none'
                }}
              >
                <Phone size={15} /> Chat on WhatsApp
              </a>

              <a 
                href="https://whatsapp.com/channel/0029Vb8YQkw96H4b8tpk0H0h"
                target="_blank"
                rel="noopener noreferrer"
                style={{
                  display: 'inline-flex',
                  alignItems: 'center',
                  gap: '0.4rem',
                  background: 'var(--color-primary)',
                  color: 'white',
                  padding: '0.5rem 1rem',
                  borderRadius: '20px',
                  fontWeight: 700,
                  fontSize: '0.85rem',
                  textDecoration: 'none'
                }}
              >
                <MessageCircle size={15} /> Join Channel
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
