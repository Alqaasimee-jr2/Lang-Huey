import React from 'react';

export default function Footer() {
  return (
    <footer className="section bg-dark-footer" style={{ padding: '3.5rem 0 2rem 0' }}>
      <div className="container footer-grid">
        <div className="footer-brand">
          <a href="#" className="brand-logo" style={{ color: 'white' }}>lang <span>huey</span></a>
          <p>Offline French lessons for Nigerian smartboards. A product of NIT7ER.</p>
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
        Lang Huey is a product of NIT7ER. &copy; 2025 Lang Huey by NIT7ER.
      </div>
    </footer>
  );
}
