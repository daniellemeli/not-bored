//
//  InitialViewController.swift
//  NotBored
//
//  Created by Danielle Nozaki Ogawa on 06/09/22.
//

import UIKit

class InitialViewController: UIViewController {
    @IBOutlet weak var numbersOfParticipants: UITextField!
    
    let viewModel = InitialViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
    }

    @IBAction func startButtomTapped(_ sender: Any) {
        viewModel.getNumberOfParticipants(text: numbersOfParticipants.text)
    }
    
    @IBAction func termsButtomTapped(_ sender: Any) {
        let vc = TermsAndConditionsViewController(nibName: "TermsAndConditionsViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }

}

extension InitialViewController: InitialViewModelDelegate {
    func moveToActivitiesVC(numberOfParticipants: Int) {
        let vc = ActivitiesViewController(nibName: "ActivitiesViewController", bundle: nil)
        let nav = UINavigationController(rootViewController: vc)
        vc.viewModel.numberOfParticipants = Int(numberOfParticipants)
       // vc.numberOfParticipants = Int(numberOfParticipants)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
    }
    
    
}


