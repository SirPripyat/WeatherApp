import UIKit
import Inject

class ViewController: UIViewController {
  
  private lazy var backgroundView: _InjectableViewHost<UIImageView> = {
    let imageView = UIImageView(frame: .zero)
    
    let injectableView = Inject.ViewHost(imageView)
    
    injectableView.image = UIImage(named: "background")
    injectableView.contentMode = .scaleAspectFill
    injectableView.translatesAutoresizingMaskIntoConstraints = false
    
    return injectableView
  }()
  
  private lazy var headerView: UIView = {
    let headerView = UIView(frame: .zero)
    
    headerView.translatesAutoresizingMaskIntoConstraints = false
    headerView.backgroundColor = .white
    headerView.layer.cornerRadius = 20
    
    return headerView
  }()
  
  private lazy var cityLabel: UILabel = {
    let cityLabel = UILabel()
    
    cityLabel.translatesAutoresizingMaskIntoConstraints = false
    
    cityLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    cityLabel.textColor = UIColor(named: "primaryCustomColor")
    cityLabel.text = "São Paulo"
    
    cityLabel.textAlignment = .center
    
    return cityLabel
  }()
  
  private lazy var temperatureLabel: UILabel = {
    let temperatureLabel = UILabel()
    
    temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
    
    temperatureLabel.font = UIFont.systemFont(ofSize: 70, weight: .bold)
    temperatureLabel.textColor = UIColor(named: "primaryCustomColor")
    temperatureLabel.text = "30°C"
    
    temperatureLabel.textAlignment = .left
    
    return temperatureLabel
  }()
  
  private lazy var weatherIcon: UIImageView = {
    let weatherIcon = UIImageView()
    
    weatherIcon.translatesAutoresizingMaskIntoConstraints = false
    
    weatherIcon.image = UIImage(named: "sunIcon")
    
    weatherIcon.contentMode = .scaleAspectFit
    
    return weatherIcon
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
    setHierarchy()
    setConstraints()
  }
  
  private func setHierarchy() {
    view.addSubview(backgroundView)
    
    view.addSubview(headerView)
    headerView.addSubview(cityLabel)
    headerView.addSubview(temperatureLabel)
    headerView.addSubview(weatherIcon)
  }
  
  private func setConstraints() {
    backgroundViewConstraints()
    headerViewConstraints()
    cityLabelConstraints()
    temperatureLabelConstraints()
    weatherIconConstraints()
  }
  
  private func backgroundViewConstraints() {
    NSLayoutConstraint.activate([
      backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
      backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  private func headerViewConstraints() {
    NSLayoutConstraint.activate([
      headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
      headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
      headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
      headerView.heightAnchor.constraint(equalToConstant: 168)
    ])
  }
  
  private func cityLabelConstraints() {
    NSLayoutConstraint.activate([
      cityLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 16),
      cityLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
      cityLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16)
    ])
  }
  
  private func temperatureLabelConstraints() {
    NSLayoutConstraint.activate([
      temperatureLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
      temperatureLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16)
    ])
  }
  
  private func weatherIconConstraints() {
    NSLayoutConstraint.activate([
      weatherIcon.widthAnchor.constraint(equalToConstant: 86),
      weatherIcon.heightAnchor.constraint(equalToConstant: 86),
      weatherIcon.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
      weatherIcon.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16)
    ])
  }
}
