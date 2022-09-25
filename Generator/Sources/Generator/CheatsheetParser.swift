import Foundation
import SwiftSoup
import SwiftyJSON
import Alamofire

struct CheatSheet: DataParser {

    var location: String
    var olderStyle: Bool {
        true
    }

    func metadataParser() -> [UpdatedIcon] {
        print("Requesting data from \(location)")
        
        let semaphore = DispatchSemaphore(value: 0)
        var icons = [UpdatedIcon]()

        AF.request(location).responseString(queue: DispatchQueue.global(qos: .background)) { response in
            print("Got a response")
            defer {
                semaphore.signal()
            }
            guard response.response?.statusCode == 200 else {
                print("Could not fetch data... Recieved status code \(response.response!.statusCode)")
                return
            }
            
            let result: String
            switch response.result {
            case .success(let value):
                result = value
            case .failure(let error):
                print("Could not fetch data: \(error.localizedDescription)")
                return
            }

            do {
                print("Starting parsing")

                let doc: Document = try SwiftSoup.parse(result)
                let scripts = try doc.select("script")
                for script in scripts {
                    let content = try script.html().trimmingCharacters(in: .whitespacesAndNewlines)
                    if content.hasPrefix("window.__inline_data__") {
                        let json = content.replacingOccurrences(of: "window.__inline_data__ = ", with: "")
                        
                        guard let dataFromString = json.data(using: .utf8, allowLossyConversion: false) else {
                            print("Unable to parse json")
                            exit(EXIT_FAILURE)
                        }
                        
                        let parsedData = parseJSON(["data": try JSON(data: dataFromString)])

                        icons = parsedData
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        
        semaphore.wait()
        
        return icons
    }
    
    func parseJSON(_ data: [String : JSON]) -> [UpdatedIcon] {
        guard let json = data["data"] else {
            return []
        }

        for block in json.arrayValue {
            if block["data"][0]["type"].stringValue != "icon" {
                continue
            }
            
            return block["data"].arrayValue.map { data in
                let free = data["attributes"]["membership"]["free"].arrayValue.compactMap {
                    try? Family(family: "classic", style: $0.stringValue, olderPort: true)
                }

                let pro = data["attributes"]["membership"]["pro"].arrayValue.compactMap {
                    try? Family(family: "classic", style: $0.stringValue, olderPort: true)
                }
                
                return UpdatedIcon(name: data["id"].stringValue,
                                   unicode: data["attributes"]["unicode"].stringValue,
                                   free: free,
                                   pro: pro)
            }
        }
        
        return []
    }

}
