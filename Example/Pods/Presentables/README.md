# Presentables

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/Presentables.svg?style=flat)](http://cocoapods.org/pods/Presentables)
[![License](https://img.shields.io/cocoapods/l/Presentables.svg?style=flat)](http://cocoapods.org/pods/Presentables)
[![Platform](https://img.shields.io/cocoapods/p/Presentables.svg?style=flat)](http://cocoapods.org/pods/Presentables)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

#### Cocoapods

Presentables is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Presentables"
```

#### Carthage

Presentables is also available through [Carthage](https://github.com/Carthage/Carthage). To install
it, simply add the following line to your Cartfile:
```ruby
github "manGoweb/Presentables"
```
## Usage

Create your cell (or header, implementation is pretty much the same)

```Swift
import UIKit
import Presentables


class MyCell: UITableViewCell, Presentable {

}

class MyCellPresenter: Presenter {

    var presentable: Presentable.Type = MyCell.self

    var configure: ((Presentable) -> ())?

}
```

Create a data manager

```Swift
class MyDataManagager: PresentableTableViewDataManager {

    // MARK: Initialization

    override init() {
        super.init()

        // Start a new section
        let section = PresentableSection()
        
        // Every section needs a header ... obviously
        let header = MyHeaderPresenter()
        header.configure = { presentable in
            guard let header = presentable as? MyHeader else {
                return
            }
            header.titleLabel.text = "My section"
        }

        section.header = header

        // Create some basic cells
        for i: Int in 1...5 {
            let presenter = MyCellPresenter()
            presenter.configure = { presentable in
                guard let cell = presentable as? MyCell else {
                    return
                }
                cell.textLabel?.text = "Cell number: \(i)"
            }
            section.presenters.append(presenter)
        }

        // Add section to the data set
        data.append(section)
    }

    // Override any delegate or datasource method you may want to
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

}
```

And lastly, bind your table view to your data manager

```Swift
import UIKit
import Presentables


class ViewController: UITableViewController {

    let dataController = MyDataManagager()


    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Presentables!"

        var dc: PresentableManager = dataController
        tableView.bind(withPresentableManager: &dc)
    }

}
```

And that's all folks!

## Author

Ondrej Rafaj, dev@mangoweb.cz

## License

Presentables is available under the MIT license. See the LICENSE file for more info.
