import Foundation
import Alamofire
import SwiftyJSON
import ArgumentParser

@main
struct EnumGenerator: ParsableCommand {
    @Option(name: .shortAndLong, help: "Where is the Font Awesome folder located?")
    var location: String?

    @Option(name: .shortAndLong, help: "Where is the Font Awesome folder located?")
    var output: String = "./Output"
    
    mutating func run() throws {
        
        let parser: any DataParser

        if let location {
            parser = LocalParser(location: location)
        } else {
            parser = CheatSheet(location: "https://fontawesome.com/cheatsheet")
        }
        
        let icons = parser.metadataParser()
        
        var styleSet: Dictionary<Membership, Set<Family>> = [
            .pro: [],
            .free: []
        ]
        
        var iconsGroups: Dictionary<Membership, [Family: [UpdatedIcon]]> = [
            .pro: [:],
            .free: [:]
        ]
        
        for icon in icons {
            let strippedIcon = UpdatedIcon(name: icon.name,
                                           unicode: icon.unicode,
                                           free: [],
                                           pro: [])

            for style in icon.free {
                let builtHash: Family
                
                guard let family = style as? Family else { continue }

                builtHash = family
                
                if iconsGroups[.free]?[builtHash] == nil {
                    iconsGroups[.free]?[builtHash] = []
                }

                iconsGroups[.free]?[builtHash]?.append(strippedIcon)
                styleSet[.free]?.insert(builtHash)
            }
            
            for style in icon.pro {
                let builtHash: Family
                
                guard let family = style as? Family else { continue }

                builtHash = family

                if iconsGroups[.pro]?[builtHash] == nil {
                    iconsGroups[.pro]?[builtHash] = []
                }

                iconsGroups[.pro]?[builtHash]?.append(strippedIcon)
                styleSet[.pro]?.insert(builtHash)
            }
        }
        
        for membership in Membership.allCases {
            guard let icons = iconsGroups[membership] else {
                continue
            }

            let generatedFile = EnumFileGenerator(options: .init(type: membership),
                                                  oldStyle: parser.olderStyle)
                .body(from: icons)

            let name = "\(membership.association).swift"
            let destination = URL(fileURLWithPath: output).appendingPathComponent("\(name)")
            
            do {
                try resetFile(path: destination, with: generatedFile)
            } catch {
                print("Was unable to write \(name) to file location with error \(error.localizedDescription)")
            }
            
            guard let family = styleSet[membership] else {
                continue
            }
            
            let extensionFile = ExtensionGenerator(generator: .init(type: membership))
                .body(for: membership, from: family)
            let exFileName = "\(membership.association)+Extension.swift"
            let exDestination = URL(fileURLWithPath: output).appendingPathComponent(exFileName)

            do {
                try resetFile(path: exDestination, with: extensionFile)
            } catch {
                print("Was unable to write \(name) to file location with error \(error.localizedDescription)")
            }
        }
    }
    
    func resetFile(path: URL, with contents: String) throws {
        let filePath = path.absoluteString
    
        if FileManager.default.fileExists(atPath: filePath) {
            try FileManager.default.removeItem(atPath: filePath)
            FileManager.default.createFile(atPath: filePath, contents: nil)
        } else {
            FileManager.default.createFile(atPath: filePath, contents: nil)
        }
        
        try contents.write(to: path, atomically: true, encoding: .utf8)
    }
}

