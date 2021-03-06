//
//  EateryViewController.swift
//  Eateries
//
//  Created by Александр Шишкин on 13/11/2016.
//  Copyright © 2016 Александр Шишкин. All rights reserved.
//

import UIKit

class EateryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!

    var restaurant: Restaurant?
    
    override func viewWillAppear(_ animated: Bool) {

        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 38
        tableView.rowHeight = UITableViewAutomaticDimension
        
        imageView.image = UIImage(named: restaurant!.image)
//        tableView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
//        tableView.separatorColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        title = restaurant!.name
        
       
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateryTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "Название:"
            cell.valueLabel.text = restaurant!.name
        case 1:
            cell.keyLabel.text = "Адрес:"
            cell.valueLabel.text = restaurant!.location
        case 2:
            cell.keyLabel.text = "Тип ресторана:"
            cell.valueLabel.text = restaurant!.type
        case 3:
            cell.keyLabel.text = "Я тут был?:"
            cell.valueLabel.text = (restaurant!.isVisited) ? "Да" : "Нет"
        default:
            break
        }
        
        cell.backgroundColor = UIColor.clear

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
