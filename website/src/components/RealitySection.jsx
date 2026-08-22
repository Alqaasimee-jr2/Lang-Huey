import React from 'react';
import { UserX, WifiOff, GraduationCap } from 'lucide-react';

export default function RealitySection() {
  return (
    <section className="section bg-warm-cream">
      <div className="container grid-asymmetric">
        <div>
          <div className="reality-illustration-card" style={{ background: '#FFFFFF', padding: '2.5rem', borderRadius: '16px', borderLeft: '5px solid var(--color-primary)', boxShadow: '0 8px 24px rgba(13, 115, 119, 0.06)' }}>
            <div style={{ background: 'rgba(20, 189, 204, 0.12)', width: '56px', height: '56px', borderRadius: '50%', display: 'flex', alignItems: 'center', justifyContent: 'center', color: 'var(--color-primary)', marginBottom: '1.25rem' }}>
              <UserX size={28} />
            </div>
            <div style={{ fontSize: '0.75rem', fontWeight: 800, color: 'var(--color-primary)', letterSpacing: '0.1em', textTransform: 'uppercase' }}>THE TEACHER SHORTAGE</div>
            <h3 style={{ fontSize: '1.4rem', color: 'var(--color-text-charcoal)', margin: '0.5rem 0' }}>Vacant French Timetable Slots</h3>
            <p style={{ fontSize: '0.95rem', color: '#555' }}>
              Without a qualified instructor, school French periods run irregularly or get replaced by stand-in subjects.
            </p>
          </div>
        </div>

        <div>
          <span className="caption-label">THE REALITY IN NIGERIAN SCHOOLS</span>
          <h2 style={{ color: 'var(--color-text-charcoal)', marginBottom: '1rem' }}>
            finding a french teacher in nigeria is hard.
          </h2>
          <p style={{ fontSize: '1.0625rem', color: '#333', marginBottom: '1.5rem' }}>
            School proprietors face constant teacher turnover, high salary demands for specialist instructors, and difficulty finding qualified French teachers. You want to offer French. The system makes it harder than it should be.
          </p>
        </div>
      </div>

      {/* Pain Cards */}
      <div className="container pain-cards-grid">
        <div className="pain-card">
          <div className="pain-icon">
            <UserX size={24} />
          </div>
          <h3>No Teacher Available</h3>
          <p>Qualified French teachers are hard to find and harder to keep. Vacant slots disrupt your timetable.</p>
        </div>

        <div className="pain-card">
          <div className="pain-icon">
            <WifiOff size={24} />
          </div>
          <h3>Network Dependency</h3>
          <p>Virtual live classes constantly disconnect over unstable school Wi-Fi and power interruptions.</p>
        </div>

        <div className="pain-card">
          <div className="pain-icon">
            <GraduationCap size={24} />
          </div>
          <h3>Students Falling Behind</h3>
          <p>Every missed French period creates a preparation gap for mandatory WAEC and BECE exams.</p>
        </div>
      </div>
    </section>
  );
}
