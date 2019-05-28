import Foundation
import SystemConfiguration.CaptiveNetwork

@objc(WifiInfo)
public class WifiInfo: NSObject {
    @objc dynamic public static func getWiFiSsid() -> String {
        var resp: [String: Any] = ["connected": false]
        var ssid: String?
        var bssid: String?
        print("Calling CNCopySupportedInterfaces()")
        if let interfaces = CNCopySupportedInterfaces() as NSArray? {
            print("Type cast to NSArray SUCCESS")
            for interface in interfaces {
                print("new interface")
                print(interface)
                print("test")
                if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                    print("new interfaceInfo")
                    print(interface)
                    ssid = interfaceInfo[kCNNetworkInfoKeySSID as String] as? String
                    print("ssid")
                    print(ssid!)
                    bssid = interfaceInfo[kCNNetworkInfoKeyBSSID as String] as? String
                    print("bssid")
                    print(bssid!)
                    break
                }
            }
        }
        if ssid != nil {
            resp["connected"] = true
            resp["ssid"] = ssid
            resp["bssid"] = bssid
        }
        return jsonToString(json: resp as AnyObject)
    }
    
    
    @objc dynamic public static func remyremy() -> String {
        return "remy remy"
    }
    
    private static func jsonToString(json: AnyObject) -> String {
        print("test")
        do {
            let data1 =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
            let convertedString = String(data: data1, encoding: String.Encoding.utf8) // the data will be converted to the string
            print(convertedString ?? "defaultvalue")
            return convertedString!
        } catch let myJSONError {
            print(myJSONError)
            return "error"
        }
        
    }
}
