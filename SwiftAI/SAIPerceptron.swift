//
//  SAIPerceptron.swift
//  SwiftAI
//
//  Created by Olexa Boyko on 2/12/17.
//  Copyright © 2017 Lviv National University. All rights reserved.
//

import Foundation

open class SAIPerceptron {
    var studyingCoefficient: SAIRFromZeroToOneFloat
    var inputWeights: Array<Double>
    var expectingResult: Double
    var activationFunc: (Double) -> Double
    
    
    init(studyingCoefficient: SAIRFromZeroToOneFloat,
         inputWeights: Array<Double>,
         expectingResult: Double,
         activationFunc: @escaping (Double) -> Double) {
        
        self.studyingCoefficient = studyingCoefficient
        self.inputWeights = inputWeights
        self.expectingResult = expectingResult
        self.activationFunc = activationFunc
    }
    
    func calculate(input: [Double]) throws -> Double {
        if input.count != inputWeights.count {
            throw NSError()
        }
        
        var result = 0.0
        for i in 0..<input.count {
            result.add(input[i]*self.inputWeights[i])
        }
        
        return activationFunc(result)
    }
    
    func educate(withInput input: [Double]) throws {
        
        let d = self.expectingResult
        
        let output = try self.calculate(input: input)
        
        var result = [Double]()
        
        for i in 0..<input.count {
            result.append(self.inputWeights[i] + self.studyingCoefficient.value * (d - output) * input[i])
        }
        
        self.inputWeights = result
    }
    
    //TODO: educateHiddenPerceptron
    func educateHiddenPerceptron() {
        
    }
}






