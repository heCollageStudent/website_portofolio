typedef PortfolioItemData = Map<String, dynamic>;

final List<PortfolioItemData> portfolioData = [
  {
    'image': 'assets/portofolio/porto-tourid.webp',
    'name': 'TourID',
    'category': 'Android',
    'description':
        'TourID is a mobile application that provides recommendations for tourist attractions in Indonesia and users can provide reviews of these tourist attractions. In addition, users can mark the tourist attractions and get the location of the tourist attractions as well.',
    'tags': ['Kotlin', 'API', 'Google Maps', 'Firebase', 'Material 3'],
    'url': 'https://github.com/TourID/Mobile-Dev',
    'features': [
      "Authentication Login",
      "Weather based on location user",
      "Detail view with user profile info",
      "Offering a list of destinations",
      "Can bookmark the item",
      "Searching the items",
      "Give a review star of the destination",
      "See the maps at detail destination information",
    ],
  },
  {
    'image': 'assets/portofolio/porto-library.webp',
    'name': 'Library System Management',
    'category': 'Desktop',
    'description': '',
    'tags': ['Java', 'NetBeans', 'MySQL'],
    'url': 'https://github.com/dhirsyaram/app-library-management/tree/main',
    'features': [],
  },
  // Tambahkan lainnya
];
