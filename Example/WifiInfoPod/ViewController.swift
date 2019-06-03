//
//  ViewController.swift
//  WifiInfoPod
//
//  Created by Matt Gross on 05/27/2019.
//  Copyright (c) 2019 Matt Gross. All rights reserved.
//

import UIKit
import WifiInfoPod

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let remy = WifiInfo.getWiFiSsid()
        print("Conneecting to wifi")
        let ssid = ""
        let passphrase = ""
        WifiInfo.joinWifi(ssid: ssid, passphrase: passphrase)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

