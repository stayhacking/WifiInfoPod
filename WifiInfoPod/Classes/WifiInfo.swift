import Foundation
import SystemConfiguration.CaptiveNetwork

@objc(WifiInfo)
public class WifiInfo: NSObject {
    @objc
    public static func getWiFiSsid() -> String {
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
        
        var out = "err"
        do {
            let data1 =  try JSONSerialization.data(withJSONObject: resp, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
            out = String(data: data1, encoding: String.Encoding.utf8)! // the data will be converted to the string
        } catch let myJSONError {
            print(myJSONError)
        }
        return out
    }
    
    
    @objc
    public static func remyremy() -> String {
        return "remy remy"
    }
}
