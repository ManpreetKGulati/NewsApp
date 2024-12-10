## NewsApp: Times of Canada 📰🇨🇦

## Overview
 
The NewsApp: Times of Canada is an iOS app that fetches live news from the NewsAPI and allows users to bookmark articles for later reading. The app is built using the MVC design pattern, integrates Core Data for local storage, and ensures a seamless user experience with AutoLayout for responsiveness.


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

## Screenshots with Portrait and Landscape Layout
<div style="display: flex; flex-wrap: wrap; gap: 10px;">
  <img src="https://github.com/user-attachments/assets/83877f4c-076d-491b-a00f-8f63c9b04125" alt="Screenshot 1" width="300"/>
  <img src="https://github.com/user-attachments/assets/a9f92a30-31e7-4dd8-920b-73923a197742" alt="Screenshot 2" width="300"/>
  <img src="https://github.com/user-attachments/assets/a30d9f62-2184-43e2-b3b5-6a1842293439" alt="Screenshot 3" width="300"/>
  <img src="https://github.com/user-attachments/assets/034a615a-0488-4cfe-ab1b-47c9d3434ac7" alt="Screenshot 4" width="300"/>
  <img src="https://github.com/user-attachments/assets/abbb3338-64e2-42c0-94a5-156f66b67b8c" alt="Screenshot 5" width="300"/>
  <img src="https://github.com/user-attachments/assets/cddff20b-c156-4ee3-8670-a95efa7c5040" alt="Screenshot 6" width="300"/>
  <img src="https://github.com/user-attachments/assets/077a5bdb-ee8e-4f02-9ce4-206064a2fcad" alt="Screenshot 7" width="300"/>
  <img src="https://github.com/user-attachments/assets/986465e4-3288-4693-9345-03da64b01d70" alt="Screenshot 8" width="300"/>
  <img src="https://github.com/user-attachments/assets/2fd5bcf4-c137-447b-9318-068515cbefbd" alt="Screenshot 9" width="300"/>
  <img src="https://github.com/user-attachments/assets/6cab9eee-4f73-4c7b-9fc7-09fbcd3678b9" alt="Screenshot 10" width="300"/>
  <img src="https://github.com/user-attachments/assets/c5fb6bd5-954f-497e-ba93-6012a7811045" alt="Screenshot 11" width="300"/>
  <img src="https://github.com/user-attachments/assets/2fd0ed8c-4cd3-48f8-84ea-f992696708a3" alt="Screenshot 12" width="300"/>
</div>
