//
//  SAINeuralNetwork.swift
//  SwiftAI
//
//  Created by Olexa Boyko on 2/14/17.
//  Copyright © 2017 Lviv National University. All rights reserved.
//

import Foundation

open class SAINeuralNetwork {
    var perceptrons: [SAIPerceptron] = []
    var studyingCoefficient: Double = 0.1
    var expectedResult: Double?
    
    init(perceptronsInputs: [SAIPerceptron], studyingCoefficient: Double, activationFunc: @escaping (Double) -> Double) {
        self.perceptrons = perceptronsInputs
        
        for perceptron in self.perceptrons {
            perceptron.activationFunc = activationFunc
            perceptron.studyingCoefficient = studyingCoefficient
        }
    }
}


