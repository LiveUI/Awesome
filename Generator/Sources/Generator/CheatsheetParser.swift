import Foundation
import SwiftSoup
import SwiftyJSON

func parseCheatsheet(from html: String) -> [Icon] {
    do {
        let doc: Document = try SwiftSoup.parse(html)
        let scripts = try doc.select("script")
        for script in scripts {
            let content = try script.html().trimmingCharacters(in: .whitespacesAndNewlines)
            if content.hasPrefix("window.__inline_data__") {
                let json = content.replacingOccurrences(of: "window.__inline_data__ = ", with: "")
                return parseJSON(json)
            }
        }
    } catch {
        print(error.localizedDescription)
        exit(EXIT_FAILURE)
    }
    
    return []
}

func parseJSON(_ content: String) -> [Icon] {
    guard let dataFromString = content.data(using: .utf8, allowLossyConversion: false) else {
        exit(EXIT_FAILURE)
    }
    
    do {
        let json = try JSON(data: dataFromString)
        
        for block in json.arrayValue {
            if block["data"][0]["type"].stringValue != "icon" {
                continue
            }
            
            return block["data"].arrayValue.map { data in
                let free = data["attributes"]["membership"]["free"].arrayValue.map({$0.stringValue})
                let pro = data["attributes"]["membership"]["pro"].arrayValue.map({$0.stringValue})
                
                return Icon(name: data["id"].stringValue, unicode: data["attributes"]["unicode"].stringValue, free: free, pro: pro)
            }
        }
    } catch {
        print(error.localizedDescription)
        exit(EXIT_FAILURE)
    }
    
    return []
}
