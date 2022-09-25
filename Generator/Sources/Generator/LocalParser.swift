//
//  LocalParser.swift
//  
//
//  Created by Kingtak Justin Wong on 9/19/22.
//

import Foundation
import SwiftSoup
import SwiftyJSON
import Files

enum CodingError: Error {
    case noInfo
}

struct LocalParser: DataParser {
    var location: String

    var olderStyle: Bool {
        false
    }

    func metadataParser() -> [UpdatedIcon] {
        do {
            let files = try Folder(path: "\(location)/metadata").files.filter { file in
                file.name.lowercased().range(of: "icon") != nil && file.extension?.lowercased().range(of: "json") != nil
            }
            
            let data = files.reduce([String: JSON]()) { initial, partial in
                var newResult = initial
                
                do {
                    let fileName = partial.nameExcludingExtension
                    let fileData = try Data(contentsOf: partial.url)
                    let json = try JSON(data: fileData)
                    
                    newResult["\(fileName)"] = json
                } catch {
                    
                }
                
                return newResult
            }
            
            return parseJSON(data)
            
        } catch {
            print(error.localizedDescription)
        }
        
        return []
    }
    
    func parseJSON(_ json: [String: JSON]) -> [UpdatedIcon] {
        var collectedData = [UpdatedIcon]()

        guard let icons = json["icons"],
              let iconFamilies = json["icon-families"] else {
            return []
        }
        
        for (key, icon) in icons {
            let familyStyle = iconFamilies[key]["familyStylesByLicense"]

            var membershipInfo = [String: [Family]]()

            for membership in Membership.allCases {
                guard let fontInformation = familyStyle.dictionaryValue[membership.rawValue]?.arrayValue else {
                    continue
                }
                
                let allFamilies = fontInformation.compactMap { info in
                    do {
                        
                        guard  let dictionary = info.dictionary,
                               let style = dictionary["style"]?.rawString(),
                               let family = dictionary["family"]?.rawString() else {
                            throw CodingError.noInfo
                        }
                        
                        return try Family(family: family, style: style)
                    } catch {
                        
                    }
                    
                    return nil
                }

                if !allFamilies.isEmpty {
                    membershipInfo[membership.rawValue] = allFamilies
                }
            }
            
            if !membershipInfo.isEmpty {
                let newIcon = UpdatedIcon(name: key,
                                      unicode: icon.dictionary?["unicode"]?.rawString() ?? "",
                                      free: membershipInfo["free"] ?? [],
                                      pro: membershipInfo["pro"] ?? [])

                collectedData.append(newIcon)
            }
        }
        
        return collectedData
    }

}

