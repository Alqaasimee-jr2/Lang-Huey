import React from 'react';

export default function Footer() {
  return (
    <footer className="section bg-dark-footer" style={{ padding: '3.5rem 0 2rem 0' }}>
      <div className="container footer-grid">
        <div className="footer-brand">
          <a href="#" className="brand-logo" style={{ color: 'white' }}>lang <span>huey</span></a>
          <p style={{ marginTop: '0.5rem', color: 'var(--color-secondary)', fontWeight: 600, fontSize: '0.875rem' }}>
            A PRODUCT OF NIT7ER &bull; 2025
          </p>
          <p style={{ color: 'rgba(255, 255, 255, 0.65)', fontSize: '0.85rem' }}>
            Offline French lessons for Nigerian smartboards.
          </p>
        </div>

        <div className="footer-center">
          Built in Lagos &bull; Launching 2025 &bull; JSS1 French First &bull; Chinese Next
        </div>

        <div className="footer-right">
          <a href="https://chat.whatsapp.com/sample-channel-invite" target="_blank" rel="noopener noreferrer" className="whatsapp-link">
            Chat on WhatsApp &rarr;
          </a>
        </div>
      </div>

      <div className="container footer-legal">
        A PRODUCT OF NIT7ER &bull; 2025 &bull; &copy; Lang Huey. All rights reserved.
      </div>
    </footer>
  );
}
