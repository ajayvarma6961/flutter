# Goodwork 🌿
> **Find work that matters.** A modern, responsive Flutter job portal connecting passionate professionals with social and environmental impact careers.

[![Flutter](https://img.shields.io/badge/Flutter-3.10%2B-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0%2B-0175C2?logo=dart)](https://dart.dev)
[![Platforms](https://img.shields.io/badge/Platforms-Android%20%7C%20iOS%20%7C%20Web%20%7C%20macOS%20%7C%20Linux%20%7C%20Windows-brightgreen)](#platforms-supported)
[![UN SDGs](https://img.shields.io/badge/SDG%20Impact-SDG%203%2C%204%2C%2010%2C%2011%2C%2013-4C9F38)](https://sdgs.un.org/goals)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Live Demo](https://img.shields.io/badge/Live-Demo-brightgreen)](https://flutter-3hgd.onrender.com)
---

## 📖 Overview

**Goodwork** is an open, mission-driven job discovery platform designed to solve one of the greatest career dilemmas of our time: *how to connect skilled talent with organizations advancing human and planetary flourishing*.
👉 **[View Live Application](https://flutter-3hgd.onrender.com)**
Built from the ground up with **Flutter 3** and modern **Material 3**, Goodwork delivers an adaptive, accessible, and aesthetically pleasing cross-platform experience across mobile, tablet, and desktop viewports. Every role listed is directly mapped to the **United Nations Sustainable Development Goals (SDGs)**, spotlighting verifiable impact in climate action, healthcare equity, universal education, digital accessibility, and grassroots community empowerment.

---

## ✨ Key Features

- **Responsive Multi-Platform Architecture**:
  - **Phone (< 900 px)**: Smooth scrollable job listing. Tapping any card navigates to a dedicated job details screen with an intuitive back button and quick actions.
  - **Tablet & Desktop (≥ 900 px)**: Ergonomic two-pane master-detail layout. The left pane provides instant filtering, search, and job cards; the right pane displays the complete job dossier, UN SDG alignments, and application channels without losing browsing context.
- **Material 3 Impact Design**:
  - Forest-green brand accents (`#1B4931`, `#2D6A4F`) reflecting nature and renewal.
  - Warm off-white surfaces (`#F8F7F3`, `#FFFFFF`) reducing ocular fatigue and elevating typography readability.
  - Rounded cards (16 px radius) with subtle hover elevations and high-contrast borders.
- **Universal Accessibility (a11y)**:
  - Strict compliance with WCAG AAA / AA contrast ratios.
  - Built-in `Semantics` tags enabling assistive screen readers (TalkBack, VoiceOver, NVDA) to read complete role dossiers.
  - Tooltips on all icon buttons (`TooltipTheme`).
  - Generous touch targets (minimum 48×48 px) on all interactive elements.
- **Dynamic Search & Filtering**:
  - Search across **Job Title**, **Organization**, **Location**, **Category**, **Skills**, and **SDGs**.
  - Horizontally scrollable category filter chips: **All roles**, **Climate**, **Health**, **Education**, **Inclusion**, and **Community**.
  - Immediate query matching without debounce delays.
- **Saved Roles & Bookmarking**:
  - Instant one-tap bookmarking to save and unsave favorite opportunities.
  - Dedicated "Saved roles" filter view with dynamic count badge.
  - Helpful empty state when no saved jobs exist, with a direct shortcut back to all roles.
- **Direct Employer Application Flow**:
  - "Apply for this role" action triggers an accessible confirmation dialog specifying that the candidate is continuing directly with the employer.
  - Displays verified employer application links and HR contact emails with one-tap clipboard copy.
- **Local-First Reliability**:
  - Entirely self-contained sample data with zero external backend or authentication dependencies.

---

## 🎯 UN Sustainable Development Goals (SDG) Alignment

Goodwork explicitly tags every role with corresponding United Nations Sustainable Development Goals (2030 Agenda):

| Role | Organization | Location | Compensation | UN SDG Alignment |
|---|---|---|---|---|
| **Climate Data Analyst** | Terra Collective | Remote, India | ₹12–18 LPA | **SDG 13** (Climate Action), **SDG 7** (Clean Energy), **SDG 12** (Responsible Consumption) |
| **Community Health Program Lead** | Swasthya Foundation | Pune, India | ₹9–13 LPA | **SDG 3** (Good Health & Well-being), **SDG 10** (Reduced Inequalities), **SDG 11** (Sustainable Cities) |
| **Learning Experience Designer** | OpenLearn India | Bengaluru, Hybrid | ₹10–15 LPA | **SDG 4** (Quality Education), **SDG 8** (Decent Work), **SDG 10** (Reduced Inequalities) |
| **Sustainable Supply Chain Associate** | EarthKind Foods | Mumbai, India | ₹7–10 LPA | **SDG 12** (Responsible Consumption), **SDG 11** (Sustainable Cities), **SDG 13** (Climate Action) |
| **Accessibility Product Designer** | Equal Access Labs | Remote, India | ₹8–12 LPA (Contract) | **SDG 10** (Reduced Inequalities), **SDG 9** (Industry & Innovation), **SDG 8** (Decent Work) |
| **Nonprofit Partnerships Manager** | GiveWell Network | Delhi, Hybrid | ₹11–16 LPA | **SDG 17** (Partnerships for the Goals), **SDG 1** (No Poverty), **SDG 10** (Reduced Inequalities) |
| **Microgrid Renewable Systems Engineer** | Gramin Solar Alliance | Jaipur, Hybrid | ₹11–15 LPA | **SDG 7** (Clean Energy), **SDG 13** (Climate Action), **SDG 9** (Innovation) |
| **Water Governance Specialist** | Jal Chetna Sansthan | Udaipur, Hybrid | ₹8.5–12 LPA | **SDG 11** (Sustainable Communities), **SDG 13** (Climate Action), **SDG 14** (Water Action) |

---

## 📂 Project Structure

```
goodwork/
├── pubspec.yaml                 # Dependencies & Flutter project configuration
├── analysis_options.yaml        # Recommended Dart & Flutter linter rules
├── README.md                    # Project overview, setup, and SDG alignment
├── SUBMISSION_GUIDE.md          # Submission instructions, Git push, portal links
├── RUBRIC_MAPPING.md            # Comprehensive rubric mapping
├── lib/
│   ├── main.dart                # Application entry point & ThemeData root
│   ├── models/
│   │   └── job.dart             # Job, JobCategory, and SdgInfo data models
│   ├── data/
│   │   └── sample_jobs.dart     # Sample impact roles dataset with full specs
│   ├── theme/
│   │   └── app_theme.dart       # Material 3 warm off-white & forest green theme
│   ├── widgets/
│   │   ├── job_card.dart        # Reusable job card with hover & bookmark states
│   │   ├── job_detail_pane.dart # Full role dossier, UN SDGs, and apply modal
│   │   ├── search_and_filters.dart # Search input, saved toggle & category chips
│   │   ├── sdg_badge.dart       # UN SDG compact badges & detailed cards
│   │   └── empty_state.dart     # Accessible empty state illustrations
│   └── screens/
│       ├── responsive_home_screen.dart # Responsive layout builder (900px breakpoint)
│       └── job_detail_screen.dart      # Dedicated mobile detail view
├── test/
│   └── widget_test.dart         # Responsive layout & interaction widget tests
├── web/                         # Web platform runner (HTML5, PWA manifest)
├── android/                     # Android platform runner (Gradle, Kotlin)
├── ios/                         # iOS platform runner (Xcode, Swift)
├── macos/                       # macOS desktop platform runner
├── linux/                       # Linux desktop platform runner (CMake)
└── windows/                     # Windows desktop platform runner (CMake)
```

---

## 🚀 Getting Started & Running the App

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.10.0 or higher)
- [Dart SDK](https://dart.dev/get-dart) (version 3.0.0 or higher)
- Compatible platform tooling:
  - **Web**: Google Chrome, Edge, or Safari
  - **macOS**: Xcode 14+ (for native macOS builds)
  - **Android**: Android Studio & Android SDK
  - **iOS**: macOS with Xcode & CocoaPods
  - **Linux**: `clang`, `cmake`, `ninja-build`, `pkg-config`, `libgtk-3-dev`
  - **Windows**: Visual Studio 2022 with "Desktop development with C++"

### 1. Clone & Install Dependencies
```bash
# Clone the repository
git clone https://github.com/your-username/goodwork.git
cd goodwork

# Fetch dependencies
flutter pub get
```

### 2. Run on Supported Platforms

#### 🌐 Web (Chrome / Safari / Edge)
```bash
# Launch in Chrome
flutter run -d chrome

# Or launch with a specific web renderer
flutter run -d chrome --web-renderer canvaskit
```

#### 📱 Mobile (Android & iOS)
```bash
# Verify available devices or connected emulators
flutter devices

# Run on Android emulator / physical device
flutter run -d android

# Run on iOS simulator (macOS only)
flutter run -d iphone
```

#### 💻 Desktop (macOS, Windows, Linux)
```bash
# Run on macOS desktop
flutter run -d macos

# Run on Windows desktop
flutter run -d windows

# Run on Linux desktop
flutter run -d linux
```

### 3. Run Automated Tests
```bash
# Run widget and unit tests
flutter test
```

---

## 📱 Responsive Layout Specifications

- **Mobile Viewport (< 900 px)**:
  - Single-column scrolling feed optimized for thumb reach.
  - Tapping a card pushes `JobDetailScreen` onto the navigation stack with standard platform transitions.
  - Back navigation returns to the exact scroll offset and preserved filter state.
- **Desktop & Tablet Viewport (≥ 900 px)**:
  - Left pane (420 px width) maintains active search, category filters, and card feed.
  - Active card receives a forest-green border highlight and tinted container.
  - Right pane presents the active role dossier with sticky application header and full SDG impact breakdown.
  - Selecting a different card immediately refreshes the right pane without page reloading.

---

## ♿ Accessibility (a11y) Features

1. **Screen Reader Support**: All job cards and detail elements are wrapped in semantic blocks announcing job title, organization, salary, and impact mission.
2. **Focus Indicators & Keyboard Navigation**: Full tab navigation support on Web and Desktop.
3. **Contrast Ratios**: Body text (`#19201C`) against background (`#F8F7F3`) yields a **13.8:1 contrast ratio**, well above WCAG Level AAA requirements (7:1).
4. **Touch Target Size**: All touchable elements (bookmark button, category chips, apply button) have at least **48×48 px** hit areas conforming to Android & iOS human interface guidelines.

---

## 📄 License
This project is open-source under the [MIT License](LICENSE).
