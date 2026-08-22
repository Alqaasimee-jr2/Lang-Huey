import React from 'react';

export default function Navbar() {
  return (
    <header className="navbar">
      <div className="container">
        <a href="#" className="brand-logo">lang <span>huey</span></a>
        {/* Strict Gold Rule: Navbar uses Ghost Outline so ONLY the Hero CTA is Gold on screen */}
        <a href="#waitlist" className="btn btn-ghost-teal">Join the Community &rarr;</a>
      </div>
    </header>
  );
}
