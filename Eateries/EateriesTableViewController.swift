//
//  EateriesTableViewController.swift
//  Eateries
//
//  Created by Александр Шишкин on 02/11/2016.
//  Copyright © 2016 Александр Шишкин. All rights reserved.
//

import UIKit

class EateriesTableViewController: UITableViewController {
    
    var restaurants: [Restaurant] = [
        Restaurant(name: "Ogonёk Grill&Bar", type: "ресторан", location: "Уфа, проспект Хадии Давлетшиной 21, вход со стороны двора", image: "ogonek.jpg", isVisited: false),
        Restaurant(name: "Елу", type: "ресторан", location: "Уфа", image: "elu.jpg", isVisited: false),
        Restaurant(name: "Bonsai", type: "ресторан", location: "Уфа", image: "bonsai.jpg", isVisited: false),
        Restaurant(name: "Дастархан", type: "ресторан", location: "Уфа", image: "dastarhan.jpg", isVisited: false),
        Restaurant(name: "Индокитай", type: "ресторан", location: "Уфа", image: "indokitay.jpg", isVisited: false),
        Restaurant(name: "X.O", type: "ресторан-клуб", location: "Уфа", image: "x.o.jpg", isVisited: false),
        Restaurant(name: "Балкан Гриль", type: "ресторан", location: "Уфа", image: "balkan.jpg", isVisited: false),
        Restaurant(name: "Respublica", type: "ресторан", location: "Уфа", image: "respublika.jpg", isVisited: false),
        Restaurant(name: "Speak Easy", type: "ресторанный комплекс", location: "Уфа", image: "speakeasy.jpg", isVisited: false),
        Restaurant(name: "Morris Pub", type: "ресторан", location: "Уфа", image: "morris.jpg", isVisited: false),
        Restaurant(name: "Вкусные истории", type: "ресторан", location: "Уфа", image: "istorii.jpg", isVisited: false),
        Restaurant(name: "Классик", type: "ресторан", location: "Уфа", image: "klassik.jpg", isVisited: false),
        Restaurant(name: "Love&Life", type: "ресторан", location: "Уфа", image: "love.jpg", isVisited: false),
        Restaurant(name: "Шок", type: "ресторан", location: "Уфа", image: "shok.jpg", isVisited: false),
        Restaurant(name: "Бочка", type: "ресторан", location:  "Уфа", image: "bochka.jpg", isVisited: false)]

    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.hidesBarsOnSwipe = true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //чтобы пропала кнопка "Мои рестораны"
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
        
        tableView.estimatedRowHeight = 85
        tableView.rowHeight = UITableViewAutomaticDimension

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesTableViewCell


        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.thumbnailImageView.layer.cornerRadius = 32.5
        cell.thumbnailImageView.clipsToBounds = true
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        
        cell.accessoryType = self.restaurants[indexPath.row].isVisited ? .checkmark : .none
        
        return cell
    }

    
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let ac = UIAlertController(title: nil, message: "Выберете действие", preferredStyle: UIAlertControllerStyle.actionSheet)
//        let phoneNumber = UIAlertAction(title: "Наберите номер +7(916)111-111\(indexPath.row)", style: .default) { (action: UIAlertAction) -> Void in
//            
//            let phoneAlertController = UIAlertController(title:  "Номер не может быть набран", message: nil, preferredStyle: UIAlertControllerStyle.alert)
//            let cancelPhoneCall = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
//            
//            phoneAlertController.addAction(cancelPhoneCall)
//            self.present(phoneAlertController, animated: true, completion: nil)
//            
//            
//        }
//        
//        let isVisitedTitle = self.restaurantIsVisited[indexPath.row] ? "Я здесь не был!" : "Я здесь был!"
//        let isVisited = UIAlertAction(title: isVisitedTitle, style:
//            .default) { (UIAlertAction) in
//                let cell = tableView.cellForRow(at: indexPath)
//                
//              self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
//                cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none
//        }
//        
//        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
//            
//        }
//        
//        ac.addAction(isVisited)
//        ac.addAction(cancel)
//        ac.addAction(phoneNumber)
//        present(ac, animated: true, completion: nil)
//        
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//    }
//
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            self.restaurantNames.remove(at: indexPath.row)
//            self.restaurantImages.remove(at: indexPath.row)
//            self.restaurantIsVisited.remove(at: indexPath.row)
//        }
//        
//        tableView.deleteRows(at: [indexPath], with: .fade)
//     }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let share = UITableViewRowAction(style: .default, title: "Поделиться") { (UITableViewRowAction, indexPath) in
            let defaultName = "Я сейчас здесь " + self.restaurants[indexPath.row].name
            if let image = UIImage(named: self.restaurants[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems: [defaultName, image], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
            
        }
        
        let delete = UITableViewRowAction(style: .default, title: "Удалить") { (UITableViewRowAction, indexPath) in
            self.restaurants.remove(at: indexPath.row)
          
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        share.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        delete.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        
        return [delete, share]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
        if let indexPath = tableView.indexPathForSelectedRow {
            let dvc = segue.destination as! EateryViewController
            dvc.restaurant = self.restaurants[indexPath.row]
        }
        }
    }
    
    }
