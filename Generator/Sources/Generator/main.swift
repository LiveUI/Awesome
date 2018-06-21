import Foundation
import Alamofire

class Version {
  let styles: [String]
  let baseURL: String
  var icons: [Icon]

  init (baseURL: String, styles: [String]) {
    self.styles = styles
    self.baseURL = baseURL
    self.icons = []
  }
}

struct Icon {
  var category: String
  var charCode: String
  var name: String
}

let versions: [String: Version] = [
  "Awesome": Version(baseURL: "https://fontawesome.com/cheatsheet", styles: ["solid", "regular", "brands"]),
  "AwesomePro": Version(baseURL: "https://fontawesome.com/cheatsheet/pro", styles: ["solid", "regular", "light", "brands"]),
]

let group = DispatchGroup()
let queue = DispatchQueue(label: "RequestQueue", attributes: .concurrent)

for (name, options) in versions {
  for style in options.styles {
    group.enter()
    let url = "\(options.baseURL)#\(style)"
    Alamofire.request(url).responseString { response in
      guard response.error == nil else {
        print("Could not fetch data from \(url).")
        print(response.error!.localizedDescription)
        exit(EXIT_FAILURE)
      }

      guard response.response?.statusCode == 200 else {
        print("Could not fetch data from \(url). Received status code \(response.response!.statusCode)")
        exit(EXIT_FAILURE)
      }
      
      queue.async(flags: .barrier) {
        print(response.result.value!)
        exit(0)
        options.icons += parseCheatsheet(with: style, html: response.result.value!)

        group.leave()
      }
    }
  }
}

group.notify(queue: .main) {
  for (name, version) in versions {
    print(name)
    print(version.icons)
  }

  exit(EXIT_SUCCESS)
}

// We don't want the program to die before having finished all requests
RunLoop.main.run()
