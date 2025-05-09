# ✅ Godefroid CheckMe – Smart Todo App

Godefroid CheckMe is a beautifully designed and feature-rich **Todo App** built with **Flutter** and powered by **Riverpod**, **Firebase**, and **Google Fonts**. It's built to help users manage daily tasks efficiently while providing a clean, modern UI. Designed as a beginner-friendly milestone project, this app demonstrates best practices in Flutter app architecture, state management, theming, and responsive UI design.

---

## 🚀 Features

### 🔐 Authentication
- Validated Login Page with email and password fields.
- Avatar image and custom UI.
- Simple navigation to home after login.

### 🏠 Home Screen
- Displays a personalized welcome message with the user’s name.
- Lists all todos with checkboxes and styled status indicators.
- Floating Action Button to add new todos.

### ➕ Add & ✏️ Edit Todo
- Form to input title, description, and due date.
- Use of `uuid` package to uniquely identify todos.
- Option to edit any created todo with a pencil icon.

### ✅ Todo Completion
- Checkbox to mark todo as completed.
- Strikethrough or faded style for completed items.

### 🗑️ Delete Todo
- Delete todos via a menu (three-dot popup menu).
- Long press support for deletion (optional for future).

### 🔍 Search Functionality
- Search bar to quickly find todos by title or description.

### 🗂️ Todo Categories
- Assign categories to todos (e.g., School, Personal, Urgent).
- Filter todos by selected category.

### 🌗 Theme Switching
- Toggle between **Dark Mode**, **Light Mode**, or system default.
- Managed using `flutter_riverpod` global state.

---

## 📱 Screens & Pages

- `LoginScreen` – User input form with validation.
- `HomeScreen` – Todo dashboard and task list.
- `AddEditTodoScreen` – Form for creating/editing todos.
- `TodoDetailsScreen` – (Optional) Show full task info.
- `CategoryFilterWidget` – UI for filtering by category.
- `SearchBarWidget` – Search by task title or description.

---

## 🛠️ Dependencies Used

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.4.0
  google_fonts: ^6.1.0
  intl: ^0.19.0
  flutter_hooks: ^0.20.3
  firebase_core: ^2.18.0
  cloud_firestore: ^4.15.1
  cupertino_icons: ^1.0.8
  device_preview: ^1.2.0
  uuid: ^3.0.4
