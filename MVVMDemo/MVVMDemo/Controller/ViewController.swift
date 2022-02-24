//
//  ViewController.swift
//  MVVMDemo
//
//  Created by SHUBHAM AGARWAL on 27/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = QuestionViewModel()
    var quesitions:DataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.apiToGetQuestionData { [weak self] in
            self?.quesitions = self?.viewModel.questionData
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quesitions?.data?.questions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = quesitions?.data?.questions?[indexPath.row].question
        return cell
    }
    
    
}
