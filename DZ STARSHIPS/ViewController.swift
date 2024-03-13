//
//  ViewController.swift
//  DZ STARSHIPS
//
//  Created by BK on 13.03.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let networkManager = Starships.shared
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Push Me", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var label1: UILabel = {
        let label1 = UILabel()
        label1.font = .systemFont(ofSize: 24)
        label1.textColor = .white
        label1.numberOfLines = 0
        return label1
    }()
    
    lazy var label2: UILabel = {
        let label2 = UILabel()
        label2.font = .systemFont(ofSize: 24)
        label2.textColor = .black
        label2.numberOfLines = 0
        return label2
    }()
    
    lazy var label3: UILabel = {
        let label3 = UILabel()
        label3.font = .systemFont(ofSize: 24)
        label3.textColor = .black
        label3.numberOfLines = 0
        return label3
    }()
    
    lazy var label4: UILabel = {
        let label4 = UILabel()
        label4.font = .systemFont(ofSize: 24)
        label4.textColor = .white
        label4.numberOfLines = 0
        return label4
    }()
    
    lazy var label5: UILabel = {
        let label5 = UILabel()
        label5.font = .systemFont(ofSize: 24)
        label5.textColor = .black
        label5.numberOfLines = 0
        return label5
    }()
    
    lazy var label6: UILabel = {
        let label6 = UILabel()
        label6.font = .systemFont(ofSize: 24)
        label6.textColor = .black
        label6.numberOfLines = 0
        return label6
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    private func setUI() {
        view.backgroundColor = .systemTeal
        view.addSubview(button)
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        view.addSubview(label6)
        setConstraints()
    }
    private func setConstraints() {
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        label1.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(12)
        }
        
        label2.snp.makeConstraints { make in
            make.top.equalTo(label1.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(12)
        }
        
        label3.snp.makeConstraints { make in
            make.top.equalTo(label2.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(12)
        }
        
        label4.snp.makeConstraints { make in
            make.top.equalTo(label3.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(12)
        }
        
        label5.snp.makeConstraints { make in
            make.top.equalTo(label4.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(12)
        }
        
        label6.snp.makeConstraints { make in
            make.top.equalTo(label5.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(12)
        }
    }
    
    @objc func buttonTapped() {
        print("Button was tapped")
        networkManager.getCharacters { starships in
            
                if let starships = starships {
                   
                    self.label1.text = starships.results[1].name
                    self.label2.text = starships.results[2].model
                    self.label3.text = starships.results[3].max_atmosphering_speed
                    
                    
                    self.label4.text = starships.results[4].name
                    self.label5.text = starships.results[5].model
                    self.label6.text = starships.results[6].max_atmosphering_speed
                    
                }
        }
    }
}
