

Video link -> [ https://drive.google.com/file/d/1Q8oteBneBo5xWWEZJKK921eXOOFTwz5f/view?usp=sharing ]



# Instant_Mechanic-Booking-App
Instant_Mechanic Booking App 

![image alt](https://github.com/ArjunCodewave/Instant_Mechanic-Booking-App/blob/b43d6c156909dd2ea28e6f8dc1d7f95f17b6d881/poster_instant_mechinique.png)

# 🔧 Instant Mechanic Booking App

Instant Mechanic is an iOS application that allows users to discover and book mechanic services. The application fetches mechanic information from a REST API built using FastAPI and displays the data in a SwiftUI interface.

## 📱 Features

* Browse available mechanics
* Search mechanic services
* View mechanic details
* View ratings and experience
* Check mechanic availability
* Book a mechanic service
* REST API integration
* Loading state while fetching data
* Error handling
* JSON decoding using `Codable`
* SwiftUI-based user interface

---

## 🏗️ Technology Stack

### iOS

* Swift
* SwiftUI
* MVVM Architecture
* URLSession
* Codable
* Xcode

### Backend

* Python
* FastAPI
* SQLAlchemy
* REST API
* MySQL

---

## 🔄 API & Data Handling

The application fetches mechanic data from a **REST API** developed using FastAPI.

The implementation demonstrates all the required API concepts:

### 1. API Request

The iOS application uses `URLSession` to send an HTTP request to the FastAPI backend and retrieve mechanic data.

```swift
URLSession.shared.dataTask(with: url) { data, response, error in
    // Handle API response
}
```

### 2. JSON Decoding

The JSON response received from the API is decoded into Swift models using `Codable`.

```swift
let decodedData = try JSONDecoder().decode([Task].self, from: data)
```

This allows the API response to be converted into Swift objects that can be used directly by the UI.

### 3. Loading State

While the API request is running, the application maintains a loading state and displays a loading indicator to the user.

```swift
@Published var isLoading = false
```

The loading state is updated before and after the API request.

### 4. Error Handling

The application handles possible API and decoding errors.

Examples include:

* Network failure
* Invalid API response
* JSON decoding failure
* Server errors

An error message is displayed when the request cannot be completed successfully.

### 5. Displaying API Data in the UI

After successfully fetching and decoding the data, the mechanic information is stored in the ViewModel and displayed using SwiftUI.

```text
FastAPI Backend
       ↓
    REST API
       ↓
    URLSession
       ↓
   JSON Response
       ↓
  JSONDecoder
       ↓
  Swift Codable Model
       ↓
  ProductViewModel
       ↓
     SwiftUI
       ↓
  Mechanic List / Details
```

---

## 🧩 Architecture

The application follows the **MVVM (Model-View-ViewModel)** architecture.

```text
Model
  ↓
ViewModel
  ↓
View
```

### Model

Contains the mechanic data structure and handles JSON mapping using `Codable`.

### ViewModel

Responsible for:

* API requests
* Managing mechanic data
* Loading state
* Error handling
* Providing data to the views

### View

Built using SwiftUI and responsible for displaying:

* Mechanic cards
* Search
* Mechanic details
* Booking interface
* Loading indicators
* Error messages

---

## 📂 Project Structure

```text
Instant_Mechanic-Booking-App/
│
├── Backend/
│   ├── main.py
│   ├── requirements.txt
│   └── src/
│       ├── tasks/
│       ├── user/
│       └── utils/
│
├── Instant_Mechanic/
│   ├── Instant_Mechanic.xcodeproj
│   └── Instant_Mechanic/
│       ├── Model/
│       ├── View/
│       └── ViewModel/
│
└── README.md
```

---

## 🚀 How to Run

### Backend

Navigate to the backend directory:

```bash
cd Backend
```

Create and activate a virtual environment:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

Install dependencies:

```bash
python3 -m pip install -r requirements.txt
```

Start the FastAPI server:

```bash
fastapi dev main.py
```

The API will be available at:

```text
http://127.0.0.1:8000
```

FastAPI interactive documentation:

```text
http://127.0.0.1:8000/docs
```

### iOS Application

1. Open the `Instant_Mechanic` folder.
2. Open `Instant_Mechanic.xcodeproj` in Xcode.
3. Select an iOS Simulator or connected iPhone.
4. Build and run the application.

---

## 🧪 API Response Example

Example mechanic data returned by the backend:

```json
{
    "name": "Instant Auto Care",
    "rating": 4.7,
    "distance": 2.4,
    "location": "Sector 44, Gurgaon",
    "isOpen": true,
    "experience": 12,
    "no.ofservices": 500,
    "no.ofcars": 150,
    "description": "A high-performance mechanic service designed to deliver reliable and efficient vehicle maintenance.",
    "image": "image1"
}
```

---

## 🔐 Error & Loading Handling

The application provides feedback to the user during different API states:

```text
Loading
   ↓
API Request
   ↓
 ┌───────────────┐
 │               │
Success         Error
 │               │
 ↓               ↓
Decode JSON    Show Error
 │
 ↓
Display Data
```

This ensures that the application does not leave the user without feedback while waiting for or processing the API response.

---

## 🎯 Assignment Requirements

| Requirement      | Implementation                      |
| ---------------- | ----------------------------------- |
| API Request      | `URLSession`                        |
| JSON Decoding    | `Codable` + `JSONDecoder`           |
| Loading State    | `@Published isLoading`              |
| Error Handling   | API/network/decoding error handling |
| Display API Data | SwiftUI Views                       |
| Backend          | FastAPI REST API                    |
| Architecture     | MVVM                                |

---

## 🔮 Future Improvements

* User authentication
* Secure token storage using Keychain
* Service history
* Push notifications
* Production database deployment

---

## 🤖 AI Assistance

AI tools were used during development for: OpenAI -> For codeing  / gemini for -> image generation of mechanic 

* FastAPI development assistance
* Improving code structure
* README documentation

The application logic, integration, testing, and final implementation were reviewed and adapted as part of the development process.

---

## 👨‍💻 Developer

**Arjun Rana**

---

## 📄 License

This project was developed as an assignment/project for demonstration and learning purposes.
