// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct WorkerNotification {
    public var name: String
    public var handler: (Notification) -> Void

    public init(name: String, handler: @escaping (Notification) -> Void) {
        self.name = name
        self.handler = handler
    }
}

public class TheBoringWorkerNotifier {
    private let notificationCenter = DistributedNotificationCenter.default()
    
    public let toggleMicNotification: WorkerNotification = .init(name: "theboringteam.theboringworker.togglemic", handler: { _ in
        print("Received toggle mic notification")
    })
    
    public let toggleHudReplacementNotification: WorkerNotification = .init(name: "theboringteam.theboringworker.togglehudreplacement", handler: { _ in
        print("Received toggle hud replacement notification")
    })
    
    public let showClipboardNotification: WorkerNotification = .init(name: "theboringteam.theboringnotch.showclipboard", handler: { _ in
        
        print("Received show clipboard notification")
    })
    
    public let sneakPeekNotification: WorkerNotification = .init(name: "theboringteam.workers.sneakPeek", handler: { _ in
        print("Received sneak peak notification")
    })
    
    public let micStatusNotification: WorkerNotification = .init(name: "theboringteam.theboringworker.micstatus", handler: { _ in
        print("Received mic status notification")
    })

    public init() {
        NSLog("TheBoringWorkerNotifier init")
    }
    
    public func postNotification(name: String, userInfo: [AnyHashable: Any]?) {
        DispatchQueue.main.async {
            self.notificationCenter.postNotificationName(.init(name), object: nil, userInfo: userInfo, deliverImmediately: true)
        }
    }
    
    public func setupObserver(notification: WorkerNotification, handler: @escaping (Notification) -> Void) {
        notificationCenter.addObserver(forName: .init(notification.name), object: nil, queue: nil, using: handler)
    }
}
