//
//  SAINeuralNetwork.swift
//  SwiftAI
//
//  Created by Olexa Boyko on 2/14/17.
//  Copyright © 2017 Lviv National University. All rights reserved.
//

import Foundation

open class SAINeuralNetwork {
    internal var results: [Double] = []
    var studyingCoefficient: Double = 0.1
    var expectedResult: Double?
    var transformingFunc: (Double) -> (Double)
    var delegate: SAINeuralNetworkDelegate?
    
    init(headingLayer: [SAIPerceptron],
        otherLayers: [[SAIPerceptron]],
        input: [Double],
        transformingFunc: (Double) -> Double = {1/(1 + exp(-$0))},
        studyingCoefficient: Double) {
        
        
        
    }
}

public protocol SAINeuralNetworkDelegate {
    func computationCompleted(result: [Double])
}
