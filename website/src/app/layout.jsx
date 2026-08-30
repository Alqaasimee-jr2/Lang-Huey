import '../css/style.css';

export const metadata = {
  metadataBase: new URL('https://lang-huey.vercel.app'),
  title: {
    default: 'Lang Huey — Offline French Lessons for Nigerian Smartboards',
    template: '%s | Lang Huey'
  },
  description: 'Lang Huey runs complete, NERDC-aligned French lessons on your school smartboard — 100% offline, structured, and operable by any staff member with zero French knowledge.',
  keywords: [
    'EdTech Nigeria',
    'Nigerian Smartboard Software',
    'Primary French Curriculum Nigeria',
    'JSS1 French NERDC',
    'Offline Classroom Software',
    'Lagos Private Schools',
    'Lang Huey',
    'NIT7ER'
  ],
  authors: [{ name: 'NIT7ER' }],
  creator: 'NIT7ER',
  publisher: 'Lang Huey',
  formatDetection: {
    email: false,
    address: false,
    telephone: false,
  },
  openGraph: {
    title: 'Lang Huey — Offline French Lessons for Nigerian Smartboards',
    description: 'No French teacher? No problem. Complete NERDC French lessons on your smartboard, 100% offline with zero internet dependency.',
    url: 'https://lang-huey.vercel.app',
    siteName: 'Lang Huey',
    images: [
      {
        url: '/og-image.jpg',
        width: 1200,
        height: 630,
        alt: 'Lang Huey Smartboard Language Learning',
      },
    ],
    locale: 'en_NG',
    type: 'website',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Lang Huey — Offline French Lessons for Nigerian Smartboards',
    description: '100% Offline smartboard language delivery system for Nigerian schools.',
    images: ['/og-image.jpg'],
    creator: '@LangHuey',
  },
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      'max-video-preview': -1,
      'max-image-preview': 'large',
      'max-snippet': -1,
    },
  },
};

export default function RootLayout({ children }) {
  const jsonLd = {
    '@context': 'https://schema.org',
    '@graph': [
      {
        '@type': 'SoftwareApplication',
        'name': 'Lang Huey',
        'operatingSystem': 'Android (Smartboards / Interactive Flat Panels)',
        'applicationCategory': 'EducationalApplication',
        'description': 'Offline language lesson delivery engine for Nigerian classrooms.',
        'offers': {
          '@type': 'Offer',
          'price': '0',
          'priceCurrency': 'NGN',
        },
      },
      {
        '@type': 'EducationalOrganization',
        'name': 'Lang Huey (by NIT7ER)',
        'url': 'https://lang-huey.vercel.app',
        'address': {
          '@type': 'PostalAddress',
          'addressLocality': 'Lagos',
          'addressCountry': 'NG',
        },
        'contactPoint': {
          '@type': 'ContactPoint',
          'telephone': '+234-707-076-3135',
          'contactType': 'customer support',
        },
      },
    ],
  };

  return (
    <html lang="en">
      <head>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
        <link
          href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&family=Nunito:wght@700;800;900&display=swap"
          rel="stylesheet"
        />
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
        />
      </head>
      <body>
        {children}
      </body>
    </html>
  );
}
