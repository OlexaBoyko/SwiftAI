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
    public var inputWeights: Array<Double>
    internal var delegates: Array<SAIPerceptronDelegate> = []
    public var activationFunc: (Double) -> Double
    public var inputIndexes: [Int] = []
    
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
        
        let output = activationFunc(result)
        
        callculationDidFinish(output: output)
        
        return output
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
    
    public func addDelegate(_ delegate: SAIPerceptronDelegate) {
        self.delegates.append(delegate)
    }
    
    internal func callculationDidFinish(output: Double) {
        for delegate in self.delegates {
            delegate.calculationFinished(output: output)
        }
    }
    
    //TODO: educateHiddenPerceptron
    public func educateHiddenPerceptron() {
        
    }
}

public protocol SAIPerceptronDelegate {
    func calculationFinished(output: Double)
}
