//
//  SAINeuralNetwork.swift
//  SwiftAI
//
//  Created by Olexa Boyko on 2/14/17.
//  Copyright © 2017 Lviv National University. All rights reserved.
//

import Foundation

class SAINeuralNetwork {
    var input: [Double]
    var perceptrons: [[SAIPerceptron]] = [[]]
    var studyingCoefficient: Double = 0.1
    var expectedResult: Double
    
    init?(input: [Double], layers: [[SAIPerceptronInfo]], studyingCoefficient: Double, expectedResult: Double, transformingFunction: ((Double) -> Double)?) {
        self.input = input
        self.studyingCoefficient = studyingCoefficient
        self.expectedResult = expectedResult
        
        for i in 0..<layers.count {
            var layer = [SAIPerceptron]()
            
            for perceptronInfo in layers[i] {
                
                guard let function = perceptronInfo.transformingFunction ?? transformingFunction
                else {
                    print("/nSwiftAI error: Transforming Function wasn't set correctly/n")
                    return nil
                }
                if i > 0 {
                    guard let max = perceptronInfo.inputIndexes.max(),
                        max < layers[i-1].count else {
                            print("/nSwiftAI error: Input indexes for \(i) layer was set incorrectly/n")
                            return nil
                    }
                }
                
                let perceptron = SAIPerceptron(studyingCoefficient: studyingCoefficient,
                                               inputWeights: perceptronInfo.weights,
                                               activationFunc: function)
                perceptron.inputIndexes.append(contentsOf: perceptronInfo.inputIndexes)
                layer.append(perceptron)
            }
            
            self.perceptrons.append(layer)
        }
        
    }
    
//    func computeResult() {
//        
//    }
    
}

public struct SAIPerceptronInfo {
    var inputIndexes: [Int]
    var weights: [Double]
    var transformingFunction: ((Double) -> Double)?
    
    init(inputIndexes: [Int], weights: [Double], transformingFunction: ((Double) -> Double)? = nil) {
        self.inputIndexes = inputIndexes
        self.weights = weights
        self.transformingFunction = transformingFunction
    }
}
