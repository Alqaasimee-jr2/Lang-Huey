'use client';

import React, { useState } from 'react';
import Navbar from '../components/Navbar';
import Hero from '../components/Hero';
import LanguageTicker from '../components/LanguageTicker';
import RealitySection from '../components/RealitySection';
import SolutionSection from '../components/SolutionSection';
import SmartboardInteractivePreview from '../components/SmartboardInteractivePreview';
import FeaturesSection from '../components/FeaturesSection';
import PrelaunchCommunityForm from '../components/PrelaunchCommunityForm';
import FounderNote from '../components/FounderNote';
import WaveBanner from '../components/WaveBanner';
import Footer from '../components/Footer';
import PostSignupModal from '../components/PostSignupModal';
import FloatingWhatsAppButton from '../components/FloatingWhatsAppButton';

export default function HomePage() {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [registeredSchoolName, setRegisteredSchoolName] = useState('');

  const handleRegisterSuccess = (formData) => {
    setRegisteredSchoolName(formData.schoolName);
    setIsModalOpen(true);
  };

  return (
    <main className="lang-huey-app">
      <Navbar />
      <Hero />
      <LanguageTicker />
      <RealitySection />
      <SolutionSection />
      <SmartboardInteractivePreview />
      <FeaturesSection />
      <PrelaunchCommunityForm onRegisterSuccess={handleRegisterSuccess} />
      <FounderNote />
      <WaveBanner />
      <Footer />

      <PostSignupModal 
        isOpen={isModalOpen}
        schoolName={registeredSchoolName}
        onClose={() => setIsModalOpen(false)}
      />

      <FloatingWhatsAppButton />
    </main>
  );
}
