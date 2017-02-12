//
//  SAIMccullochPittsPerceptron.swift
//  SwiftAI
//
//  Created by Olexa Boyko on 2/11/17.
//  Copyright © 2017 Lviv National University. All rights reserved.
//

import Foundation

open class SAIMccullochPittsPerceptron: SAIPerceptron {
    init(studyingCoefficient: SAIRFromZeroToOneFloat,
         inputWeights: Array<Double>,
         expectingResult: Double,
         activationFunc: @escaping (Double) -> Bool) {
        
        let actFunc: (Double) -> Double = { input in
            return activationFunc(input) ? 1.0 : 0.0
        }
        super.init(studyingCoefficient: studyingCoefficient,
                   inputWeights: inputWeights,
                   expectingResult: expectingResult,
                   activationFunc: actFunc)
    }
}
