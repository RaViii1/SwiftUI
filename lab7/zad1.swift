//
//  ViewController.swift
//  lab6.1
//
//  Created by student on 18/04/2023.
//

import UIKit

struct Dom{
    var nazwa: String
    var powierzchnia : Float
    var pokoje : Int
    var dzialka : Float
    var pietra : Int
    var obraz : UIImage?
}

struct Mieszkanie{
    var nazwa: String
    var powierzchnia : Float
    var pokoje : Int
    var wieloPoziomowy : Bool
}
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    let domy : [Dom] = [ Dom(nazwa: "Dom 1", powierzchnia: 120, pokoje: 8, dzialka: 900, pietra: 2, obraz:  UIImage("dom1")),
                         Dom(nazwa: "Dom 3", powierzchnia: 200, pokoje: 10, dzialka: 1200, pietra: 3)
    ]
    
    let mieszkania : [Mieszkanie] = [ Mieszkanie(nazwa: "Mieszkanie 1", powierzchnia: 200, pokoje: 6,  wieloPoziomowy: true),
                                      Mieszkanie(nazwa: "Mieszkanie 2", powierzchnia: 150, pokoje: 4,  wieloPoziomowy: false)
    ]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if(indexPath.section == 0){
            cell.textLabel?.text = domy[indexPath.row].nazwa
            cell.textLabel?.text = mieszkania[indexPath.row].nazwa
        }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section){
        case 0:  return domy.count
        case 1: return mieszkania.count
        default: return 1
        }
    }
    
}


