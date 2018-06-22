import SwiftSoup

func parseCheatsheet(from html: String) -> [Icon] {
  var icons: [Icon] = []
  do {
    let doc: Document = try SwiftSoup.parse(html)
    let scripts = try doc.select("script")
    for script in scripts {
      // JSON objects in a script tag
    }
  } catch {
    print("error")
  }

  return []
}