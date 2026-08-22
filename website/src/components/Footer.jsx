import React from 'react';

export default function Footer() {
  return (
    <footer class="section bg-dark-footer" style={{ padding: '3.5rem 0 2rem 0' }}>
      <div class="container footer-grid">
        <div class="footer-brand">
          <a href="#" class="brand-logo" style={{ color: 'white' }}>lang <span>huey</span></a>
          <p>Offline French lessons for Nigerian smartboards.</p>
        </div>

        <div class="footer-center">
          Built in Lagos &bull; Launching 2025 &bull; JSS1 French First &bull; Chinese Next
        </div>

        <div class="footer-right">
          <a href="https://chat.whatsapp.com/sample-channel-invite" target="_blank" rel="noopener noreferrer" class="whatsapp-link">
            Chat on WhatsApp &rarr;
          </a>
        </div>
      </div>

      <div class="container footer-legal">
        Lang Huey is not affiliated with any foreign edtech platform. &copy; 2025 Lang Huey.
      </div>
    </footer>
  );
}
