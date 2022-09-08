//
//  ActivityViewModel.swift
//  NotBored
//
//  Created by Danielle Nozaki Ogawa on 08/09/22.
//

import Foundation
protocol ActivityViewModelDelegate {
    func getActivity()
    func getRandomActivity(title: String)
    func hideRandomInformations()
}


class ActivityViewModel {
    var delegate: ActivityViewModelDelegate?
    private let service = Service()
    var activity: Activity?
    var isRandom: Bool?
    
    
    func getAtivityTitle() -> String {
        if isRandom == true {
            return "Random"
        } else {
            return activity?.type ?? ""
        }
    }
    
    func getAtivityInformation() -> String {
        activity?.activity ?? ""
    }
    
    func getActivityPrice() -> String {
        guard let price = activity?.price else { return "" }
        
        switch price {
        case 0:
            return "Free"
        case 0.1 ... 0.3:
            return "Low"
        case 0.4 ... 0.6:
            return "Medium"
        case 0.6... :
            return "High"
        default:
            return ""
        }
    }
    
    func getNumberOfParticipants() -> String {
        guard let number = activity?.participants else { return "" }
        return String(number)
    }
    
    func getAnotherActivity(){
        guard let numberOfParticipants = activity?.participants, let activity = activity?.type else { return }
        if isRandom == true {
            service.loadRandomActivity(participants: numberOfParticipants) { activityApi in
                self.activity = activityApi
                self.delegate?.getActivity()
            }
        } else {
            service.loadActivity(participants: numberOfParticipants, activity: activity) { activityApi in
                self.activity = activityApi
                self.delegate?.getActivity()
            }
        }
    }
    
    func getActivityType() {
        if isRandom == true {
            if let type = activity?.type {
                delegate?.getRandomActivity(title: type)
            }
        } else {
            delegate?.hideRandomInformations()
        }
    }
}
