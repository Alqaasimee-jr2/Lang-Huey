import React from 'react';

export default function Navbar() {
  return (
    <header class="navbar">
      <div class="container">
        <a href="#" class="brand-logo">lang <span>huey</span></a>
        {/* GOLD RULE: Amber Gold touches ONE element per screen max */}
        <a href="#waitlist" class="btn btn-gold">Join the Community &rarr;</a>
      </div>
    </header>
  );
}
