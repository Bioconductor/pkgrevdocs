# Night Mode Implementation

## Overview
This document explains the night mode (dark mode) feature added to the Bioconductor Package Review Documentation website.

## Implementation Details

### Files Modified
- `includes/header.html` - Added dark mode toggle button, CSS styles, and JavaScript functionality

### Features
1. **Toggle Button**: A floating button in the bottom-right corner that allows users to switch between light and dark modes
   - Moon icon (🌙) for light mode
   - Sun icon (☀️) for dark mode
   - Smooth hover animation

2. **Persistent Theme**: User's theme preference is saved in browser's localStorage
   - Theme persists across page reloads and navigation
   - Automatically applies saved theme on page load

3. **Dark Mode Styling**: Comprehensive dark theme covering:
   - Background colors (dark gray/black)
   - Text colors (light gray/white)
   - Navigation sidebar
   - Code blocks
   - Tables
   - Links and headings
   - Header bar

### Color Scheme
**Light Mode** (Default):
- Background: White
- Text: #333E50
- Primary: #6faef5
- Headings: #5c677e

**Dark Mode**:
- Background: #1a1a1a
- Text: #e0e0e0
- Sidebar: #2d2d2d
- Code blocks: #2d2d2d
- Links: #6faef5
- Headings: #87b13f

### How It Works
1. JavaScript creates a toggle button on page load
2. Checks localStorage for saved theme preference
3. Applies dark mode class to body if preference is 'dark'
4. Button click toggles the 'dark-mode' class on body element
5. CSS rules with `.dark-mode` selector override default styles
6. Theme preference is saved to localStorage on each toggle

### Browser Compatibility
- Works in all modern browsers that support:
  - localStorage API
  - CSS3
  - ES6 JavaScript
  - Font Awesome icons (already included)

### Testing
To test the implementation:
1. Build the bookdown site
2. Open in a browser
3. Click the toggle button in bottom-right corner
4. Verify dark mode applies correctly
5. Reload page to verify theme persists
6. Navigate to different pages to ensure consistency

## Future Enhancements
Possible improvements:
- System preference detection (prefers-color-scheme media query)
- Keyboard shortcut for toggling
- Smooth transition animations between themes
- Additional color scheme options
