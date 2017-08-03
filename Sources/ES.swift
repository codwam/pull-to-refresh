//
//  ES.swift
//  ESPullToRefreshExample
//
//  Created by 木瓜 on 2017/4/25.
//  Copyright © 2017年 egg swift. All rights reserved.
//

import UIKit


public protocol ESExtensionsProvider: class {
    associatedtype CompatibleType
    var es: CompatibleType { get }
}

extension ESExtensionsProvider {
    /// A proxy which hosts reactive extensions for `self`.
    public var es: ES<Self> {
        return ES(self)
    }

}

public struct ES<Base> {
    public let base: Base
    
    // Construct a proxy.
    //
    // - parameters:
    //   - base: The object to be proxied.
    fileprivate init(_ base: Base) {
        self.base = base
    }
}

// 
extension UIScrollView: ESExtensionsProvider {}


// MARK: - Localized

func localizedString(_ key: String) -> String {
    if let path = Bundle(for: ESRefreshHeaderAnimator.self).resourcePath,
        let resourceBundle = Bundle(path: path + "/Localization.bundle") {
        return resourceBundle.localizedString(forKey: key, value: nil, table: "Localizable")
    }
    return key
}


