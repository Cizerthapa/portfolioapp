# 🚀 Flutter Developer Portfolio Website

A modern, responsive portfolio website built with **Flutter Web** designed specifically for Flutter developers to showcase their skills, projects, and experience.

![Flutter Portfolio](https://img.shields.io/badge/Flutter-3.19+-blue.svg)
![Web](https://img.shields.io/badge/Platform-Web-green.svg)
![Responsive](https://img.shields.io/badge/Responsive-Yes-9cf.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

## ✨ Features

- 🎨 **Modern & Clean Design** - Professional UI with smooth animations
- 📱 **Fully Responsive** - Works perfectly on mobile, tablet, and desktop
- ⚡ **Fast Performance** - Optimized for web with efficient rendering
- 🎯 **Flutter-Focused** - Showcases Flutter skills and projects effectively
- 📝 **Easy Customization** - Replace content with your own information
- 🔧 **Developer-Friendly** - Well-structured code with clear comments
- 🌙 **Dark Mode Ready** - Includes dark theme support

## 🛠️ Tech Stack

- **Flutter 3.19+** - Latest Flutter framework
- **Dart 3.3+** - Strongly typed programming language
- **flutter_screenutil** - Responsive design utilities
- **Material Design 3** - Modern design system
- **Flutter Web** - Web platform support

## 📋 Prerequisites

Before you begin, ensure you have:

- Flutter SDK (version 3.19.0 or higher)
- Dart SDK (version 3.3.0 or higher)
- Chrome/Brave browser for development
- Git for version control
- IDE (VS Code or Android Studio with Flutter plugin)

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/flutter-portfolio.git
cd flutter-portfolio
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the Development Server

```bash
# For Chrome
flutter run -d chrome

# For Brave (if installed)
flutter run -d web-server
# Then open http://localhost:8080 in Brave
```

### 4. Build for Production

```bash
flutter build web --release
```

The build output will be in `/build/web` directory.

## 📁 Project Structure

```
lib/
├── main.dart                    # Application entry point
├── screens/
│   └── home_screen.dart        # Main portfolio screen
├── widgets/
│   ├── navbar.dart             # Navigation bar
│   ├── hero_section.dart       # Hero/banner section
│   ├── about_section.dart      # About me section
│   ├── skills_section.dart     # Skills showcase
│   ├── projects_section.dart   # Projects gallery
│   ├── contact_section.dart    # Contact form
│   └── footer.dart             # Footer
├── utils/
│   ├── responsive_wrapper.dart # Responsive design wrapper
│   ├── responsive_mixin.dart   # Responsive utilities
│   └── responsive_grid.dart    # Responsive grid system
├── models/                     # Data models (optional)
└── services/                   # API services (optional)
```

## 🎨 Customization Guide

### 1. Update Personal Information

Edit the following files to add your personal details:

- **`lib/widgets/hero_section.dart`** - Update name, title, bio
- **`lib/widgets/about_section.dart`** - Update about me content
- **`lib/widgets/skills_section.dart`** - Update your skills
- **`lib/widgets/projects_section.dart`** - Add your projects
- **`lib/widgets/contact_section.dart`** - Update contact info

### 2. Change Theme Colors

Edit `lib/main.dart` to customize the theme:

```dart
theme: ThemeData(
  primarySwatch: Colors.blue, // Change primary color
  fontFamily: 'Inter',
  useMaterial3: true,
),
```

### 3. Add Your Projects

Update the projects list in `projects_section.dart`:

```dart
final List<Map<String, dynamic>> projects = [
  {
    'title': 'Your Project Name',
    'description': 'Project description...',
    'technologies': ['Flutter', 'Firebase', '...'],
    'github': 'https://github.com/yourusername/project',
    'demo': 'https://demo.yourproject.com',
    'image': 'assets/images/project1.jpg',
  },
  // Add more projects...
];
```

### 4. Add Your Social Links

Update social links in multiple sections:
- Hero section social icons
- Contact section contact info
- Footer social links

### 5. Replace Placeholder Images

Add your images to `assets/images/` and update image paths:
- Profile photo in `hero_section.dart` and `about_section.dart`
- Project images in `projects_section.dart`

## 🌐 Deployment

### Option 1: Firebase Hosting (Recommended)

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize Firebase
firebase init hosting

# Deploy to Firebase
firebase deploy --only hosting
```

### Option 2: GitHub Pages

1. Enable GitHub Pages in repository settings
2. Set source to `gh-pages` branch
3. Use GitHub Actions to auto-deploy

### Option 3: Netlify

1. Drag and drop `/build/web` folder to Netlify
2. Or connect your GitHub repository
3. Set build command: `flutter build web`
4. Set publish directory: `build/web`

### Option 4: Vercel

1. Import your Git repository
2. Set framework preset to "Other"
3. Set build command: `flutter build web`
4. Set output directory: `build/web`

## 📱 Responsive Design

The portfolio automatically adapts to different screen sizes:

- **Mobile**: < 768px
- **Tablet**: 768px - 1199px  
- **Desktop**: ≥ 1200px

Breakpoints are handled by `flutter_screenutil` and custom responsive utilities.

## 🔧 Development Scripts

Create a `run.sh` file for quick development:

```bash
#!/bin/bash
flutter clean
flutter pub get
flutter run -d chrome
```

Or for Windows (`run.bat`):

```batch
@echo off
flutter clean
flutter pub get
flutter run -d chrome
```

## 🎯 SEO Optimization

To improve SEO for your portfolio:

1. **Update meta tags** in `web/index.html`
2. **Add Open Graph tags** for social sharing
3. **Create a sitemap.xml**
4. **Add alt text to all images**
5. **Use semantic HTML structure** (Flutter web generates this)

## 🚦 Performance Tips

1. **Image Optimization**
   - Compress all images
   - Use WebP format
   - Implement lazy loading

2. **Code Splitting**
   - Consider deferred loading for heavy sections
   - Use `FutureBuilder` for async content

3. **Build Optimization**
   - Use `--release` flag for production builds
   - Enable tree-shaking with `--tree-shake-icons`

## 🐛 Troubleshooting

### Common Issues

1. **Browser not detected**
   ```bash
   flutter run -d web-server
   # Then manually open http://localhost:8080
   ```

2. **CORS issues during development**
   - Run a local server: `python -m http.server 8080` in build/web
   - Or use Chrome with disabled security: `chrome --disable-web-security`

3. **Responsive issues**
   - Check `flutter_screenutil` initialization
   - Verify breakpoints in responsive utilities

4. **Build errors**
   ```bash
   flutter clean
   flutter pub get
   flutter build web --release
   ```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Flutter Team](https://flutter.dev) for the amazing framework
- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) for responsive utilities
- All contributors and the Flutter community

## 📞 Support

For support, email your.email@example.com or create an issue in the GitHub repository.

---

## 📊 Portfolio Sections

| Section | Description |
|---------|-------------|
| 🎯 Hero | Introduction with name, title, and call-to-action |
| 👤 About | Personal bio, experience, and statistics |
| 💡 Skills | Technical skills with progress indicators |
| 🚀 Projects | Featured projects with descriptions and links |
| 📞 Contact | Contact form and contact information |
| 👣 Footer | Copyright and quick links |

## 🎨 Color Scheme

| Color | Hex | Usage |
|-------|-----|-------|
| Primary Blue | `#2563EB` | Buttons, links, highlights |
| Deep Purple | `#7C3AED` | Accents, gradients |
| Light Gray | `#F8FAFC` | Backgrounds |
| Dark Gray | `#1E293B` | Text, headings |
| White | `#FFFFFF` | Cards, text on dark |

## 📈 SEO Checklist

- [ ] Update `web/index.html` with your meta tags
- [ ] Add your Google Analytics ID
- [ ] Create `robots.txt` file
- [ ] Add `sitemap.xml`
- [ ] Set up social media preview images
- [ ] Add structured data (JSON-LD)
- [ ] Submit to Google Search Console

## 🔄 Update Instructions

When Flutter updates:

```bash
# Update Flutter
flutter upgrade

# Update dependencies
flutter pub outdated
flutter pub upgrade

# Test the build
flutter analyze
flutter test
flutter build web --release
```

---

**Happy Coding!** 🚀

Built with ❤️ using Flutter
```

## 📝 Additional Files to Create

### **LICENSE** (Create a LICENSE file)
```text
MIT License

Copyright (c) 2024 [Your Name]

Permission is hereby granted...
```

### **.gitignore** (Create if not exists)
```gitignore
# Flutter
.flutter-plugins
.flutter-plugins-dependencies
.packages
.pub-cache/
.pub/
/build/

# Android
*.jks
*.keystore

# iOS
*.mode1v3
*.mode2v3
*.moved-aside
*.pbxuser
*.perspectivev3

# IDE
.vscode/
.idea/
*.iml
*.swp
*.swo

# OS
.DS_Store
Thumbs.db
```

### **web/index.html** (Update for SEO)
```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="IE=Edge" http-equiv="X-UA-Compatible">
    <meta name="description" content="Flutter Developer Portfolio - Showcasing mobile and web applications built with Flutter">
    
    <!-- iOS meta tags & icons -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="portfolio_web">
    
    <!-- Favicon -->
    <link rel="icon" type="image/png" href="favicon.png"/>
    
    <title>Your Name - Flutter Developer Portfolio</title>
    <link rel="manifest" href="manifest.json">
</head>
<body>
    <script src="main.dart.js" type="application/javascript"></script>
</body>
</html>
```