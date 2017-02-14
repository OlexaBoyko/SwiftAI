//
//  SwiftAITests.swift
//  SwiftAITests
//
//  Created by Olexa Boyko on 2/11/17.
//  Copyright © 2017 Lviv National University. All rights reserved.
//

import XCTest
@testable import SwiftAI

class SwiftAITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOrFunction() {
        
        let inputWeights = [0.0, 0.0]
        
        let perc = SAIPerceptron(studyingCoefficient: 0.05,
                                 inputWeights: inputWeights,
                                 activationFunc: {return $0 >= 1.0 ? 1.0 : 0.0})
        
        do {
            let expected = 1.0
            
            var result = try perc.calculate(input: [1.0, 0.0])
            
            while result != expected {
                result = try perc.calculate(input: [1.0, 0.0])
                //print(result)
                try perc.educate(withInput: [1.0, 0.0], expectingResult: 1.0)
                //print(perc.inputWeights)
            }
            
            //            print(result)
            //            try perc.educate(withInput: [1.0, 0.0], expectingResult: 1.0)
            //            print(perc.inputWeights)
            
            
        } catch {
            XCTFail()
        }
        
    }
    
    func testBackPropagationAlghorithm() {
        let network = SAINeuralNetwork(input: [0.5, 1],
                                       layers: [[SAIPerceptronInfo(inputIndexes: [0, 1], weights: [0.5, 1]), SAIPerceptronInfo(inputIndexes: [0, 1], weights: [1, 0.5])],
                                                [SAIPerceptronInfo(inputIndexes: [0, 1], weights: [0.5, -0.5])]
                                        
            ],
                                       studyingCoefficient: 0.3,
                                       expectedResult: 0.7,
                                       transformingFunction: {1/(1 + exp(-$0))})
        if network == nil {
            XCTFail()
        }
        
        do {
            let value = try network?.computeResult()
            print(value?.first as Any)
        } catch {
            XCTFail()
        }
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
