//
//  FirstViewController.swift
//  LoveTest
//
//  Created by chang sic jung on 26/06/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

let currentDevice: UIDevice = {
    let dv = UIDevice.current
    dv.isProximityMonitoringEnabled = false
    return dv
}()

class FirstViewController: UIViewController {
    
    let firstLabel: UILabel = {
       let lb = UILabel()
        //lb.backgroundColor = .red
        //lb.font = UIFont.boldSystemFont(ofSize: 30)
        lb.font = UIFont(name: "Sunflower-Medium", size: 25)
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.alpha = 0
        lb.text =
        """
        고민을 생각하세요.
        """
        return lb
    }()
    let secondLabel: UILabel = {
        let lb = UILabel()
        //lb.backgroundColor = .red
        //lb.font = UIFont.boldSystemFont(ofSize: 30)
        lb.font = UIFont(name: "Sunflower-Medium", size: 25)
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.alpha = 0
        lb.text =
        """
        모두 생각 하셨나요?
        """
        return lb
    }()
    
    let yesButton: UIButton = {
        let bt = UIButton(type: .custom)
        bt.setTitle("네", for: .normal)
        bt.setImage(UIImage(named: "heart"), for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        bt.setTitleColor(.black, for: .normal)
        bt.alpha = 0
        bt.addTarget(self, action: #selector(yesButtonDidTapped(_:)), for: .touchUpInside)
        return bt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews([firstLabel, secondLabel, yesButton])
        setConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 1,
                       animations: {
                        self.firstLabel.alpha = 1
        })
        
        UIView.animate(withDuration: 1,
                       delay: 2,
                       options: .curveEaseIn,
                       animations: {
                        self.secondLabel.alpha = 1
        })
        
        self.yesButton.alpha = 1
//        UIView.animateKeyframes(withDuration: 1,
//                                delay: 4,
//                                options: .repeat,
//                                animations: {
//                                    UIView.addKeyframe(withRelativeStartTime: 0,
//                                                       relativeDuration: 0.2,
//                                                       animations: {
//                                                        self.yesButton.alpha = 1
//                                                        self.yesButton.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
//                                    })
//                                    UIView.addKeyframe(withRelativeStartTime: 0.2,
//                                                       relativeDuration: 0.8,
//                                                       animations: {
//                                                        self.yesButton.alpha = 0.5
//                                                        self.yesButton.transform = CGAffineTransform.identity
//                                    })
//        })
    }
    
    @objc func yesButtonDidTapped(_ sender: Any) {
        print("yesButtonDidTapped")
        currentDevice.isProximityMonitoringEnabled = true
        firstLabel.isHidden = true
        secondLabel.isHidden = true
        yesButton.isHidden = true
        
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    
    private func setConstraints(){
        firstLabel.layout.centerX().centerY(constant: -50)
        secondLabel.layout.centerX().top(equalTo: firstLabel.bottomAnchor, constant: 50)
        
        yesButton.layout.centerX().top(equalTo: secondLabel.bottomAnchor, constant: 20)
        yesButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        yesButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
    }
    
    @objc private func buttonDidTapped(_ sender: Any) {
        present(CustomSwipeDemoViewController(), animated: true)
    }

}
