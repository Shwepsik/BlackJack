//
//  ViewController.swift
//  Kazinak
//
//  Created by Valerii on 20.11.2018.
//  Copyright © 2018 Valerii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let blackJackButton = UIButton()
    let blackJackLable = UILabel()
    var topImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createBlackJackButton()
        createBlackJackLabel()
        createTopImage()
    }
    
    func createTopImage() {
        let topImage = UIImage(named: "cards")
        topImageView.image = topImage
        topImageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 40)
        view.addSubview(topImageView)
        
    }
    
    func createBlackJackLabel() {
        blackJackLable.text = "Black Jack"
        blackJackLable.frame = CGRect(x: 45, y: 160, width: 100, height: 31)
        blackJackLable.textAlignment = .center
        view.addSubview(blackJackLable)
    }
    
    
    func createBlackJackButton() {
        let blackJackButtonImage = UIImage(named: "cards")
        blackJackButton.frame = CGRect(x: 50, y: 200, width: 100, height: 100)
        blackJackButton.setImage(blackJackButtonImage, for: .normal)
        blackJackButton.addTarget(self, action: #selector(goToBlackJack(send:)), for: .touchUpInside)
        view.addSubview(blackJackButton)
    }
    
    
    @objc func goToBlackJack(send : UIButton) {
        let view = storyboard?.instantiateViewController(withIdentifier: "BlackJackViewController")
            as! BlackJackViewController
        self.present(view,animated: true,completion: nil)
    }

}

