# The Elegance App
A premium, modern E-Commerce mobile application built using Flutter and Dart. The application offers a tailored shopping experience for customers and a comprehensive administrative dashboard for catalog and order management, fully backed by Firebase Cloud Services and Cloudinary.

# Figma link 
https://www.figma.com/design/tunvc5u5UhkQeNfZUh9IXM/The-Elegance-App?node-id=0-1&t=uXlslX4QGvDgoxED-1

## 📱 App Preview

| Welcome Screen | Storefront (Light) | Storefront (Dark) |
| :---: | :---: | :---: |
| <img src="screenshots/welcome.png" width="200" alt="Welcome Screen"/> | <img src="screenshots/home_light.png" width="200" alt="Home Light"/> | <img src="screenshots/home_dark.png" width="200" alt="Home Dark"/> |

| Interactive Cart Overlay | Smart Checkout Workflow | Admin Dashboard |
| :---: | :---: | :---: |
| <img src="screenshots/cart_overlay.png" width="200" alt="Cart Overlay"/> | <img src="screenshots/checkout.png" width="200" alt="Checkout Screen"/> | <img src="screenshots/admin_products.png" width="200" alt="Admin Products"/> |

**Note:** `screenshots/` naam ka ek folder apne project ki root directory mein banayein aur usme upar diye gaye names (`welcome.png`, `home_light.png`, etc.) se images save karein taake woh yahan display ho sakein.

## ✨ Features

### 👤 Customer Experience
* **Secure Authentication:** Robust user signup and login pipelines powered by Firebase Auth, including comprehensive email format and real-time password strength validation.
* **Real-time Product Feed:** Browse available public product catalogs with active client-side keyword searching.
* **Dynamic Cart Management:** An intuitive, non-blocking persistent shopping cart overlay allowing users to increment, decrement, or remove items with real-time subtotal tracking synchronized directly with Firestore.
* **Smart Checkout Engine:**
  * **Hardware Location Auto-Fill:** Single-tap live GPS positioning and reverse-geocoding to automatically resolve a user's delivery address.
  * **Input Formatting:** Built-in credit card masking (`XXXX XXXX XXXX XXXX`) and automatic expiry delimiters (`MM/YY`) for error-free checkout.
  * Custom Order summary breakdowns matching flexible transactional payment options (Cash on Delivery or Card Processing).
* **Visual Mode Toggle:** Persistent dark and light interface styling utilizing `SharedPreferences` to preserve aesthetic preferences across app restarts.

### 🛠 Administrative Dashboard (Role-Based Access)
* **Secure Authorization Guard:** Automatic administrative verification matching both local application hardcoded lists and live dynamic database security records.
* **Cloud Catalog CRUD Operations:** Complete product management (Create, Read, Update, Delete) directly from the application interface.
* **Cloudinary Media Ingestion:** Automated multi-part requests processing image file uploads instantly to Cloudinary bucket paths, returning secured network paths for Firestore indexing.
* **Master Order Monitoring:** Real-time lifecycle oversight across all customer purchases with instant dropdown status modification controls (`Order Received` $\rightarrow$ `Delivered`).

## 🏗 System Architecture & Technology Stack

* **State Management:** Architecture structured completely using `Provider` models to handle decoupled, reactive state tracking loops across the widget lifecycle.
* **Local Integration Hook Plugins:**
  * `geolocator` & `geocoding` for high-accuracy satellite location coordinate resolving.
  * `firebase_messaging` for asynchronous system push notification identification token registration.
  * `image_picker` for local multimedia asset fetching.

## 📁 Directory Structure

lib/
├── core/
│   ├── constants/       # App styling configurations (e.g., AppColors)
│   └── widgets/         # Globally shared reusable UI components (e.g., PrimaryButton)
├── features/
│   ├── auth/            # Sign-up, Login, and Password Recovery screens
│   ├── home_products/   # Primary feed, grids, and targeted Product Cards
│   ├── product_details/ # Product detail view and local selector counters
│   ├── cart_checkout/   # Real-time Cart Overlays and Geolocation Checkout engines
│   └── orders_profile/  # Customer Profiles, Admin Product Management, and Order Monitors
├── providers/           # App global states (CartProvider, ThemeProvider)
└── services/            # Isolated API wrappers (FirebaseService, CloudinaryService)

## Getting Started
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
