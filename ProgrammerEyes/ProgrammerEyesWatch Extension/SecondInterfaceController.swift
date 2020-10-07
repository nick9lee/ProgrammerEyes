//
//  SecondInterfaceController.swift
//  ProgrammerEyesWatch Extension
//
//  Created by Nicholas Lee on 2020-10-06.
//

import WatchKit
import Foundation


class SecondInterfaceController: WKInterfaceController {
    
    var theTimer = Timer()
    var timePassed = 30    //default 1200
    var twentyMinutesPassed = true
    var newTimerNeeded = true
    
    @IBOutlet var timerLabel: WKInterfaceLabel!
    @IBOutlet var lookAwayLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if(newTimerNeeded == true){ // here change to 1200
            theTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Action), userInfo: nil, repeats: true)
            newTimerNeeded = false
        }
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func EndWorkbutton() {
        theTimer.invalidate()
        timePassed = 1200
        newTimerNeeded = true
    }
    
    @objc func Action(){
        
        timePassed -= 1
        
        //calculate what timer labe should look like
        var temp = timePassed
        var min = 0
        var sec = 0
        while(temp >= 60){
            if(temp >= 60){
                temp -= 60
                min += 1
            }
        }
        if(temp >= 0){
            sec = temp
        }else {
            sec = 0
        }
        
        var label: String
        
        if(min == 0){
            label = String(sec) + "s"
        } else{
            if(sec >= 10){
                label = String(min) + ":" + String(sec)
            } else{
                label = String(min) + ":0" + String(sec)
            }
        }
        
        
        timerLabel.setText(label)
        
        if(timePassed == 0){
            timerDone()
        }
        
    }
    
    func timerDone(){
        //when timer done counting down
        if(twentyMinutesPassed == true){
            timePassed = 20
            timerLabel.setTextColor(#colorLiteral(red: 1, green: 0.8613314344, blue: 0, alpha: 1))
            twentyMinutesPassed = false
            lookAwayLabel.setText("Look 20ft away!")
        } else{
            timePassed = 1200
            timerLabel.setTextColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
            twentyMinutesPassed = true
            lookAwayLabel.setText("")
        }
    }
    
}
