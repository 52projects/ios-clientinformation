//
//  ViewController.swift
//  playground
//
//  Created by Chad Meyer on 8/10/16.
//  Copyright © 2016 52projects, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("App Name \(DeviceInfo.appName())")
        print("Carrier Name \(DeviceInfo.carrierName())")
        print("Client Identifier \(DeviceInfo.clientIdentifier())")
        print("Device Model \(DeviceInfo.deviceModel())")
        print("Device Name \(DeviceInfo.deviceName())")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

