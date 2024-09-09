# TheBoringWorkerNotifier 💡

![TheBoringWorkerNotifier Build & Test](https://github.com/TheBoredTeam/TheBoringWorkerNotifier/actions/workflows/ci-cd.yml/badge.svg)

TheBoringWorkerNotifier is a Swift library for BoringNotch and TheBoringWorkeres that provides a simple interface for managing distributed notifications in macOS applications. It allows you to easily post notifications and set up observers for various system events.

## Features

- Easy-to-use interface for posting distributed notifications
- Pre-defined notification types for common events
- Simple observer setup for handling notifications

## Installation

### Swift Package Manager

Add the following line to your `Package.swift` file's dependencies:

```swift
.package(url: "https://github.com/TheBoredTeam/TheBoringWorkerNotifier.git", from: "1.0.0")
```

Then, include it in your target dependencies:

```swift
.target(name: "YourTarget", dependencies: ["TheBoringWorkerNotifier"]),
```

## Usage

### Initialization

```swift
import TheBoringWorkerNotifier

let notifier = TheBoringWorkerNotifier()
```

### Posting a Notification

```swift
notifier.postNotification(name: "theboringteam.theboringworker.togglemic", userInfo: ["key": "value"])
```

### Setting Up an Observer

```swift
notifier.setupObserver(notification: notifier.toggleMicNotification) { notification in
    // Handle the notification
    print("Mic toggle notification received")
}
```

## Available Notifications

- `toggleMicNotification`
- `toggleHudReplacementNotification`
- `showClipboardNotification`
- `sneakPeakNotification`
- `micStatusNotification`

## Contributing

We welcome contributions to TheBoringWorkerNotifier! Here's how you can help:

1. Fork the repository
2. Create a new branch for your feature or bug fix
3. Make your changes and commit them with a clear commit message
4. Push your changes to your fork
5. Submit a pull request to the main repository

Please ensure that your code follows the existing style and includes appropriate tests.

## Running Tests

To run the tests for TheBoringWorkerNotifier, use the following command in the project directory:

```
swift test
```

## License

TheBoringWorkerNotifier is released under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

If you have any questions, issues, or suggestions, please open an issue on the GitHub repository.