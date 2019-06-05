import Foundation
import SystemConfiguration.CaptiveNetwork
import NetworkExtension

@objc(WifiInfo)
public class WifiInfo: NSObject {
    @objc
    public static dynamic func getWiFiSsid() -> String {
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
    public static dynamic func remyremy() -> String {
        return "remy remy"
    }
    
    @objc
    public static dynamic func joinWifi(ssid: String, passphrase: String, isWep: Bool = false  ) -> Bool {
        let success = true
        let configuration = NEHotspotConfiguration.init(ssid: ssid, passphrase: passphrase, isWEP: isWep)
        configuration.joinOnce = true
        
        NEHotspotConfigurationManager.shared.apply(configuration) { (error) in
            if error != nil {
                if error?.localizedDescription == "already associated."
                {
                    print("Already Connected")
                }
                else{
                    print("No Connected")
                }
            }
            else {
                print("Connected")
            }
        }
        
        return success
    }
    
}
