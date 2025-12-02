# SwiftUI Architecture Demo

This project demonstrates a clean and scalable **SwiftUI application architecture** suitable for mid-level and senior iOS engineers.  
It includes:

- **AppCoordinator** navigation architecture
- **Dependency Injection (DI) Container**
- **MVVM**
- **Swift Concurrency (async/await)**
- **Modular organization**
- **Protocol-driven networking**
- Testable and maintainable design

The goal is to show how to structure SwiftUI applications in a way that scales for real products.

---

## 🚀 Features

### ✔ Clean Architecture Principles
- Coordinator pattern for navigation
- Dependency Injection via `AppContainer`
- MVVM with protocol-driven abstractions
- No singletons except allowed DI root

### ✔ Swift Concurrency
- Async networking client
- Structured concurrency (`async/await`)
- MainActor isolation for ViewModels

### ✔ Networking Layer
- Protocol: `NetworkClientProtocol`
- Concrete implementation: `NetworkClient`
- Example endpoint: fetch articles (mocked)

### ✔ Modular SwiftUI Navigation
- `AppCoordinatorView` manages high-level flows
- `NavigationStack` + dynamic destinations

### ✔ Testability
- ViewModel depends only on protocol (`NetworkClientProtocol`)
- Easy to create mocks for unit tests

---

## 📁 Project Structure

```text
SwiftUIArchitectureDemo/
├─ SwiftUIArchitectureDemoApp.swift        // Entry point
├─ AppContainer.swift                       // DI container
├─ Coordinator/
│  └─ AppCoordinatorView.swift
├─ Networking/
│  ├─ NetworkClient.swift
│  └─ Models/
│     └─ Article.swift
└─ Features/
   └─ Home/
      ├─ HomeView.swift
      └─ HomeViewModel.swift
