'use client';

import React from 'react';

export default function LanguageTicker() {
  return (
    <div className="language-strip">
      <div className="container language-strip-content">
        <div className="lang-badge">
          <svg width="22" height="15" viewBox="0 0 3 2" style={{ borderRadius: '2px' }}><rect width="1" height="2" fill="#002395"/><rect x="1" width="1" height="2" fill="#FFFFFF"/><rect x="2" width="1" height="2" fill="#ED2939"/></svg>
          <span>French: JSS1 Launching First</span>
        </div>
        <div className="lang-badge dimmed">
          <svg width="22" height="15" viewBox="0 0 3 2" style={{ borderRadius: '2px' }}><rect width="3" height="2" fill="#DE2910"/><polygon points="0.5,0.3 0.6,0.6 0.3,0.4 0.7,0.4 0.4,0.6" fill="#FFDE00"/></svg>
          <span>Chinese (Mandarin): Coming Next</span>
        </div>
        <div className="lang-badge dimmed">
          <svg width="22" height="15" viewBox="0 0 3 2" style={{ borderRadius: '2px' }}><rect width="3" height="2" fill="#AA1523"/><rect y="0.5" width="3" height="1" fill="#F1BF00"/></svg>
          <span>Spanish: Planned Expansion</span>
        </div>
      </div>
    </div>
  );
}
