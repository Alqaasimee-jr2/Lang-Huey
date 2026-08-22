import React, { useState } from 'react';
import { CheckCircle2, MessageCircle } from 'lucide-react';

export default function PrelaunchCommunityForm({ onRegisterSuccess }) {
  const [formData, setFormData] = useState({
    schoolName: '',
    email: '',
    role: '',
    smartboardStatus: ''
  });

  const handleSubmit = (e) => {
    e.preventDefault();
    if (onRegisterSuccess) {
      onRegisterSuccess(formData);
    }
  };

  return (
    <section className="section bg-warm-cream" id="waitlist">
      <div className="container grid-asymmetric">
        <div>
          <span className="feature-pill" style={{ background: 'var(--color-secondary)', color: 'white', marginBottom: '1rem' }}>YOU ARE EARLY</span>
          <h2 style={{ color: 'var(--color-primary)', marginBottom: '0.75rem' }}>you are early. that matters.</h2>
          <p style={{ fontSize: '1.25rem', fontWeight: 600, color: 'var(--color-text-charcoal)', marginBottom: '1rem' }}>
            Help us build Lang Huey for your school.
          </p>
          <p style={{ marginBottom: '1.5rem', color: '#444' }}>
            We are in active development. Schools that join now get to shape the product — suggest content, flag what matters to you, and get priority pilot access at launch. This is not a mailing list. This is a building team.
          </p>

          <ul className="benefit-list">
            <li>
              <CheckCircle2 size={22} color="var(--color-secondary)" style={{ minWidth: '22px' }} /> 
              <span>Your feedback goes directly to NIT7ER</span>
            </li>
            <li>
              <CheckCircle2 size={22} color="var(--color-secondary)" style={{ minWidth: '22px' }} /> 
              <span>Priority pilot cohort access at launch</span>
            </li>
            <li>
              <CheckCircle2 size={22} color="var(--color-secondary)" style={{ minWidth: '22px' }} /> 
              <span>Direct access to our WhatsApp Community Channel</span>
            </li>
          </ul>
        </div>

        {/* Registration Form Card with Smartboard Qualification Selector */}
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
                </select>
              </div>

              {/* Approved Smartboard Filter Selector */}
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
                Join the Community &rarr;
              </button>

              <p className="form-microtext">
                No spam. No sales calls. Just product updates and a direct line to NIT7ER.
              </p>
            </form>
          </div>
        </div>
      </div>
    </section>
  );
}
