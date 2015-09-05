//
//  settingViewController.swift
//  practiceCoreMotion
//
//  Created by Fumiya Yamanaka on 2015/09/05.
//  Copyright (c) 2015年 Fumiya Yamanaka. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class settingViewController: UIViewController, UIPickerViewDelegate, AVAudioPlayerDelegate {
    
    var soundPicker: UIPickerView!
    var soundAudioPlayer: AVAudioPlayer!
    var soundArray = ["See You Again"]
    
    func mySoundPicker() {
        soundPicker = UIPickerView()
        soundPicker.frame = CGRectMake(0, self.view.bounds.height/5, 0, 0)
        soundPicker.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
}
