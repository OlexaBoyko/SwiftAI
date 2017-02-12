//
//  SAIMccullochPittsPerceptron.swift
//  SwiftAI
//
//  Created by Olexa Boyko on 2/11/17.
//  Copyright © 2017 Lviv National University. All rights reserved.
//

import Foundation

open class SAIMccullochPittsPerceptron {
    
}

open class SAIPerceptron {
    var studyingCoefficient: SAIRFromZeroToOneFloat
    var inputWeights: Array<Double>
    var expectingResult: Double
    //TODO: finish activationFunc
    //var activationFunc: (Array<Double>) -> (Array<Double>)
    
    
    init() {
        self.studyingCoefficient = 0
        self.inputWeights = []
        self.expectingResult = 0
    }
    
    func calculate(input: [Double]) throws -> Double {
        if input.count != inputWeights.count {
            throw NSError()
        }
        
        var result = 0.0
        for i in 0..<input.count {
            result.add(input[i]*self.inputWeights[i])
        }
        
        return result
    }
    
    func educate(withInput input: [Double]) throws {
        
        let d = self.expectingResult
        
        let output = try self.calculate(input: input)
        
        var result = [Double]()
        
        for i in 0..<input.count {
            let deltaWeight = self.studyingCoefficient.value * (d - output) * input[i]
            result.append(self.inputWeights[i] + deltaWeight)
        }
        
        self.inputWeights = result
    }
    
}
