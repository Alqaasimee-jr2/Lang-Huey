import React from 'react';

export default function WaveBanner() {
  return (
    <div class="bg-warm-cream" style={{ padding: '4rem 0', textAlign: 'center', borderTop: '1px solid rgba(13, 115, 119, 0.1)' }}>
      <div class="container">
        <h2>build lang huey with us for your school.</h2>
        <p style={{ margin: '0.75rem 0 1.5rem 0', fontSize: '1.1rem', color: '#444' }}>
          Connect directly with Abdullah and fellow school owners in our WhatsApp channel.
        </p>
        <a href="#waitlist" class="btn btn-secondary-teal">Join the WhatsApp Community &rarr;</a>
      </div>
    </div>
  );
}
