//
//  InterfaceController.swift
//  ProgrammerEyesWatch Extension
//
//  Created by Nicholas Lee on 2020-10-06.
//

import WatchKit
import Foundation
import UserNotifications

class InterfaceController: WKInterfaceController {

    @IBOutlet var startButton: WKInterfaceButton!
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        let center  = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            //if user doesnt allow notifications maybe say something, otherwause granted will be true
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

    @IBAction func StartButtonTapped(){
        self.presentController(withName: "timerScreen", context: nil)
        
    }
}
