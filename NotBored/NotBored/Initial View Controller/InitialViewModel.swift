//
//  InitialViewModel.swift
//  NotBored
//
//  Created by Danielle Nozaki Ogawa on 08/09/22.
//

import Foundation

protocol InitialViewModelDelegate {
    func moveToActivitiesVC(numberOfParticipants: Int)
}

class InitialViewModel {
    var delegate: InitialViewModelDelegate?
    
    private func validateTextfield(number: String?) -> Bool {
        if number != nil && number != ""{
            let regex = "[1-9]{1,}"
            let validateNumber = NSPredicate(format: "SELF MATCHES %@", regex)
            return validateNumber.evaluate(with: number)
        } else {
            return false
        }
    }
        
    
    func getNumberOfParticipants(text: String?){
        if validateTextfield(number: text) == true {
            if let number = text {
                let numberParticipants = Int(number) ?? 1
                delegate?.moveToActivitiesVC(numberOfParticipants: numberParticipants)
            }
        } else {
            print("não foi possivel ir para a proxima tela")
        }
        
    }
    
    
}
