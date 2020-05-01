//
//  DynamicSize.swift
//  DynamicSize
//
//  Created by Siam Biswas on 19/8/19.
//  Copyright © 2019 Siam Biswas. All rights reserved.
//

import Foundation
import UIKit

internal protocol DynamicSizable{
    associatedtype D:BinaryFloatingPoint
    
    var percent:D { get }
    var current: D { get }
    var fraction: D { get }
    var hasRange: Bool { get }
    
}

internal enum DynamicSize<T:BinaryFloatingPoint>:DynamicSizable,CaseIterable{
    
    typealias D = T
    case max,min,mid
    
    var percent:T{
        switch self {
        case .min:
            return 80
        case .mid:
            return 90
        case .max:
            return 100
        }
    }
    
    
    var hasRange: Bool {
        
        let size = UIScreen.main.bounds.size
        let height = Swift.max(size.width, size.height)
        
        switch self {
        case .min:
            return height > 0 && height < 667
        case .mid:
            return height >= 667 && height < 736
        case .max:
            return height >= 736
        }
    }
    
    var fraction: T {
        return self.current / self.percent
    }
    
    var current: T {
        return DynamicSize.allCases.reduce(0) {  $1.hasRange ? $1.percent : $0}
    }
}



internal func Dynamic<T>(_ value:T, type:DynamicSize<T> = .max) -> T where T:BinaryFloatingPoint{
    return value * type.fraction
}


extension CGFloat{
    func dynamic(type: DynamicSize<CGFloat> = .max) -> CGFloat {
        return Dynamic(self, type: type)
    }
}

extension Int{
    func dynamic(type: DynamicSize<CGFloat> = .max) -> CGFloat {
        return CGFloat(self).dynamic(type: type)
    }
}

extension Double{
    func dynamic(type: DynamicSize<CGFloat> = .max) -> CGFloat {
        return CGFloat(self).dynamic(type: type)
    }
}
