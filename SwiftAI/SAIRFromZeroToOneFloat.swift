//
//  SAISubclasses.swift
//  SwiftAI
//
//  Created by Olexa Boyko on 2/11/17.
//  Copyright © 2017 Lviv National University. All rights reserved.
//

import Foundation


/// A double-precision, floating-point value type from segment [0,1].
public struct SAIRFromZeroToOneFloat {
    var value: Double {
        didSet{
            if value > 1 {
                value = 1
                return
            }
            if value < 0 {
                value = 0
                return
            }
        }
    }
    
    init(_ value: Double) {
        self.value = value
        
    }
}

extension SAIRFromZeroToOneFloat: Equatable {
    public static func ==(lhs: SAIRFromZeroToOneFloat, rhs: SAIRFromZeroToOneFloat) -> Bool {
        return lhs.value == rhs.value
    }
}

extension SAIRFromZeroToOneFloat: Comparable {
    public static func <(lhs: SAIRFromZeroToOneFloat, rhs: SAIRFromZeroToOneFloat) -> Bool {
        return lhs.value < rhs.value
    }
    
    public static func <=(lhs: SAIRFromZeroToOneFloat, rhs: SAIRFromZeroToOneFloat) -> Bool {
        return lhs.value <= rhs.value
    }
    
    public static func >=(lhs: SAIRFromZeroToOneFloat, rhs: SAIRFromZeroToOneFloat) -> Bool {
        return lhs.value >= rhs.value
    }
    
    public static func >(lhs: SAIRFromZeroToOneFloat, rhs: SAIRFromZeroToOneFloat) -> Bool {
        return lhs.value > rhs.value
    }
}

extension SAIRFromZeroToOneFloat: ExpressibleByIntegerLiteral {
    
    public typealias IntegerLiteralType = Int
    
    public init(integerLiteral value: SAIRFromZeroToOneFloat.IntegerLiteralType) {
        self.value = Double(value)
    }
}

extension SAIRFromZeroToOneFloat: SignedNumber {
    /// Returns the result of negating `x`.
    prefix public static func -(x: SAIRFromZeroToOneFloat) -> SAIRFromZeroToOneFloat {
        return SAIRFromZeroToOneFloat(x.value.negated())
    }
    
    /// Returns the difference between `lhs` and `rhs`.
    public static func -(lhs: SAIRFromZeroToOneFloat, rhs: SAIRFromZeroToOneFloat) -> SAIRFromZeroToOneFloat {
        return SAIRFromZeroToOneFloat(lhs.value-rhs.value >= 0 ? lhs.value-rhs.value : 0.0)
    }
}

extension SAIRFromZeroToOneFloat: AbsoluteValuable {
    public static func abs(_ x: SAIRFromZeroToOneFloat) -> SAIRFromZeroToOneFloat {
        return SAIRFromZeroToOneFloat(x.value < 0 ? x.value.negated() : x.value)
    }
}

extension SAIRFromZeroToOneFloat: Strideable {
    public typealias Stride = Double
    
    public func distance(to other: SAIRFromZeroToOneFloat) -> SAIRFromZeroToOneFloat.Stride {
        return abs(self - other)
    }
    
    /// Returns a `SAIRFromZeroToOneFloat` `x` such that `SAIRFromZeroToOneFloat.distance(to: x)` approximates `n`.
    ///
    /// If `Stride` conforms to `Integer`, then `SAIRFromZeroToOneFloat.distance(to: x) == n`.
    ///
    /// - Complexity: O(1).
    public func advanced(by n: SAIRFromZeroToOneFloat.Stride) -> SAIRFromZeroToOneFloat {
        return SAIRFromZeroToOneFloat(self.value + n)
    }
}

public func +(lhs: SAIRFromZeroToOneFloat, rhs: SAIRFromZeroToOneFloat) -> SAIRFromZeroToOneFloat {
    return SAIRFromZeroToOneFloat(lhs.value + rhs.value > 1 ? 1 : lhs.value + rhs.value)
}

//public func =<SAIRFromZeroToOneFloat, Double>

