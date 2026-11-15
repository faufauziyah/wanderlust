# WanderPulse ✈️ - Next-Gen Travel Discovery & Trip Planning Hub

[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-Live%20Deploy-success?style=flat&logo=github)](https://github.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white)](index.html)
[![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=css3&logoColor=white)](css/styles.css)
[![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=black)](js/app.js)
[![Leaflet.js](https://img.shields.io/badge/Leaflet-199900?style=flat&logo=leaflet&logoColor=white)](https://leafletjs.com/)

> **Discover your next dream destination, match your exact budget, explore interactive global maps, build day-by-day itineraries, and manage your bucket list.**

---

## 🌟 Key Features

### 1. 🧭 Destination Finder
- **Explore 18+ Global Destinations** spanning Asia, Europe, North America, South America, Africa, and Oceania.
- **Multi-Dimension Filtering**:
  - Full-text search (cities, countries, landmarks, tags)
  - Continents (Asia, Europe, Americas, Africa, Oceania)
  - Travel Vibes (Tropical & Beach, Mountain & Hiking, Culture & History, Foodie, Adventure, Romantic, Wellness, Photography)
  - Best Seasons (Spring, Summer, Autumn, Winter)
  - Budget Tiers (`$`, `$$`, `$$$`, `$$$$`)
  - Sorting (Featured, Daily Cost Low &rarr; High, High &rarr; Low, Safety Rating, Alphabetical)
- **Deep-Dive Destination Modal**:
  - 3-tier daily cost breakdown table (*Backpacker* vs *Mid-Range* vs *Luxury*)
  - Handpicked must-do highlights & insider travel tips
  - Famous regional gastronomy & signature dishes
  - Direct 1-click actions: **Plan Trip**, **Estimate Budget**, **Save to Wishlist**, **View on Map**

### 2. 🗺️ Explore Map
- **Leaflet & OpenStreetMap Engine**:
  - Custom styled interactive pin markers with budget tier badges
  - Interactive popup cards with photo, daily rate, and quick actions
  - Dynamic map filter controls (All, Budget <$60, Beach, Mountains, Reset Zoom)
  - Smooth animation fly-to directly from destination cards or wishlist

### 3. 💡 Smart Budget Estimator & AI Recommender
- **"Which place is best for my budget?" Algorithmic Engine**:
  - Input: Total Trip Budget, Duration (Days), Travelers Count, Comfort Style, Vibe Preference, and Flight Option.
  - **Match Scoring (0-100%)**:
    - **Budget Sweet Spot Scoring**: Evaluates exact budget fit, rewarding high experiential value and identifying leftover savings.
    - **Vibe & Season Compatibility**: Weights destination suitability against seasonal weather.
    - **Safety & Quality Rating**: Incorporates safety indices.
  - Highlights the **👑 #1 Best Value Champion** with complete expense breakdown (Flights, Lodging, Food, Activities, Contingency Buffer), savings surplus calculation, and why it is the best match for your money!
  - Displays runner-up alternative destinations with comparative metrics.
- **Granular Destination Budget Calculator**:
  - Calculate realistic costs per person and per day for any specific world destination.
  - Live currency converter support (USD `$`, EUR `€`, GBP `£`, JPY `¥`, CAD `CA$`, AUD `A$`, IDR `Rp`).

### 4. 📅 Trip Planner & Itinerary Builder
- **Day-by-Day Scheduler**:
  - Create trips with custom dates, duration, travelers, and budget targets.
  - Pre-loaded with ready-to-explore sample itineraries (e.g., 7-day Kyoto Autumn Cultural Journey).
  - Add, edit, and organize scheduled activities across Morning, Afternoon, and Evening slots.
  - Categorize by Sightseeing, Food & Drink, Adventure, Transit, and Leisure with cost tracking.
- **Dynamic Trip Budget Gauge**:
  - Real-time comparison of planned activities + estimated lodging against your target budget limit.
- **Smart Packing Checklist**:
  - Categorized checklist (Documents, Tech, Clothing, Health) with progress tracking.
- **Export & Share**:
  - Copy clean formatted text itinerary summary with 1-click to clipboard.

### 5. ❤️ Travel Wishlist & Visited Log
- **Personal Bucket List Manager**:
  - Save dream destinations with priority levels (*Must Visit Soon*, *Dream Trip*, *Someday*).
  - Add personal notes, target travel years, and seasons.
  - Mark places as **Visited** with star ratings and travel memories.
  - **Bucket List Budget Projection**: Computes total financial savings needed to complete your entire bucket list!

---

## 🚀 How to Run the Web App

The application is built with modern, standards-compliant HTML5, CSS3, and ES6 JavaScript. It runs natively in any modern web browser without requiring Node.js or external installations.

### Option A: Direct Browser Launch
Simply double-click or open `index.html` in your favorite web browser (Chrome, Edge, Firefox, Safari):
```
C:\Users\User\.gemini\antigravity\scratch\wanderlust-travel-app\index.html
```

### Option B: Local PowerShell Web Server
Run the included lightweight PowerShell HTTP server:
```powershell
powershell -ExecutionPolicy Bypass -File .\start-server.ps1
```
This automatically serves the app at `http://localhost:8080/` and launches it in your browser.

---

## 🌐 Publish to GitHub & Live GitHub Pages

Your project includes ready-to-use configuration for GitHub and automated deployment to **GitHub Pages**:

1. **Create a new empty repository** on [GitHub](https://github.com/new) (e.g. `wanderlust-travel-app`).
2. Run the included publisher script:
   - **Double-click** `push-to-github.bat`, OR
   - Run in PowerShell:
     ```powershell
     .\push-to-github.ps1 -RepoUrl "https://github.com/YOUR_USERNAME/wanderlust-travel-app.git"
     ```
3. **Enable GitHub Pages**:
   - Go to your repository on GitHub &rarr; **Settings** &rarr; **Pages**.
   - Under **Build and deployment** &rarr; **Source**, select **GitHub Actions**.
   - The included workflow in `.github/workflows/deploy.yml` will automatically build and publish your app.
   - Your web app will be live at:
     ```
     https://<YOUR_USERNAME>.github.io/wanderlust-travel-app/
     ```

---

## 📁 Project Structure

```
wanderlust-travel-app/
│
├── .github/
│   └── workflows/
│       └── deploy.yml          # Automated CI/CD pipeline for GitHub Pages
├── index.html                  # Main application structure & responsive UI
├── css/
│   └── styles.css              # Custom styling, animations, Leaflet map styling
├── js/
│   ├── destinations-data.js    # Comprehensive catalog of 18+ worldwide destinations
│   ├── budget-engine.js        # AI recommendation & granular budget calculation engine
│   ├── map-module.js           # Leaflet interactive map controller & pin rendering
│   ├── planner-module.js       # Day-by-day scheduler, packing list & storage
│   ├── wishlist-module.js      # Wishlist, visited memory logs & budget projection
│   └── app.js                  # Main controller, state synchronization & UI events
├── .gitignore                  # Git ignore rules for OS and temp files
├── CONTRIBUTING.md             # Guidelines for contributing to the repository
├── LICENSE                     # MIT Open Source License
├── push-to-github.bat          # 1-click batch script to push repository to GitHub
├── push-to-github.ps1          # Interactive PowerShell GitHub deployment assistant
├── start-server.ps1            # Optional native local HTTP server script
└── README.md                   # Complete documentation
```
