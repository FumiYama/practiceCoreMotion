//
//  ViewController.swift
//  practiceCoreMotion
//
//  Created by Fumiya Yamanaka on 2015/09/03.
//  Copyright (c) 2015年 Fumiya Yamanaka. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation

class ViewController: UIViewController {
    
    var myMotionManager: CMMotionManager!
    
    let myDevice: UIDevice = UIDevice.currentDevice()
    var pushUpCount:Int = 0
    var trainingTime:Int = 0
    let countLabal: UILabel = UILabel(frame: CGRectMake(0, 0, 50, 50))


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 近接センサーを有効に
        myDevice.proximityMonitoringEnabled = true
       
        // 近接センサーの通知設定
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "proxmitySensorStateDidChange:", name: UIDeviceProximityStateDidChangeNotification, object: nil)
        
        // 近接センサーを無効に
//        NSNotificationCenter.defaultCenter().removeObserver(self)
        //近接センサーの監視を解除
//        NSNotificationCenter.defaultCenter(). removeObserver(self, name:UIDeviceProximityStateDidChangeNotification, object: nil)
        
        let myLabel: UILabel = UILabel(frame: CGRectMake(0, 0, 300, 50))
        myLabel.text = "近接センサーで画面が暗くなる"
        myLabel.backgroundColor = UIColor.orangeColor()
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 11.0
        myLabel.textColor = UIColor.whiteColor()
        myLabel.shadowColor = UIColor.grayColor()
        myLabel.textAlignment = NSTextAlignment.Center
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2, y: 440)
        
        countLabal.backgroundColor = UIColor.redColor()
        countLabal.layer.masksToBounds = true
        countLabal.layer.cornerRadius = 11.0
        countLabal.textColor = UIColor.whiteColor()
        countLabal.shadowColor = UIColor.grayColor()
        countLabal.textAlignment = NSTextAlignment.Center
        countLabal.layer.position = CGPoint(x: self.view.bounds.width/2, y: 520)
        
        self.view.addSubview(myLabel)
        self.view.addSubview(countLabal)
        
        
//         CoreMotion
        let myXLabel: UILabel = UILabel(frame: CGRectMake(0, 0, 200, 50))
        myXLabel.backgroundColor = UIColor.blueColor()
        myXLabel.layer.masksToBounds = true
        myXLabel.layer.cornerRadius = 10.0
        myXLabel.textColor = UIColor.whiteColor()
        myXLabel.shadowColor = UIColor.grayColor()
        myXLabel.textAlignment = NSTextAlignment.Center
        myXLabel.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200)
        
        let myYLabel: UILabel = UILabel(frame: CGRectMake(0, 0, 200, 50))
        myYLabel.backgroundColor = UIColor.orangeColor()
        myYLabel.layer.masksToBounds = true
        myYLabel.layer.cornerRadius = 10.0
        myYLabel.textColor = UIColor.whiteColor()
        myYLabel.shadowColor = UIColor.grayColor()
        myYLabel.textAlignment = NSTextAlignment.Center
        myYLabel.layer.position = CGPoint(x: self.view.bounds.width/2, y: 280)
        
        let myZLabel :UILabel = UILabel(frame: CGRectMake(0, 0, 200, 50))
        myZLabel.backgroundColor = UIColor.greenColor()
        myZLabel.layer.masksToBounds = true
        myZLabel.layer.cornerRadius = 10.0
        myZLabel.textColor = UIColor.whiteColor()
        myZLabel.shadowColor = UIColor.grayColor()
        myZLabel.textAlignment = NSTextAlignment.Center
        myZLabel.layer.position = CGPoint(x: self.view.bounds.width/2, y:360)
        
        
        self.view.backgroundColor = UIColor.cyanColor()
        // ViewにLabelを追加
//        self.view.addSubview(myXLabel)
//        self.view.addSubview(myYLabel)
//        self.view.addSubview(myZLabel)
        
        // MotionManegerの追加
        myMotionManager = CMMotionManager()
        //　更新周期の設定
        myMotionManager.accelerometerUpdateInterval = 0.1
        // 加速度の取得を開始
        myMotionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: {(accelerometerData:CMAccelerometerData!, error:NSError!) -> Void in
            myXLabel.text = "x=\(accelerometerData.acceleration.x)"
            myYLabel.text = "y=\(accelerometerData.acceleration.y)"
            myZLabel.text = "z=\(accelerometerData.acceleration.z)"
        })

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func proxmitySensorStateDidChange(notification: NSNotification) {
        if myDevice.proximityState == false  {
            pushUpCount += 1
            
            if trainingTime == pushUpCount {
                pushUpCount = 0
            }
            countLabal.text = String(pushUpCount)
        }
    }
    
}

