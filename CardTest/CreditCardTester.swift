//
//  CreditCardInfo.swift
//  CardTest


import Foundation

class CreditCardTester {
        
    var acceptedCardTypes: [String] = []
    
    init(cardTypes: [String]){
        acceptedCardTypes = cardTypes
    }
    
    // Will ensure that the card is a valid length for the card type. If the card
    // type isn't a member of the acceptedCardTypes array it will return false
    func isValidCardType(cardNumber: String) -> Bool{
        
        //AMEX -- starts with 34 or 37 -- must have length of 15 to be valid
        if((cardNumber.rangeOfString("^(34|37)", options: .RegularExpressionSearch)) != nil && acceptedCardTypes.contains("AMEX")){
            return 15 == cardNumber.characters.count
        }
        
        //MasterCard -- starts with 51 through 55 -- must have length of 16 to be valid
        if((cardNumber.rangeOfString("^(51|52|53|54|55)", options: .RegularExpressionSearch)) != nil && acceptedCardTypes.contains("MasterCard")){
            return 16 == cardNumber.characters.count
        }
        
        // VISA -- starts with 4 -- must have a length of 13 or 16 to be valid
        if((cardNumber.rangeOfString("^(4)", options: .RegularExpressionSearch)) != nil && acceptedCardTypes.contains("VISA")){
            return 16 == cardNumber.characters.count || 13 == cardNumber.characters.count
        }
        
        // Diners Club -- starts with 300-305, 36 or 38 -- must have a length of 14 to be valid
        if((cardNumber.rangeOfString("^(300|301|302|303|304|305|36|38)", options: .RegularExpressionSearch)) != nil && acceptedCardTypes.contains("DinersClub")){
            return 14 == cardNumber.characters.count
        }
        
        // Card type wasn't recognised, provided Unknown is in the CardTypes property, then
        // return true, otherwise return false.
        return acceptedCardTypes.contains("Unknown")
        
    }
    
    // Determines what type of credit card the given string represents based on what numbers it starts with
    func getCardType(cardNumber: String) -> String{
        return "AMEX"
    }
    
}