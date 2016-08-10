//
//  DeviceInfo.swift
//  playground
//
//  Created by Chad Meyer on 8/10/16.
//  Copyright © 2016 52projects, LLC. All rights reserved.
//

import UIKit
import CoreTelephony

public class DeviceInfo {
    // List of device names that don't support advanced visual settings
    static let lowGraphicsQualityModels = ["iPad", "iPad1,1", "iPhone1,1", "iPhone1,2", "iPhone2,1", "iPhone3,1", "iPhone3,2", "iPhone3,3", "iPod1,1", "iPod2,1", "iPod2,2", "iPod3,1", "iPod4,1", "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4", "iPad3,1", "iPad3,2", "iPad3,3"]
    
    public static var specificModelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let machine = systemInfo.machine
        let mirror = Mirror(reflecting: machine)
        var identifier = ""
        
        // Parses the string for the model name via NSUTF8StringEncoding, refer to
        // http://stackoverflow.com/questions/26028918/ios-how-to-determine-iphone-model-in-swift
        for child in mirror.children.enumerate() {
            if let value = child.1.value as? Int8 where value != 0 {
                identifier.append(UnicodeScalar(UInt8(value)))
            }
        }
        return identifier
    }
    
    public class func appName() -> String? {
        let localizedDict = NSBundle.mainBundle().localizedInfoDictionary
        let infoDict = NSBundle.mainBundle().infoDictionary
        let key = "CFBundleDisplayName"
        
        // E.g., "Fennec Nightly".
        return localizedDict?[key] as? String ??
            infoDict?[key] as? String
    }

    public class func clientIdentifier() -> String {
        return NSUUID().UUIDString
    }
    
    public class func deviceModel() -> String {
        return UIDevice.currentDevice().model
    }
    
    public class func deviceName() -> String {
        return UIDevice.currentDevice().name
    }
    
    public class func isSimulator() -> Bool {
        return UIDevice.currentDevice().model.rangeOfString("Simulator") != nil
    }

    public class func isIPadPro() -> Bool {
        return ["iPad6,7", "iPad6,8"].contains(specificModelName)
    }
    
    public class func carrierName() -> String? {
        // Setup the Network Info and create a CTCarrier object
        let networkInfo = CTTelephonyNetworkInfo()
        let carrier = networkInfo.subscriberCellularProvider
        
        // Get carrier name
        return carrier!.carrierName
    }
}