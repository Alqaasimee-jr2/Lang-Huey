import React, { useState } from 'react';

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
    <section class="section bg-warm-cream" id="waitlist">
      <div class="container grid-asymmetric">
        <div>
          <span class="feature-pill" style={{ background: 'var(--color-secondary)', color: 'white', marginBottom: '1rem' }}>YOU ARE EARLY</span>
          <h2 style={{ color: 'var(--color-primary)', marginBottom: '0.75rem' }}>you are early. that matters.</h2>
          <p style={{ fontSize: '1.25rem', fontWeight: 600, color: 'var(--color-text-charcoal)', marginBottom: '1rem' }}>
            Help us build Lang Huey for your school.
          </p>
          <p style={{ marginBottom: '1.5rem', color: '#444' }}>
            We are in active development. Schools that join now get to shape the product — suggest content, flag what matters to you, and get priority pilot access at launch. This is not a mailing list. This is a building team.
          </p>

          <ul class="benefit-list">
            <li><span class="benefit-check">&check;</span> Your feedback goes directly to the builder</li>
            <li><span class="benefit-check">&check;</span> Priority access and launch-day pricing</li>
            <li><span class="benefit-check">&check;</span> Direct access to our WhatsApp Community Channel</li>
          </ul>
        </div>

        {/* Registration Form Card with Smartboard Qualification Selector */}
        <div>
          <div class="form-card">
            <h3 class="form-title">Reserve Your School Spot</h3>
            
            <form onSubmit={handleSubmit}>
              <div class="form-group">
                <label htmlFor="school-name">School Name & Location</label>
                <input 
                  type="text" 
                  id="school-name" 
                  class="form-input" 
                  placeholder="e.g. Excellence Academy, Lekki, Lagos" 
                  value={formData.schoolName}
                  onChange={(e) => setFormData({ ...formData, schoolName: e.target.value })}
                  required 
                />
              </div>

              <div class="form-group">
                <label htmlFor="email-address">Email Address (Proprietor / Principal)</label>
                <input 
                  type="email" 
                  id="email-address" 
                  class="form-input" 
                  placeholder="principal@school.edu.ng" 
                  value={formData.email}
                  onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                  required 
                />
              </div>

              <div class="form-group">
                <label htmlFor="role">Your Role</label>
                <select 
                  id="role" 
                  class="form-select" 
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
              <div class="form-group">
                <label htmlFor="smartboard-status">Smartboard Availability</label>
                <select 
                  id="smartboard-status" 
                  class="form-select"
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

              {/* GOLD RULE: Amber Gold touches ONE element per screen max */}
              <button type="submit" class="btn btn-gold" style={{ width: '100%', marginTop: '0.5rem' }}>
                Join the Community &rarr;
              </button>

              <p class="form-microtext">
                No spam. No sales calls. Just product updates and a direct line to the builder.
              </p>
            </form>
          </div>
        </div>
      </div>
    </section>
  );
}
