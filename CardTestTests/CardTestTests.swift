//
//  CardTestTests.swift
//  CardTestTests
//
//  Created by William Berger on 3/11/15.
//  Copyright (c) 2015 Timely Ltd. All rights reserved.
//

import UIKit
import XCTest

class CardTestTests: XCTestCase {
    
    //  Sample card numbers for use when testing
    //
    //  Amex, 378282246310005
    //  Amex, 371449635398431
    //  Amex, 378734493671000
    //  DinersClub, 30569309025904
    //  DinersClub, 38520000023237
    //  MasterCard, 5555555555554444
    //  MasterCard, 5105105105105100
    //  Visa, 4111111111111111
    //  Visa, 4012888888881881
    //  Visa, 4222222222222

    
    var allCardTypes: [String] = ["MasterCard", "VISA", "AMEX", "DinersClub"]
    var allCardTypesIncludingUnknown = ["MasterCard", "VISA", "AMEX", "DinersClub", "Unknown"];

    //Tests whether an amex number is correctly identified
    func test_amex_number_identified_as_amex() {
        let classUnderTest = CreditCardTester(cardTypes: allCardTypes)
        let result = classUnderTest.getCardType("378734493671000")
        XCTAssert(result == "AMEX", "378734493671000 is an AMEX card")
    }
    
    //Tests whether an invalid amex number is still correctly identified as amex
    func test_getCardType_ignores_card_validity() {
        let classUnderTest = CreditCardTester(cardTypes: [])
        let result = classUnderTest.getCardType("378734493671000")
        XCTAssert(result == "AMEX", "378734493671000 is an AMEX card")
    }    
    
    //Tests whether an invalid but recognised number is correctly determined to be invalid
    func test_isValidCardType_returns_false_when_number_is_recognised_but_not_valid() {
        let classUnderTest = CreditCardTester(cardTypes: allCardTypes)
        let result1 = classUnderTest.isValidCardType("34")
        let result2 = classUnderTest.isValidCardType("37873449367100")
        XCTAssert(!result1, "34 is not a vaild card")
        XCTAssert(!result2, "37873449367100 is not a vaild card")
    }
    
    func test_isValidCardType_returns_false_when_not_accepted_type_but_number_is_valid() {
        let classUnderTest = CreditCardTester(cardTypes: ["MasterCard"])
        let result = classUnderTest.isValidCardType("378734493671000")
        XCTAssert(!result, "378734493671000 is from a card type that is not accepted")
    }
    
    func test_isValidCardType_returns_true_when_unknown_card_and_unknown_is_an_accepted_type() {
        let classUnderTest = CreditCardTester(cardTypes: allCardTypesIncludingUnknown)
        let result = classUnderTest.isValidCardType("1726353515")
        XCTAssert(result, "1726353515 is valid as we accept unknown cards")
    }
    
        
}
