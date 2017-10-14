//
//  UITableView+Cells.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 05/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import UIKit


extension UITableView {
    
    open func register<T>(_ cellClass: T.Type) where T: UITableViewCell {
        register(cellClass, forCellReuseIdentifier: cellClass.identifier)
    }
    
    open func register<T>(_ viewClass: T.Type) where T: UITableViewHeaderFooterView {
        register(viewClass, forHeaderFooterViewReuseIdentifier: viewClass.identifier)
    }
    
    open func dequeueReusableCell<T>(withCellClass cellClass: T.Type) -> T? where T: UITableViewCell {
        let cell: T? = dequeueReusableCell(withIdentifier: cellClass.identifier) as? T
        return cell
    }
    
    open func dequeueReusableCell<T>(withCellClass cellClass: T.Type, for indexPath: IndexPath) -> T where T: UITableViewCell {
        let cell: T = dequeueReusableCell(withIdentifier: cellClass.identifier, for: indexPath) as! T
        return cell
    }
    
    public func dequeueReusableCell(withPresenter presenter: Presenter, for indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = presenter.presentable.identifier
        var presentable: Presentable? = dequeueReusableCell(withIdentifier: identifier) as? Presentable
        if presentable == nil {
            // TODO: Following needs to be made more type safe?
            register(presenter.presentable as! UITableViewCell.Type)
            presentable = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Presentable
        }
        presenter.configure?(presentable!)
        return presentable as! UITableViewCell
    }
    
    public func dequeueReusableHeaderFooter(withPresenter presenter: PresenterHeaderFooter?) -> UITableViewHeaderFooterView? {
        guard let presenter = presenter else {
            return nil
        }
        let identifier: String = presenter.presentable.identifier
        var presentable: Presentable? = dequeueReusableHeaderFooterView(withIdentifier: identifier) as? Presentable
        if presentable == nil {
            // TODO: Following needs to be made more type safe?
            register(presenter.presentable as! UITableViewHeaderFooterView.Type)
            presentable = dequeueReusableHeaderFooterView(withIdentifier: identifier) as? Presentable
            guard presentable != nil else {
                return nil
            }
        }
        presenter.configure?(presentable!)
        return presentable as? UITableViewHeaderFooterView
    }
    
}
