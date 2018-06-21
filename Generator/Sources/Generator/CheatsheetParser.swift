import SwiftSoup

func parseCheatsheet(with category: String, html: String) -> [Icon] {
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