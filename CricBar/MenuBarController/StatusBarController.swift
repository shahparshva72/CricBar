//
//  StatusBarController.swift
//  CricBar
//
//  Created by Parshva Shah on 3/28/23.
//

import AppKit
import SwiftUI

class StatusBarController: NSObject {
    private var statusBarItem: NSStatusItem!
    private var popover: NSPopover!
    
    override init() {
        super.init()
        
        let contentView = ContentView()
        
        popover = NSPopover()
        popover.contentSize = NSSize(width: 300, height: 120)
        popover.behavior = .transient
        popover.animates = true
        popover.contentViewController = NSHostingController(rootView: contentView)
        
        statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        
        if let button = statusBarItem.button {
            button.title = "🏏"
            button.action = #selector(togglePopover)
            button.target = self
        }
    }


    
    @objc func togglePopover(_ sender: AnyObject) {
        if popover.isShown {
            popover.performClose(sender)
        } else {
            if let button = statusBarItem.button {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
    }

}

