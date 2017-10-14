//
//  PresentableSection.swift
//  LUIElements
//
//  Created by Ondrej Rafaj on 24/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation


public typealias PresentableSections = [PresentableSection]


public enum PresentableAnimation {
    case none
}

public protocol PresentableSectionMarker {
    var header: PresenterHeader? { get set }
    var footer: PresenterFooter? { get set }
    var presenters: [Presenter] { get set }
}

public typealias PresentableSectionMarkers = [PresentableSectionMarker]

public class PresentableSection: PresentableSectionMarker {
    
    var bindableHeader: Observable<PresenterHeader?> = Observable(nil)
    var bindableFooter: Observable<PresenterFooter?> = Observable(nil)
    var bindablePresenters: Observable<[Presenter]?> = Observable(nil)
    
    public var headerAnimation: PresentableAnimation = .none
    public var header: PresenterHeader? {
        get {
            return bindableHeader.value
        }
        set {
            bindableHeader.value = newValue
        }
    }
    
    public var footerAnimation: PresentableAnimation = .none
    public var footer: PresenterFooter? {
        get {
            return bindableFooter.value
        }
        set {
            bindableFooter.value = newValue
        }
    }
    
    public var presenterAnimation: PresentableAnimation = .none
    public var presenters: [Presenter] {
        get {
            return bindablePresenters.value ?? []
        }
        set {
            bindablePresenters.value = newValue
        }
    }
    
    // MARK: Initialization
    
    public init() {
        
    }
    
}

// MARK: - Section generators

public extension Array where Element == Presenter {
    
    public var section: PresentableSection {
        get {
            let section = PresentableSection()
            section.presenters = self
            return section
        }
    }
    
}

// MARK: - Dynamic helpers for PresentableSections

public extension Array where Element: PresentableSectionMarker {
    
    func presenter(forIndexPath indexPath: IndexPath) -> Presenter {
        let sections: PresentableSections = sectionsOrError()
        return sections[indexPath.section].presenters[indexPath.row]
    }

    func section(forIndexPath indexPath: IndexPath) -> PresentableSection {
        let sections: PresentableSections = sectionsOrError()
        return sections[indexPath.section]
    }
    
    func header(forIndexPath indexPath: IndexPath) -> PresenterHeader? {
        return header(forSection: indexPath.section)
    }
    
    func footer(forIndexPath indexPath: IndexPath) -> PresenterFooter? {
        return footer(forSection: indexPath.section)
    }
    
    func header(forSection section: Int) -> PresenterHeader? {
        let sections: PresentableSections = sectionsOrError()
        return sections[section].header
    }
    
    func footer(forSection section: Int) -> PresenterFooter? {
        let sections: PresentableSections = sectionsOrError()
        return sections[section].footer
    }
    
    // MARK: Private helpers
    
    private func sectionsOrError() -> PresentableSections {
        guard let sections = self as? PresentableSections else {
            fatalError("Object PresentableSection not present")
        }
        return sections
    }
    
}
