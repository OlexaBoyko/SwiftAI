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
        
        let perc = SAIPerceptron(studyingCoefficient: 0.05,
                                 inputSource: [SAIPerceptronInput(weight: 0.0, input: 1.0),
                                               SAIPerceptronInput(weight: 0.0, input: 0.0)],
                                 activationFunc: {return $0 >= 1.0 ? 1.0 : 0.0})
        let expected = 1.0
            
            var result = perc.calculate()
            
            while result != expected {
                result = perc.calculate()
                print(perc.inputSource.first?.weight as Any)
                perc.educate(expectingResult: 1.0)
                //print(perc.inputSource)
            }
            
            //            print(result)
            //            try perc.educate(withInput: [1.0, 0.0], expectingResult: 1.0)
            //            print(perc.inputWeights)
            
        
    }
    
    func testBackPropagationAlghorithm() {
        
        let perc11 = SAIPerceptronInput
        
        let network = SAINeuralNetwork(perceptrons: [SAIPerceptron()],
                                       studyingCoefficient: 0.3,
                                       transformingFunction: {1/(1 + exp(-$0))})
        if network == nil {
            XCTFail()
        }
        
        do {
            let value = try network?.
            //print(value?.first as Any)
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
