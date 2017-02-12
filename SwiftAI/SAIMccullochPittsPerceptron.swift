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
    var expectingResult: Array<Double>
    ///TODO: finish activationFunc
    //var activationFunc: (Array<Double>) -> (Array<Double>)
    
    
    init() {
        self.studyingCoefficient = 0
        self.inputWeights = []
        self.expectingResult = []
    }
    
    func calculate(input: [Double]) throws -> [Double] {
        if input.count != inputWeights.count {
            throw NSError()
        }
        
        var result = [Double]()
        for i in 0..<input.count {
            result.append(input[i]*self.inputWeights[i])
        }
        
        return result
    }
    
    func educate(withInput input: [Double]) throws {
        
        let d = self.expectingResult
        
        let output = try self.calculate(input: input)
        
        var result = [Double]()
        
        for i in 0..<output.count {
            let deltaWeight = self.studyingCoefficient.value * (d[i] - output[i]) * input[i]
            result.append(self.inputWeights[i] + deltaWeight)
        }
        
        self.inputWeights = result
    }
    
}
