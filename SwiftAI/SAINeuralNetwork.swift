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
    var perceptronLayers: [[SAIPerceptron]] = []
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
            
            self.perceptronLayers.append(layer)
        }
        
    }
    
    func computeResult() throws -> [Double] {
        do {
            var tempInput = self.input
            var tempResult = [Double]()
            for i in 0..<perceptronLayers.count {
                for perceptron in perceptronLayers[i] {
                    var perceptronInput = [Double]()
                    for i in perceptron.inputIndexes {
                        perceptronInput.append(tempInput[i])
                    }
                    let result = try perceptron.calculate(input: perceptronInput)
                    tempResult.append(result)
                }
                if i != perceptronLayers.count - 1 {
                    tempInput = tempResult
                    tempResult = []
                } else {
                    return tempResult
                }
            }
        } catch {
            throw NSError()
        }
        throw NSError()
    }
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
