export default function robots() {
  return {
    rules: {
      userAgent: '*',
      allow: '/',
    },
    sitemap: 'https://lang-huey.vercel.app/sitemap.xml',
  };
}
