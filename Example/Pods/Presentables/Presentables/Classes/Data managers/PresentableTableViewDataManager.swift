//
//  PresentableTableViewDataManager.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 25/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation


open class PresentableTableViewDataManager: NSObject, PresentableManager, UITableViewDataSource, UITableViewDelegate {
    
    public var needsReloadData: (()->())?
    
    public typealias PresentableTableViewDataManagerActionInfo = (presenter: Presenter, indexPath: IndexPath, tableView: UITableView)
    
    open var didTapCell: ((_ info: PresentableTableViewDataManagerActionInfo)->())?
    open var didTapAccessoryButton: ((_ info: PresentableTableViewDataManagerActionInfo)->())?
    
    public var bindableData: Observable<PresentableSections> = Observable([])
    public var data: PresentableSections {
        get {
            return bindableData.value
        }
        set {
            
            bindableData.value = newValue
        }
    }
    
    public var tableView: UITableView?
    
    // MARK: Data source
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].presenters.count
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let presenter: Presenter = data.presenter(forIndexPath: indexPath)
        let presentable = tableView.dequeueReusableCell(withPresenter: presenter, for: indexPath)
        return presentable
    }
    
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let presenter: PresenterHeaderFooter? = data.header(forSection: section)
        let presentable = tableView.dequeueReusableHeaderFooter(withPresenter: presenter)
        return presentable
    }
    
    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let presenter: PresenterHeaderFooter? = data.footer(forSection: section)
        let presentable = tableView.dequeueReusableHeaderFooter(withPresenter: presenter)
        return presentable
    }
    
    // MARK: Delegate
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let presenter: Presenter = data.presenter(forIndexPath: indexPath)
        didTapCell?((presenter: presenter, indexPath: indexPath, tableView: tableView))
    }
    
    open func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let presenter: Presenter = data.presenter(forIndexPath: indexPath)
        didTapAccessoryButton?((presenter: presenter, indexPath: indexPath, tableView: tableView))
    }
    
}
