//
//  Awesome+Image.swift
//  Awesome
//
//  Created by David Walter on 22.02.22.
//

#if canImport(SwiftUI)
import SwiftUI

extension Awesome {
    @available(iOS 13, macOS 11, watchOS 6, tvOS 13, *)
    /// A view wrapper around an Awesome.Icon
    public struct Image<Icon>: View where Icon: Amazing {
        @Environment(\.imageScale) var imageScale
        @Environment(\.font) var font
        
        var icon: Icon
        
        private var forcedSize: CGSize?
        private var color: Amazing.Color
        private var backgroundColor: Amazing.Color
        
        var size: CGSize {
            if let size = forcedSize {
                return size
            }
            
            let textStyle = self.font?.textStyle ?? .body
            let size = Amazing.Font.preferredFont(forTextStyle: textStyle).pointSize * imageScale.value
            return CGSize(width: size * 1.28571429, height: size)
        }
        
        public var body: some View {
            #if os(iOS) || os(watchOS) || os(tvOS)
            SwiftUI.Image(uiImage: icon.asImage(size: size, color: color, backgroundColor: backgroundColor))
            #elseif os(macOS)
            SwiftUI.Image(nsImage: icon.asImage(size: size, color: color, backgroundColor: backgroundColor))
            #endif
        }
        
        public init(icon: Icon) {
            self.icon = icon
            self.forcedSize = nil
            self.color = .black
            self.backgroundColor = .clear
        }
        
        /// Changes the size of the underlying image
        ///
        /// - Parameter size: The size to change to
        public func size(_ size: CGFloat) -> Self {
            var view = self
            view.forcedSize = CGSize(width: size, height: size)
            return view
        }
        
        /// Changes the size of the underlying image
        ///
        /// - Parameter size: The size to change to
        public func size(_ size: CGSize) -> Self {
            var view = self
            view.forcedSize = size
            return view
        }
        
        /// Changes the foreground color of the underlying image
        ///
        /// - Parameter color: The color
        public func foregroundColor(_ color: Amazing.Color) -> Self {
            var view = self
            view.color = color
            return view
        }
        
        /// Changes the background color of the underlying image
        ///
        /// - Parameter color: The background color
        public func backgroundColor(_ color: Amazing.Color) -> Self {
            var view = self
            view.backgroundColor = backgroundColor
            return view
        }
        
        @available(iOS 14, macOS 11, watchOS 7, tvOS 14, *)
        /// Changes the foreground color of the underlying image
        ///
        /// - Parameter color: The color
        public func foregroundColor(_ color: Color) -> Self {
            var view = self
            view.color = Amazing.Color(color)
            return view
        }
        
        @available(iOS 14, macOS 11, watchOS 7, tvOS 14, *)
        /// Changes the background color of the underlying image
        ///
        /// - Parameter color: The background color
        public func backgroundColor(_ color: Color) -> Self {
            var view = self
            view.backgroundColor = Amazing.Color(color)
            return view
        }
    }
}
#endif
