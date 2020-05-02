//
//  Dynamikos.swift
//  Dynamikos
//
//  Copyright © 2019-2020 Siam Biswas. All rights reserved.
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


import Foundation
import UIKit


fileprivate typealias DC = DynamikosConfig

public class DynamikosConfig{
    
    fileprivate static let shared = DynamikosConfig()
    
    private init() {}
    
    fileprivate var min:CGFloat = 80
    fileprivate var mid:CGFloat = 90
    fileprivate var max:CGFloat = 100
    
    open class func set(max:CGFloat,mid:CGFloat,min:CGFloat){
        DC.shared.max = max
        DC.shared.mid = mid
        DC.shared.min = min
    }
}

fileprivate protocol Dynamikosable{
    associatedtype D:BinaryFloatingPoint
    
    var percent:D { get }
    var current: D { get }
    var fraction: D { get }
    var hasRange: Bool { get }
    
}

public enum Dynamikos<T:BinaryFloatingPoint>:Dynamikosable,CaseIterable{
    
    typealias D = T
    case max,min,mid
    
    fileprivate var percent:T{
        switch self {
        case .min:
            return T(DC.shared.min)
        case .mid:
            return T(DC.shared.mid)
        case .max:
            return T(DC.shared.max)
        }
    }
    
    
    fileprivate var hasRange: Bool {
        
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
    
    fileprivate var fraction: T {
        return self.current / self.percent
    }
    
    fileprivate var current: T {
        return Dynamikos.allCases.reduce(0) {  $1.hasRange ? $1.percent : $0}
    }
}



fileprivate func Dynamic<T>(_ value:T, type:Dynamikos<T> = .max) -> T where T:BinaryFloatingPoint{
    return value * type.fraction
}


extension CGFloat{
    public func dynamic(type: Dynamikos<CGFloat> = .max) -> CGFloat {
        return Dynamic(self, type: type)
    }
}

extension Int{
    public func dynamic(type: Dynamikos<CGFloat> = .max) -> CGFloat {
        return CGFloat(self).dynamic(type: type)
    }
}

extension Double{
    public func dynamic(type: Dynamikos<CGFloat> = .max) -> CGFloat {
        return CGFloat(self).dynamic(type: type)
    }
}
