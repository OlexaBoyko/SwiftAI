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
            if studyingCoefficient <= 0 {
                studyingCoefficient = Double.leastNormalMagnitude
                return
            }
        }
    }
    //public var inputWeights: Array<Double>
    //internal var delegates: Array<SAIPerceptronDelegate> = []
    public var activationFunc: (Double) -> Double
    public var inputSource: [SAIPerceptronInput] = []
    ///Get input from input source
    public var inputValues: [Double] {
        var result = [Double]()
        for inputEdge in self.inputSource {
            let input = inputEdge.input.output
            result.append(input)
        }
        return result
    }
    
    
    
    public init(studyingCoefficient: Double,
         inputSource: [SAIPerceptronInput],
         activationFunc: @escaping (Double) -> Double) {
        
        self.studyingCoefficient = studyingCoefficient
        self.inputSource = inputSource
        self.activationFunc = activationFunc
    }
    
    public func calculate() -> Double {
        var result = 0.0
        for edge in inputSource {
            result.add(edge.input.output*edge.weight)
        }
        
        let output = activationFunc(result)
        
        return output
    }
    
    public func educate(expectingResult d: Double) {
        let output = self.calculate()
        for edge in self.inputSource {
            edge.weight = edge.weight + self.studyingCoefficient * (d - output) * edge.input.output
        }
    }
}

extension SAIPerceptron: SAIOutputValue {
    public var output: Double{
        return self.calculate()
    }
}


public class SAIPerceptronInput {
    var weight: Double
    var input: SAIOutputValue
    
    init(weight: Double, input: SAIOutputValue) {
        self.weight = weight
        self.input = input
    }
}

public protocol SAIOutputValue {
    var output: Double {
        get
    }
}

