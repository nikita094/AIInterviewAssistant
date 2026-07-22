# AI Interview Assistant

An AI-powered iOS application built with **SwiftUI** that helps users prepare for technical interviews by generating AI-based answers using the **Google Gemini API**.

## Features

- 🤖 Ask technical interview questions
- 💬 AI-generated responses using Google Gemini
- ⚡ Built with Swift Concurrency (Async/Await)
- 🏗️ Clean MVVM architecture
- 🌐 Generic networking layer
- 🚨 Centralized error handling
- 🔐 Secure API key management using `.xcconfig`
- 📱 Native SwiftUI interface

## Tech Stack

- Swift 6
- SwiftUI
- MVVM Architecture
- Async/Await
- URLSession
- Google Gemini API
- Xcode 15+

## Project Structure

```
AIInterviewAssistant
│
├── Models
│   ├── Message.swift
│   ├── ChatRequest.swift
│   └── ChatResponse.swift
│
├── Networking
│   ├── APIClient.swift
│   ├── APIConstant.swift
│   ├── Endpoint.swift
│   └── NetworkError.swift
│
├── Services
│
├── ViewModels
│
├── Views
│
├── Resources
│   └── Info.plist
│
└── Config
    ├── Secrets.xcconfig
    └── Secrets.example.xcconfig
```

## Getting Started

### Clone the repository

```bash
git clone https://github.com/nikita094/AIInterviewAssistant.git
```

### Create your API configuration

Create a file named:

```
Secrets.xcconfig
```

Add your Gemini API key:

```text
API_KEY=YOUR_GEMINI_API_KEY
```

Do **not** commit this file.

### Build & Run

1. Open the project in Xcode.
2. Select an iOS Simulator.
3. Press **⌘ + R**.

## Architecture

The project follows the **MVVM** architecture.

```
View
   │
ViewModel
   │
Service
   │
APIClient
   │
Google Gemini API
```

## Current Modules

- ✅ Project Setup
- ✅ Generic API Client
- ✅ Network Layer
- ✅ Error Handling
- ✅ Gemini API Integration
- ✅ Secure API Key Configuration

## Roadmap

- [ ] Chat history
- [ ] Streaming AI responses
- [ ] Voice input
- [ ] Prompt templates
- [ ] Unit Tests
- [ ] Dark Mode improvements

## Security

API keys are **not stored** in source code.

The application uses:

- `Secrets.xcconfig`
- `.gitignore`
- `Info.plist` variable substitution

to securely manage API credentials.

## Screenshots

_Add screenshots here after completing the UI._

## Author

**Nikita Kothadiya**

- iOS Developer
- Swift & SwiftUI
- Mobile Architecture
- AI-powered iOS Applications

---

If you find this project useful, consider giving it a ⭐ on GitHub.
