import Foundation
import Alamofire

struct Icon {
  var category: String
  var charCode: String
  var name: String
}

var icons: [Icon] = []

let endpoint = "https://fontawesome.com/cheatsheet"
Alamofire.request(endpoint).responseString { response in
  guard response.error == nil else {
    print("Could not fetch data from \(endpoint).")
    print(response.error!.localizedDescription)
    exit(EXIT_FAILURE)
  }

  guard response.response?.statusCode == 200 else {
    print("Could not fetch data from \(endpoint). Received status code \(response.response!.statusCode)")
    exit(EXIT_FAILURE)
  }
  
  icons += parseCheatsheet(from: response.result.value!)
  exit(EXIT_SUCCESS)
}

RunLoop.main.run()
