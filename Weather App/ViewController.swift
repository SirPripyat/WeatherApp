//
//  ViewController.swift
//  Weather App
//
//  Created by Leonardo Rossi on 01/11/23.
//

import UIKit

class ViewController: UIViewController {
  
  private lazy var customView: UIView = {
    let view = UIView(frame: .zero)
    
    view.backgroundColor = .black
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
   
    setupView()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
  }
  
  private func setupView() {
    view.backgroundColor = .red
    
    customView.backgroundColor = .black
    customView.translatesAutoresizingMaskIntoConstraints = false
    
    setHierarchy()
    setConstraints()
  }
  
  private func setHierarchy() {
    view.addSubview(customView)
  }
  
  private func setConstraints() {
    NSLayoutConstraint.activate([
      customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
      customView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
      customView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
      customView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
    ])
  }
}
