//
//  ActivitiesViewController.swift
//  NotBored
//
//  Created by Danielle Nozaki Ogawa on 06/09/22.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    let viewModel = ActivitiesViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ActivityTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "shuffle.circle"), style: .plain, target: self, action: #selector(randomButtonTapped))
        
    }
    
    @objc func randomButtonTapped(){
        viewModel.getARandomActivity()
    }

}

extension ActivitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfActivities()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ActivityTableViewCell
        
        cell?.activityTitle.text = viewModel.getCellTitle(row: indexPath.row)
        
        return cell ?? UITableViewCell()
    }
}

extension ActivitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.getActivity(of: indexPath.row)
    }
}

extension ActivitiesViewController: ActivitiesViewModelDelegate {
    func goToViewController() {
        DispatchQueue.main.async {
            let vc = ViewController(nibName: "ViewController", bundle: nil)
            vc.viewModel.activity = self.viewModel.activitySelected
            vc.viewModel.isRandom = self.viewModel.isRandom
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
