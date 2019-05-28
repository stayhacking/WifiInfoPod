import Foundation
import SystemConfiguration.CaptiveNetwork

@objc(WifiInfo)
public class WifiInfo: NSObject {
    @objc
    public static func getWiFiSsid() -> [String : Any] {
        var resp: [String: Any] = ["connected": false]
        var ssid: String?
        var bssid: String?
        if let interfaces = CNCopySupportedInterfaces() as NSArray? {
            for interface in interfaces {
                if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                    ssid = interfaceInfo[kCNNetworkInfoKeySSID as String] as? String
                    bssid = interfaceInfo[kCNNetworkInfoKeyBSSID as String] as? String
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
    
    
    @objc
    public static func remyremy() -> String {
        return "remy remy"
    }
}
