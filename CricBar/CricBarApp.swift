//
//  CricBarApp.swift
//  CricBar
//
//  Created by Parshva Shah on 2/18/23.
//

import SwiftUI

@main
struct CricBarApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate, NSPopoverDelegate {
    var statusBar: StatusBarController?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        statusBar = StatusBarController()
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        statusBar = nil
    }
}
