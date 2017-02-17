//
//  SAIPerceptron.swift
//  SwiftAI
//
//  Created by Olexa Boyko on 2/12/17.
//  Copyright © 2017 Lviv National University. All rights reserved.
//

import Foundation

open class SAIPerceptron {
    public final var delegates: [SAIPerceptronDelegate]
    public final var inputs: [Double]
    public final var transformingFunction: ((Double) -> Double)?
    
    
    
}

public protocol SAIPerceptronDelegate {
    func computationCompleted(result: Double)
}

open class SAIPerceptronInput {
    public final var weight: Double
    public final var owningPerceptron: SAIPerceptron?
    
}
