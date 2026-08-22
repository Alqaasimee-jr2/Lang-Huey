import React, { useState } from 'react';
import Navbar from './components/Navbar';
import Hero from './components/Hero';
import LanguageTicker from './components/LanguageTicker';
import RealitySection from './components/RealitySection';
import SolutionSection from './components/SolutionSection';
import FeaturesSection from './components/FeaturesSection';
import PrelaunchCommunityForm from './components/PrelaunchCommunityForm';
import FounderNote from './components/FounderNote';
import WaveBanner from './components/WaveBanner';
import Footer from './components/Footer';
import PostSignupModal from './components/PostSignupModal';
import './css/style.css';

export default function App() {
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [registeredSchoolName, setRegisteredSchoolName] = useState('');

  const handleRegisterSuccess = (formData) => {
    setRegisteredSchoolName(formData.schoolName);
    setIsModalOpen(true);
  };

  return (
    <div className="lang-huey-app">
      <Navbar />
      <Hero />
      <LanguageTicker />
      <RealitySection />
      <SolutionSection />
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
    </div>
  );
}
