//
//  SAIPerceptron.swift
//  SwiftAI
//
//  Created by Olexa Boyko on 2/12/17.
//  Copyright © 2017 Lviv National University. All rights reserved.
//

import Foundation

open class SAIPerceptron: SAIOutputingInstance {
    
    ///All perceptron's output. 
    ///After computation result using tail alghorythm, perceptron calls computationCompleted for every delegate
    ///IMPORTANTLY!: If you want link Perceptrons, add fathers perceptron inputs to son's delegates
    public final var outputDelegates: [SAIPerceptronComputationDelegate] = []
    
    ///All perceptron's inputs with weight and input value
    internal final var inputs: [SAIPerceptronInput]
    
    ///Function which will transform the sum of son's results
    ///By default equals: {1/(1 + exp(-$0))}
    public final var transformingFunction: ((Double) -> Double)
    
    ///Inputs computed by perceptron sons.
    ///If computedInputs.count == inputs.count class will call delegates
    internal var computedInputs: [Double] = []
    
    ///Calculate result for all childrens(Perceptrons or Input)
    ///- SeeAlso: `SAIPerceptronInput`
    public var result: Double {
        var output = 0.0
        for input in inputs {
            output += input.result
        }
        return output
    }
    
    /*!
    * @discussion complete initializer
    * @param inputs
    * @param transformingFunction
    */
    public init(inputs: [SAIPerceptronInput] = [],
                transformingFunction: @escaping ((Double) -> Double) = {1/(1 + exp(-$0))},
                outputDelegates: [SAIPerceptronComputationDelegate] = []) {
        self.inputs = inputs
        self.transformingFunction = transformingFunction
        self.outputDelegates = outputDelegates
    }
    
    ///Call to link perceptrons
    public func addInput(_ input: SAIOutputingInstance, weight: Double) {
        self.inputs.append(SAIPerceptronInput(weight: weight, input: input))
    }
    
    ///Compute result using heading alghorithm
    public func compute() -> Double {
        
        var output = 0.0
        
        for input in inputs {
            output += input.result
        }
        
        return output
    }
}

extension SAIPerceptron: SAIPerceptronComputationDelegate{
    
    ///Called by SAIPerceptronInput.
    ///If computedInputs.count == inputs.count class will call delegates
    ///@param result
    public func computationCompleted(withResult result: Double) {
        self.computedInputs.append(result)
        if self.computedInputs.count == self.inputs.count {
            
            var output: Double = 0.0
            
            for value in self.computedInputs {
                output += value
            }
            
            output = self.transformingFunction(output)
            
            for delegate in self.outputDelegates {
                delegate.computationCompleted(withResult: output)
            }
        }
    }
}

public protocol SAIPerceptronComputationDelegate {
    func computationCompleted(withResult result: Double)
}

///Perceptron input. After computation calls PerceptronsMethod .inputComputed()
public final class SAIPerceptronInput: SAIOutputingInstance {
    public final var weight: Double
    ///
    public final weak var owningPerceptron: SAIPerceptron?
    public final var input: SAIOutputingInstance
    public var result: Double {
        return input.result*weight
    }
    
    init(weight: Double, input: SAIOutputingInstance) {
        self.weight = weight
        self.input = input
    }
}

extension SAIPerceptronInput: SAIPerceptronComputationDelegate {
    
    ///@param result Double which will be computed and transfered to perceptron
    public func computationCompleted(withResult result: Double) {
        self.owningPerceptron?.computationCompleted(withResult: self.weight*result)
    }
}

public protocol SAIOutputingInstance {
    var result: Double{
        get
    }
}
