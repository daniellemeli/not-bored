//
//  ActivitiesViewModel.swift
//  NotBored
//
//  Created by Danielle Nozaki Ogawa on 08/09/22.
//

import Foundation

protocol ActivitiesViewModelDelegate {
    func goToViewController()
}

class ActivitiesViewModel {
    var delegate: ActivitiesViewModelDelegate?
    
    private let activities = ["education", "recreational", "social", "diy", "charity", "cooking", "relaxation", "music", "busywork"]
    
    private let service = Service()
    
    var numberOfParticipants: Int?
    var activitySelected: Activity?
    var isRandom = false
    
    func getARandomActivity(){
        if let numberOfParticipants = numberOfParticipants {
            service.loadRandomActivity(participants: numberOfParticipants) { activityApi in
                self.activitySelected = activityApi
                self.delegate?.goToViewController()
                self.isRandom = true
            }
        }
    }
    
    func getActivity(of row: Int){
        if let numberOfParticipants = numberOfParticipants {
            service.loadActivity(participants: numberOfParticipants, activity: activities[row]) { activityApi in
                self.activitySelected = activityApi
                self.isRandom = false
                self.delegate?.goToViewController()
            }
        }
    }
    
    func getNumberOfActivities() -> Int {
        activities.count
    }
    
    func getCellTitle(row: Int) -> String {
        activities[row]
    }
    
    
}
