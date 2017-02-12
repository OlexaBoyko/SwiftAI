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
                print(result)
                try perc.educate(withInput: [1.0, 0.0], expectingResult: 1.0)
                print(perc.inputWeights)
            }
            
            //            print(result)
            //            try perc.educate(withInput: [1.0, 0.0], expectingResult: 1.0)
            //            print(perc.inputWeights)
            
            
        } catch {
            XCTFail()
        }
        
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
