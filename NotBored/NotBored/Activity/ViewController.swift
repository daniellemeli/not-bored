//
//  ViewController.swift
//  NotBored
//
//  Created by Danielle Nozaki Ogawa on 06/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var numberOfParticipants: UILabel!
    @IBOutlet weak var activityType: UILabel!
    @IBOutlet weak var activityImage: UIImageView!
    
    let viewModel = ActivityViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        getActivity()
        
    }
    
    @IBAction func tryAnotherButtonAction(_ sender: Any) {
        viewModel.getAnotherActivity()
    }
    
}

extension ViewController: ActivityViewModelDelegate {
    func hideRandomInformations() {
        activityImage.isHidden = true
        activityType.isHidden = true
    }
    
    func getRandomActivity(title: String) {
        activityImage.isHidden = false
        activityType.isHidden = false
        activityType.text = title
    }
    
    func getActivity(){
        DispatchQueue.main.async {
            self.title = self.viewModel.getAtivityTitle()
            self.titleLabel.text = self.viewModel.getAtivityInformation()
            self.priceLabel.text = self.viewModel.getActivityPrice()
            self.numberOfParticipants.text = self.viewModel.getNumberOfParticipants()
            self.viewModel.getActivityType()
        }
    }
}
