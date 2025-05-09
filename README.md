# **CheckMe – Todo App**  
**Flutter-based Task Management Application**  

---

## **📌 Overview**  
**CheckMe** is a simple yet powerful **Todo App** built with **Flutter**, designed to help users organize their tasks efficiently. It includes essential features like task creation, filtering, marking tasks as complete, and editing/deleting tasks.  

### **🔹 Current Progress**  
✅ **Completed Features:**  
- **User Authentication** (Basic email/password login)  
- **Task Management** (Add, edit, delete, mark as complete)  
- **Task Filtering** (All, Completed, Pending)  
- **Task Details Screen** (View and edit task details)  
- **Responsive UI** (Works on Android & iOS)  

🚧 **Pending Improvements (Future Work):**  
- User registration (Sign-up)  
- Database integration (Firebase/SQLite)  
- Task categories & tags  
- Dark mode support  
- Notifications for due tasks  

---

## **📱 App Screens & Features**  

### **1️⃣ Login Screen**  
- **Email & Password Validation** (Basic check for "@" and min 6 chars)  
- **Gradient Background UI** (Visually appealing design)  
- **Error Handling** (Displays validation errors)  

### **2️⃣ Home Screen**  
- **Greets User** (Displays username extracted from email)  
- **Add New Tasks** (Via Floating Action Button)  
- **Task Filtering** (All, Completed, Pending)  
- **Task List with Checkbox** (Toggle completion status)  
- **Swipe-to-Delete** (Dismissible task cards)  
- **Task Card UI** (Displays title, description, due date)  

### **3️⃣ Todo Details Screen**  
- **View Full Task Details** (Title, description, creation date, status)  
- **Edit Task** (Update title & description via dialog)  

---

## **🛠️ Technical Details**  
- **Built with:** Flutter (Dart)  
- **State Management:** `setState` (Basic state management for now)  
- **UI Components:**  
  - `MaterialApp`, `Scaffold`, `ListView`, `Card`, `AlertDialog`  
  - `Dismissible` (Swipe-to-delete)  
  - `FilterChip` (For task filtering)  

---

## **📂 Project Structure**  
```
lib/  
├── main.dart            (App entry point)  
├── login_screen.dart    (Login UI & logic)  
├── home_screen.dart     (Main task management UI)  
└── todo_details_screen.dart (Task details & edit UI)  
```

---

## **🚀 How to Run the App**  
1. **Ensure Flutter is installed**  
   ```sh
   flutter doctor
   ```
2. **Clone the project (if applicable)**  
3. **Run the app**  
   ```sh
   flutter run
   ```

---

## **🔮 Next Steps (Improvements Needed)**  
1. **Add Firebase/Firestore** for real-time data persistence.  
2. **Implement User Registration** (Sign-up flow).  
3. **Add Due Date Notifications** (Using `flutter_local_notifications`).  
4. **Improve UI/UX** (Animations, dark mode, better error handling).  
5. **Unit & Widget Testing** (Ensure reliability).  

---

## **📜 License**  
This project is open-source. Feel free to modify and extend it!  

---

### **🎯 Summary**  
**CheckMe** is a functional **Flutter Todo App** with basic CRUD operations. It currently supports task management and filtering but needs backend integration for full usability.  

