export default function sitemap() {
  return [
    {
      url: 'https://lang-huey.vercel.app',
      lastModified: new Date(),
      changeFrequency: 'weekly',
      priority: 1.0,
    },
    {
      url: 'https://lang-huey.vercel.app/executive-brief',
      lastModified: new Date(),
      changeFrequency: 'monthly',
      priority: 0.8,
    },
  ];
}
