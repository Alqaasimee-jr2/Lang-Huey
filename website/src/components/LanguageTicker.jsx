import React from 'react';

export default function LanguageTicker() {
  return (
    <div class="language-strip">
      <div class="container language-strip-content">
        <div class="lang-badge">
          <span style={{ fontSize: '1.2rem' }}>🇫🇷</span>
          <span>French — JSS1 Launching First</span>
        </div>
        <div class="lang-badge dimmed">
          <span style={{ fontSize: '1.2rem' }}>🇨🇳</span>
          <span>Chinese (Mandarin) — Coming Next</span>
        </div>
        <div class="lang-badge dimmed">
          <span style={{ fontSize: '1.2rem' }}>🇪🇸</span>
          <span>Spanish — Planned Expansion</span>
        </div>
      </div>
    </div>
  );
}
