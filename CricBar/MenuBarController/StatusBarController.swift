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
        popover.contentSize = NSSize(width: 400, height: 400)
        popover.behavior = .transient
        popover.animates = true
        popover.contentViewController = NSHostingController(rootView: contentView)
        
        statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        
        if let button = statusBarItem.button {
            button.title = "🏏"
            button.action = #selector(togglePopover)
            button.target = self
        }
        
        NSEvent.addGlobalMonitorForEvents(matching: [.leftMouseDown, .rightMouseDown]) { [weak self] event in
            guard let self = self else { return }
            if self.popover.isShown {
                self.hidePopover(event)
            }
        }
    }

    func hidePopover(_ sender: Any) {
        popover.performClose(sender)
    }
    
    func showPopover() {
        guard let button = statusBarItem.button else { return }
        popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
    }
    
    @objc func togglePopover(_ sender: AnyObject) {
        if popover.isShown {
            hidePopover(sender)
        } else {
            showPopover()
        }
    }

}

