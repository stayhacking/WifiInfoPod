import Foundation
import SystemConfiguration.CaptiveNetwork

@objc(WifiInfo)
public class WifiInfo: NSObject {
    @objc dynamic public static func getWiFiSsid() -> [String : Any] {
        var resp: [String: Any] = ["connected": false]
        var ssid: String?
        var bssid: String?
        print("Calling CNCopySupportedInterfaces()")
        if let interfaces = CNCopySupportedInterfaces() as NSArray? {
            print("Type cast to NSArray SUCCESS")
            for interface in interfaces {
                print("new interface")
                print(interface)
                if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                    print("new interfaceInfo")
                    print(interface)
                    ssid = interfaceInfo[kCNNetworkInfoKeySSID as String] as? String
                    print("ssid")
                    print(ssid)
                    bssid = interfaceInfo[kCNNetworkInfoKeyBSSID as String] as? String
                    print("bssid")
                    print(bssid)
                    break
                }
            }
        }
        if ssid != nil {
            resp["connected"] = true
            resp["ssid"] = ssid
            resp["bssid"] = bssid
        }
        return resp
    }
    
    
    @objc dynamic public static func remyremy() -> String {
        return "remy remy"
    }
}
