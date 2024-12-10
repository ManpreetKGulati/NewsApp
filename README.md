## NewsApp: Times of Canada 📰🇨🇦

## Overview
 
The NewsApp: Times of Canada is an iOS app that fetches live news from the NewsAPI and allows users to bookmark articles for later reading. The app is built using the MVC design pattern, integrates Core Data for local storage, and ensures a seamless user experience with AutoLayout for responsiveness.


## Screenshots


## Requirements Checklist

**1. Using iOS Components and Design Pattern (MVC)** ✅
* App follows the MVC pattern with clear separation of concerns:
* APICaller handles API communication.
* ViewController manages UI logic.
* NewsTableViewCell displays individual news items.
  
**2. Build a Real App That Uses Real API Data** ✅
* Fetches and decodes live news data from NewsAPI.
* Displays articles dynamically in a UITableView.
  
**3. Use CoreData to Store Data Locally** ✅
* Bookmarked articles are saved persistently using Core Data.
* Saved bookmarks are displayed in the BookmarksViewController.
  
**4. The App Must Have at Least 3 UI (ViewControllers)** ✅
* Splash Screen: Welcomes users and navigates to the news feed.
* Main News Feed: Displays live news articles.
* Bookmarks Screen: Lists saved bookmarks.
  
**5. Use API Data (Fetched from Web Service and Decoded)** ✅
* NewsAPI data is fetched and parsed into Swift models (Article, Source).
  
**6. Support AutoLayout for Landscape and Portrait** ✅
* All UI elements are laid out using AutoLayout.
* Fully responsive for all orientations and devices
  
## Features

### Live News Feed: 
* Fetches and displays real-time news articles from the NewsAPI.
* Includes titles, descriptions, and thumbnail images.

### Bookmark Functionality:
* Save articles for later reading using Core Data.
* View saved bookmarks in a dedicated BookmarksViewController.
  
### Search and Filter:
* A search bar dynamically filters articles by title.

### Multi-Screen Navigation:
* **InitialViewController** with navigation to the news feed.
* **ViewController** to browse live news.
* **BookmarksViewController** to view saved articles.
  
### Responsive Design:
Fully supports portrait and landscape modes using AutoLayout.
Custom-designed table view cells for a polished UI.

**Additional Feature**
* Open News in Web Browser:
* Articles are opened directly in SafariViewController, providing an in-app web browsing experience for easy access to the full news content.
