'use client';

import React, { useState } from 'react';
import { CheckCircle2, MessageCircle, PhoneCall } from 'lucide-react';

export default function PrelaunchCommunityForm({ onRegisterSuccess }) {
  const [formData, setFormData] = useState({
    schoolName: '',
    email: '',
    role: '',
    smartboardStatus: ''
  });

  const handleSubmit = (e) => {
    e.preventDefault();

    // 1. Persist submission locally
    try {
      const existing = JSON.parse(localStorage.getItem('lang_huey_waitlist_registrations') || '[]');
      existing.push({
        ...formData,
        timestamp: new Date().toISOString()
      });
      localStorage.setItem('lang_huey_waitlist_registrations', JSON.stringify(existing));
    } catch (err) {
      console.warn('LocalStorage save skipped', err);
    }

    // 2. Direct message lead details to WhatsApp +234 707 076 3135
    const msg = encodeURIComponent(
      `Hello Lang Huey / NIT7ER,\n\n` +
      `I would like to register my school for Lang Huey updates & pilot consideration:\n` +
      `• School: ${formData.schoolName}\n` +
      `• Role: ${formData.role}\n` +
      `• Email: ${formData.email}\n` +
      `• Smartboard Availability: ${formData.smartboardStatus}\n\n` +
      `Looking forward to hearing from you!`
    );
    const waUrl = `https://wa.me/2347070763135?text=${msg}`;
    window.open(waUrl, '_blank');

    // 3. Open post-signup confirmation modal
    if (onRegisterSuccess) {
      onRegisterSuccess(formData);
    }
  };

  return (
    <section className="section bg-warm-cream" id="waitlist">
      <div className="container grid-asymmetric">
        <div>
          <span className="feature-pill" style={{ background: 'var(--color-secondary)', color: 'white', marginBottom: '1rem' }}>
            EARLY ADOPTER ACCESS
          </span>
          <h2 style={{ color: 'var(--color-primary)', marginBottom: '0.75rem' }}>
            you are early. that matters.
          </h2>
          <p style={{ fontSize: '1.25rem', fontWeight: 600, color: 'var(--color-text-charcoal)', marginBottom: '1rem' }}>
            Help us build Lang Huey for your school.
          </p>
          <p style={{ marginBottom: '1.5rem', color: '#444' }}>
            We are in active development. Schools that join now get to shape the product: suggest curriculum topics, flag what matters to your classroom, and receive priority pilot access.
          </p>

          <ul className="benefit-list">
            <li>
              <CheckCircle2 size={22} color="var(--color-secondary)" style={{ minWidth: '22px' }} /> 
              <span>Direct line to NIT7ER team (+234 707 076 3135)</span>
            </li>
            <li>
              <CheckCircle2 size={22} color="var(--color-secondary)" style={{ minWidth: '22px' }} /> 
              <span>Priority pilot cohort consideration at launch</span>
            </li>
            <li>
              <CheckCircle2 size={22} color="var(--color-secondary)" style={{ minWidth: '22px' }} /> 
              <span>Exclusive access to our WhatsApp Community Channel</span>
            </li>
          </ul>

          <div style={{ marginTop: '2rem', display: 'flex', gap: '0.75rem', flexWrap: 'wrap' }}>
            <a 
              href="https://whatsapp.com/channel/0029Vb8YQkw96H4b8tpk0H0h" 
              target="_blank" 
              rel="noopener noreferrer"
              style={{
                display: 'inline-flex',
                alignItems: 'center',
                gap: '0.5rem',
                color: 'var(--color-primary)',
                fontWeight: 700,
                textDecoration: 'none',
                padding: '0.65rem 1.25rem',
                background: 'rgba(13, 115, 119, 0.08)',
                borderRadius: '50px',
                border: '1px solid rgba(13, 115, 119, 0.2)'
              }}
            >
              <MessageCircle size={18} color="var(--color-primary)" />
              Join WhatsApp Channel &rarr;
            </a>

            <a 
              href="https://wa.me/2347070763135?text=Hello%20Lang%20Huey%20Team%2C%20I%20would%20like%20to%20inquire%20about%20your%20software."
              target="_blank"
              rel="noopener noreferrer"
              style={{
                display: 'inline-flex',
                alignItems: 'center',
                gap: '0.5rem',
                color: '#134E4A',
                fontWeight: 700,
                textDecoration: 'none',
                padding: '0.65rem 1.25rem',
                background: '#E6FFFA',
                borderRadius: '50px',
                border: '1px solid #319795'
              }}
            >
              <PhoneCall size={18} color="#319795" />
              Direct Message: +234 707 076 3135
            </a>
          </div>
        </div>

        {/* Registration Form Card */}
        <div>
          <div className="form-card">
            <h3 className="form-title">Reserve Your School Spot</h3>
            
            <form onSubmit={handleSubmit}>
              <div className="form-group">
                <label htmlFor="school-name">School Name & Location</label>
                <input 
                  type="text" 
                  id="school-name" 
                  className="form-input" 
                  placeholder="e.g. Excellence Academy, Lekki, Lagos" 
                  value={formData.schoolName}
                  onChange={(e) => setFormData({ ...formData, schoolName: e.target.value })}
                  required 
                />
              </div>

              <div className="form-group">
                <label htmlFor="email-address">Email Address (Proprietor / Principal)</label>
                <input 
                  type="email" 
                  id="email-address" 
                  className="form-input" 
                  placeholder="principal@school.edu.ng" 
                  value={formData.email}
                  onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                  required 
                />
              </div>

              <div className="form-group">
                <label htmlFor="role">Your Role</label>
                <select 
                  id="role" 
                  className="form-select" 
                  value={formData.role}
                  onChange={(e) => setFormData({ ...formData, role: e.target.value })}
                  required
                >
                  <option value="" disabled>Select your role...</option>
                  <option value="Proprietor">School Proprietor / Owner</option>
                  <option value="Principal">School Principal / Headmaster</option>
                  <option value="Administrator">Administrator / IT Director</option>
                  <option value="Teacher">Language Teacher / Academic Coordinator</option>
                </select>
              </div>

              <div className="form-group">
                <label htmlFor="smartboard-status">Smartboard Availability</label>
                <select 
                  id="smartboard-status" 
                  className="form-select"
                  value={formData.smartboardStatus}
                  onChange={(e) => setFormData({ ...formData, smartboardStatus: e.target.value })}
                  required
                >
                  <option value="" disabled>Does your school have Smartboards?</option>
                  <option value="Installed">We already have Smartboards installed</option>
                  <option value="Buying Soon">We plan to buy Smartboards soon</option>
                  <option value="No Smartboards">We don't have Smartboards yet</option>
                </select>
              </div>

              {/* STAGE GOLD RULE: Amber Gold touches EXCLUSIVELY ONE element per screen max */}
              <button type="submit" className="btn btn-gold" style={{ width: '100%', marginTop: '0.5rem' }}>
                Submit & Open WhatsApp Direct &rarr;
              </button>

              <p className="form-microtext">
                Submissions automatically connect directly to +234 707 076 3135 on WhatsApp.
              </p>
            </form>
          </div>
        </div>
      </div>
    </section>
  );
}
