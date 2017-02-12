//
//  SAIPerceptron.swift
//  SwiftAI
//
//  Created by Olexa Boyko on 2/12/17.
//  Copyright © 2017 Lviv National University. All rights reserved.
//

import Foundation


open class SAIPerceptron {
    public var studyingCoefficient: Double {
        didSet{
            if studyingCoefficient > 1 {
                studyingCoefficient = 1
                return
            }
            if studyingCoefficient < 0 {
                studyingCoefficient = 0
                return
            }
        }
    }
    public var inputWeights: Array<Double>
    //var expectingResult: Double
    public var activationFunc: (Double) -> Double
    
    
    public init(studyingCoefficient: Double,
         inputWeights: Array<Double>,
         activationFunc: @escaping (Double) -> Double) {
        
        self.studyingCoefficient = studyingCoefficient
        self.inputWeights = inputWeights
        //self.expectingResult = expectingResult
        self.activationFunc = activationFunc
    }
    
    public func calculate(input: [Double]) throws -> Double {
        if input.count != inputWeights.count {
            throw NSError()
        }
        
        var result = 0.0
        for i in 0..<input.count {
            result.add(input[i]*self.inputWeights[i])
        }
        
        return activationFunc(result)
    }
    
    public func educate(withInput input: [Double], expectingResult: Double) throws {
        
        let d = expectingResult
        
        let output = try self.calculate(input: input)
        
        var result = [Double]()
        
        for i in 0..<input.count {
            result.append(self.inputWeights[i] + self.studyingCoefficient * (d - output) * input[i])
        }
        
        self.inputWeights = result
    }
    
    
    
    //TODO: educateHiddenPerceptron
    public func educateHiddenPerceptron() {
        
    }
}