//extension SAIRFromZeroToOneFloat: FloatingPoint {
//        
//        /// A type that can represent any written exponent.
//        public typealias Exponent = Int
//
//    public init(sign: FloatingPointSign, exponent: SAIRFromZeroToOneFloat.Exponent, significand: SAIRFromZeroToOneFloat) {
//        
//    }
//    
//    public init(signOf: SAIRFromZeroToOneFloat, magnitudeOf: SAIRFromZeroToOneFloat) {
//        
//    }
//    
//    public init(_ value: UInt8) {
//        
//    }
//    
//    public init(_ value: Int8) {
//    
//        public init(_ value: UInt16)
//    
//        public init(_ value: Int16)
//    
//        public init(_ value: UInt32)
//
//        public init(_ value: Int32)
//    
//        public init(_ value: UInt64)
//    
//        public init(_ value: Int64)
//    
//        public init(_ value: UInt)
//    
//        public init(_ value: Int)
//    
//        public static var radix: Int { get }
//    
//        public static var nan: SAIRFromZeroToOneFloat { get }
//    
//        public static var signalingNaN: SAIRFromZeroToOneFloat { get }
//    
//        public static var infinity: SAIRFromZeroToOneFloat { get }
//
//        public static var greatestFiniteMagnitude: SAIRFromZeroToOneFloat { get }
//    
//        public static var pi: SAIRFromZeroToOneFloat { get }
//    
//        public var ulp: SAIRFromZeroToOneFloat { get }
//    
//        public static var ulpOfOne: SAIRFromZeroToOneFloat { get }
//    
//        public static var leastNormalMagnitude: SAIRFromZeroToOneFloat { get }
//    
//        public static var leastNonzeroMagnitude: SAIRFromZeroToOneFloat { get }
//
//        public var sign: FloatingPointSign { get }
//    
//        public var exponent: SAIRFromZeroToOneFloat.Exponent { get }
//    
//        public var significand: SAIRFromZeroToOneFloat { get }
//    
//        public func adding(_ other: SAIRFromZeroToOneFloat) -> SAIRFromZeroToOneFloat
//    
//        public mutating func add(_ other: SAIRFromZeroToOneFloat)
//    
//        public func negated() -> SAIRFromZeroToOneFloat
//    
//        public mutating func negate()
//    
//        public func subtracting(_ other: SAIRFromZeroToOneFloat) -> SAIRFromZeroToOneFloat
//    
//        public mutating func subtract(_ other: SAIRFromZeroToOneFloat)
//
//        public func multiplied(by other: SAIRFromZeroToOneFloat) -> SAIRFromZeroToOneFloat
//
//        public mutating func multiply(by other: SAIRFromZeroToOneFloat)
//    
//        public func divided(by other: SAIRFromZeroToOneFloat) -> SAIRFromZeroToOneFloat
//
//        public mutating func divide(by other: SAIRFromZeroToOneFloat)
//    
//        public func remainder(dividingBy other: SAIRFromZeroToOneFloat) -> SAIRFromZeroToOneFloat
//
//        public mutating func formRemainder(dividingBy other: SAIRFromZeroToOneFloat)
//    
//        public func truncatingRemainder(dividingBy other: SAIRFromZeroToOneFloat) -> SAIRFromZeroToOneFloat
//    
//        public mutating func formTruncatingRemainder(dividingBy other: SAIRFromZeroToOneFloat)
//
//        public func squareRoot() -> SAIRFromZeroToOneFloat
//    
//        public mutating func formSquareRoot()
//    
//        public func addingProduct(_ lhs: SAIRFromZeroToOneFloat, _ rhs: SAIRFromZeroToOneFloat) -> SAIRFromZeroToOneFloat
//
//        public mutating func addProduct(_ lhs: SAIRFromZeroToOneFloat, _ rhs: SAIRFromZeroToOneFloat)
//        
//        public static func minimum(_ x: SAIRFromZeroToOneFloat, _ y: SAIRFromZeroToOneFloat) -> SAIRFromZeroToOneFloat
//        
//        public static func maximum(_ x: SAIRFromZeroToOneFloat, _ y: SAIRFromZeroToOneFloat) -> SAIRFromZeroToOneFloat
//        
//        public static func minimumMagnitude(_ x: SAIRFromZeroToOneFloat, _ y: SAIRFromZeroToOneFloat) -> SAIRFromZeroToOneFloat
//        
//        public static func maximumMagnitude(_ x: SAIRFromZeroToOneFloat, _ y: SAIRFromZeroToOneFloat) -> SAIRFromZeroToOneFloat
//        
//        public func rounded(_ rule: FloatingPointRoundingRule) -> SAIRFromZeroToOneFloat
//        
//        public mutating func round(_ rule: FloatingPointRoundingRule)
//
//        public var nextUp: SAIRFromZeroToOneFloat { get }
//        
//        public var nextDown: SAIRFromZeroToOneFloat { get }
//        
//        public func isEqual(to other: SAIRFromZeroToOneFloat) -> Bool
//        
//        public func isLess(than other: SAIRFromZeroToOneFloat) -> Bool
//        
//        public func isLessThanOrEqualTo(_ other: SAIRFromZeroToOneFloat) -> Bool
//        
//        public func isTotallyOrdered(belowOrEqualTo other: SAIRFromZeroToOneFloat) -> Bool
//        
//        public var isNormal: Bool { get }
//        
//        public var isFinite: Bool { get }
//        
//        public var isZero: Bool { get }
//        
//        public var isSubnormal: Bool { get }
//        
//        public var isInfinite: Bool { get }
//        
//        var isNaN: Bool { get {
//                return SAIRFromZeroToOneFloat.value.isNaN
//            }
//        }
//        
//        public var isSignalingNaN: Bool { get }
//        
//        public var floatingPointClass: FloatingPointClassification { get }
//        
//        public var isCanonical: Bool { get }
//}



