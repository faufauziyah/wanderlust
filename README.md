<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>WanderPulse</title>
    <meta name="description" content="Discover dream destinations, plan budgets, build itineraries, and save travel wishlist." />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link
      rel="stylesheet"
      href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
      integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
      crossorigin=""
    />
    <link rel="stylesheet" href="css/styles.css" />
  </head>
  <body>
    <div class="page-shell">
      <header class="topbar">
        <div class="brand-wrap">
          <div class="brand-mark">✈️</div>
          <div>
            <p class="eyebrow">Travel Discovery</p>
            <h1>WanderPulse</h1>
          </div>
        </div>
        <nav class="main-nav">
          <a href="#finder">Destinations</a>
          <a href="#budget">Budget</a>
          <a href="#planner">Planner</a>
          <a href="#wishlist">Wishlist</a>
        </nav>
      </header>

      <main>
        <section class="hero">
          <div class="hero-copy">
            <span class="badge">Next-gen trip planning</span>
            <h2>Discover places that match your style, budget, and season.</h2>
            <p>
              Explore destination ideas, compare trip costs, and build a custom itinerary from one smart travel dashboard.
            </p>
            <div class="hero-actions">
              <a href="#finder" class="primary-btn">Explore destinations</a>
              <a href="#budget" class="secondary-btn">Estimate budget</a>
            </div>
            <ul class="stats-list">
              <li><strong>18+</strong><span>Destinations</span></li>
              <li><strong>4</strong><span>Budget tiers</span></li>
              <li><strong>1</strong><span>Trip dashboard</span></li>
            </ul>
          </div>
          <div class="hero-card">
            <div class="mini-map">
              <div class="map-glow"></div>
              <div class="map-pin pin-a"></div>
              <div class="map-pin pin-b"></div>
              <div class="map-pin pin-c"></div>
              <div class="map-pin pin-d"></div>
            </div>
            <div class="mini-summary">
              <p>Best match for your next getaway</p>
              <h3>Kyoto, Japan</h3>
              <div class="tags">
                <span>Culture</span>
                <span>Autumn</span>
                <span>$$</span>
              </div>
            </div>
          </div>
        </section>

        <section id="finder" class="panel">
          <div class="section-head">
            <div>
              <p class="eyebrow">Destination finder</p>
              <h2>Search and filter dream spots</h2>
            </div>
          </div>

          <div class="finder-layout">
            <aside class="filters-card">
              <div class="filter-group search-box">
                <label for="searchInput">Search</label>
                <input id="searchInput" type="text" placeholder="City, country, vibe, landmark" />
              </div>

              <div class="filter-grid">
                <div class="filter-group">
                  <label for="continentSelect">Continent</label>
                  <select id="continentSelect">
                    <option value="all">All</option>
                    <option value="Asia">Asia</option>
                    <option value="Europe">Europe</option>
                    <option value="Americas">Americas</option>
                    <option value="Africa">Africa</option>
                    <option value="Oceania">Oceania</option>
                  </select>
                </div>

                <div class="filter-group">
                  <label for="vibeSelect">Travel vibe</label>
                  <select id="vibeSelect">
                    <option value="all">All</option>
                    <option value="Tropical & Beach">Tropical & Beach</option>
                    <option value="Mountain & Hiking">Mountain & Hiking</option>
                    <option value="Culture & History">Culture & History</option>
                    <option value="Foodie">Foodie</option>
                    <option value="Adventure">Adventure</option>
                    <option value="Romantic">Romantic</option>
                    <option value="Wellness">Wellness</option>
                    <option value="Photography">Photography</option>
                  </select>
                </div>

                <div class="filter-group">
                  <label for="seasonSelect">Best season</label>
                  <select id="seasonSelect">
                    <option value="all">All</option>
                    <option value="Spring">Spring</option>
                    <option value="Summer">Summer</option>
                    <option value="Autumn">Autumn</option>
                    <option value="Winter">Winter</option>
                  </select>
                </div>

                <div class="filter-group">
                  <label for="budgetSelect">Budget</label>
                  <select id="budgetSelect">
                    <option value="all">All</option>
                    <option value="$">$</option>
                    <option value="$$">$$</option>
                    <option value="$$$">$$$</option>
                    <option value="$$$$">$$$$</option>
                  </select>
                </div>
              </div>

              <div class="sort-row">
                <label for="sortSelect">Sort by</label>
                <select id="sortSelect">
                  <option value="featured">Featured</option>
                  <option value="cost-asc">Daily cost low → high</option>
                  <option value="cost-desc">Daily cost high → low</option>
                  <option value="safety">Safety rating</option>
                  <option value="alpha">Alphabetical</option>
                </select>
              </div>
            </aside>

            <div class="results-column">
              <div id="destinationGrid" class="destination-grid"></div>
            </div>
          </div>
        </section>

        <section class="map-panel panel">
          <div class="section-head">
            <div>
              <p class="eyebrow">Explore map</p>
              <h2>See destinations on a live globe</h2>
            </div>
          </div>
          <div id="map" aria-label="Interactive travel map"></div>
        </section>

        <section id="budget" class="budget-grid panel">
          <div class="section-head compact">
            <div>
              <p class="eyebrow">Smart budget estimator</p>
              <h2>Match places to your budget</h2>
            </div>
          </div>

          <div class="budget-layout">
            <form id="budgetForm" class="budget-form">
              <div class="two-col">
                <label>
                  Total budget (USD)
                  <input id="budgetAmount" type="number" value="2500" min="300" step="50" />
                </label>
                <label>
                  Days
                  <input id="tripDays" type="number" value="7" min="2" max="45" />
                </label>
              </div>

              <div class="two-col">
                <label>
                  Travelers
                  <input id="travelers" type="number" value="2" min="1" max="8" />
                </label>
                <label>
                  Comfort style
                  <select id="comfortStyle">
                    <option value="budget">Budget</option>
                    <option value="midrange" selected>Mid-range</option>
                    <option value="luxury">Luxury</option>
                  </select>
                </label>
              </div>

              <div class="two-col">
                <label>
                  Vibe preference
                  <select id="vibePreference">
                    <option value="Tropical & Beach">Tropical & Beach</option>
                    <option value="Mountain & Hiking">Mountain & Hiking</option>
                    <option value="Culture & History" selected>Culture & History</option>
                    <option value="Foodie">Foodie</option>
                    <option value="Adventure">Adventure</option>
                    <option value="Romantic">Romantic</option>
                    <option value="Wellness">Wellness</option>
                    <option value="Photography">Photography</option>
                  </select>
                </label>
                <label>
                  Flight option
                  <select id="flightOption">
                    <option value="economy" selected>Economy</option>
                    <option value="premium">Premium</option>
                    <option value="business">Business</option>
                  </select>
                </label>
              </div>

              <button type="submit" class="primary-btn wide-btn">Find best match</button>
            </form>

            <div class="recommendation-panel">
              <div id="recommendationResults"></div>
            </div>
          </div>
        </section>

        <section id="planner" class="panel planner-panel">
          <div class="section-head">
            <div>
              <p class="eyebrow">Trip planner</p>
              <h2>Build an itinerary you can actually follow</h2>
            </div>
          </div>

          <div class="planner-layout">
            <div class="planner-form-block">
              <form id="plannerForm" class="planner-form">
                <div class="two-col">
                  <label>
                    Trip name
                    <input id="tripName" type="text" value="Kyoto Autumn Escape" />
                  </label>
                  <label>
                    Destination
                    <input id="tripDestination" type="text" value="Kyoto" />
                  </label>
                </div>

                <div class="two-col">
                  <label>
                    Start date
                    <input id="tripDate" type="date" />
                  </label>
                  <label>
                    Travelers
                    <input id="plannerTravelers" type="number" value="2" min="1" max="12" />
                  </label>
                </div>

                <button type="submit" class="primary-btn">Create trip</button>
              </form>

              <div class="activity-block">
                <h3>Add activity</h3>
                <form id="activityForm" class="activity-form">
                  <input id="activityTitle" type="text" placeholder="Activity title" required />
                  <select id="activityCategory">
                    <option value="Sightseeing">Sightseeing</option>
                    <option value="Food & Drink">Food & Drink</option>
                    <option value="Adventure">Adventure</option>
                    <option value="Transit">Transit</option>
                    <option value="Leisure">Leisure</option>
                  </select>
                  <input id="activityTime" type="text" placeholder="Morning / Afternoon / Evening" />
                  <input id="activityCost" type="number" min="0" step="5" placeholder="Cost" />
                  <button type="submit" class="secondary-btn">Add to itinerary</button>
                </form>
              </div>
            </div>

            <div class="planner-output">
              <div id="plannerResults"></div>
            </div>
          </div>
        </section>

        <section id="wishlist" class="panel wishlist-panel">
          <div class="section-head">
            <div>
              <p class="eyebrow">Travel wishlist</p>
              <h2>Save your dream escapes</h2>
            </div>
          </div>

          <div class="wishlist-layout">
            <div class="wishlist-box">
              <h3>Wishlist</h3>
              <div id="wishlistList"></div>
            </div>
            <div class="wishlist-box">
              <h3>Visited log</h3>
              <div id="visitedList"></div>
            </div>
          </div>
        </section>
      </main>
    </div>

    <script
      src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
      integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
      crossorigin=""
    ></script>
    <script src="js/destinations-data.js"></script>
    <script src="js/budget-engine.js"></script>
    <script src="js/map-module.js"></script>
    <script src="js/planner-module.js"></script>
    <script src="js/wishlist-module.js"></script>
    <script src="js/app.js"></script>
  </body>
</html>
