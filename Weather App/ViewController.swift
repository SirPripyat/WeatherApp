import UIKit

class ViewController: UIViewController {
  
  private lazy var backgroundView: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    
    imageView.image = UIImage(named: "background")
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    return imageView
  }()
  
  private lazy var cityLabel: UILabel = {
    let cityLabel = UILabel()
    
    cityLabel.translatesAutoresizingMaskIntoConstraints = false
    
    cityLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    cityLabel.textColor = .primaryCustomColor
    cityLabel.textAlignment = .center
    
    return cityLabel
  }()
  
  private lazy var temperatureLabel: UILabel = {
    let temperatureLabel = UILabel()
    
    temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
    
    temperatureLabel.font = UIFont.systemFont(ofSize: 70, weight: .bold)
    temperatureLabel.textColor = .primaryCustomColor
    
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
  
  private lazy var temperatureAndWeatherIconStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [temperatureLabel, weatherIcon])
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    stackView.axis = .horizontal
    
    stackView.spacing = 24
    
    return stackView
  }()
  
  private lazy var headerStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [cityLabel, temperatureAndWeatherIconStackView])
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    stackView.axis = .vertical
    
    stackView.spacing = 12
    
    stackView.backgroundColor = .contrastColor
    
    stackView.layer.cornerRadius = 20
    
    stackView.isLayoutMarginsRelativeArrangement = true
    stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(
      top: 20, leading: 20, bottom: 20, trailing: 20
    )
    
    return stackView
  }()
  
  private lazy var humidityLabel: UILabel = {
    let label = UILabel()
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Umidade"
    label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
    label.textColor = .contrastColor
    
    return label
  }()
  
  private lazy var humidityValueLabel: UILabel = {
    let label = UILabel()
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
    label.textColor = .contrastColor
    
    return label
  }()
  
  private lazy var humidityStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [humidityLabel, humidityValueLabel])
    
    stackView.axis = .horizontal
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    stackView.spacing = 8
    
    return stackView
  }()
  
  private lazy var windLabel: UILabel = {
    let label = UILabel()
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Vento"
    label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
    label.textColor = .contrastColor
    
    return label
  }()
  
  private lazy var windValueLabel: UILabel = {
    let label = UILabel()
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
    label.textColor = .contrastColor
    
    return label
  }()
  
  private lazy var windStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [windLabel, windValueLabel])
    
    stackView.axis = .horizontal
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    stackView.spacing = 8
    
    return stackView
  }()
  
  private lazy var statsStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [humidityStackView, windStackView])
    
    stackView.axis = .vertical
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    stackView.layoutMargins = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    stackView.isLayoutMarginsRelativeArrangement = true
    
    stackView.spacing = 8
    
    stackView.layer.cornerRadius = 10
    
    stackView.backgroundColor = .translucentColor
    
    return stackView
  }()
  
  private lazy var hourlyForecastLabel: UILabel = {
    let label = UILabel()
    
    label.translatesAutoresizingMaskIntoConstraints = false
    
    label.text = "Previsão por hora".uppercased()
    label.textColor = .contrastColor
    label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
    
    return label
  }()
  
  private lazy var hourlyCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 72, height: 88)
    
    layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    collectionView.backgroundColor = .clear
    collectionView.dataSource = self
    collectionView.register(HourlyForecastCollectionViewCell.self, forCellWithReuseIdentifier: HourlyForecastCollectionViewCell.identifier)
    
    collectionView.showsHorizontalScrollIndicator = false
    
    return collectionView
  }()
  
  private lazy var dailyForecastLabel: UILabel = {
    let label = UILabel()
    
    label.translatesAutoresizingMaskIntoConstraints = false
    
    label.text = "Próximos dias".uppercased()
    label.textColor = .contrastColor
    label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
    
    return label
  }()
  
  private lazy var dailyForecastTableView: UITableView = {
    let tableView = UITableView()
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    tableView.dataSource = self
    
    tableView.register(DailyForecastTableViewCell.self, forCellReuseIdentifier: DailyForecastTableViewCell.identifier)
    
    tableView.backgroundColor = .clear
    
    tableView.showsVerticalScrollIndicator = false
    
    tableView.separatorColor = .contrastColor
    
    return tableView
  }()
  
  private let service = Service()
  
  private var city = City(latitude: "-23.4273", longitude: "-51.9375", cityName: "Maringá")
  
  private var forecastResponse: ForecastResponse?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    fetchWeatherData()
  }
  
  private func fetchWeatherData () {
    service.fetchWeatherData(city: city) { [weak self] response in
      self?.forecastResponse = response
      DispatchQueue.main.async {
        self?.loadWeatherData()
      }
    }
  }
  
  private func loadWeatherData() {
    cityLabel.text = city.cityName
    
    temperatureLabel.text = forecastResponse?.current.temp.toCelsius()
    
    humidityValueLabel.text = "\(forecastResponse?.current.humidity ?? 0) mm"
    
    windValueLabel.text = "\(forecastResponse?.current.windSpeed ?? 0) km/h"
    
    hourlyCollectionView.reloadData()
    
    dailyForecastTableView.reloadData()
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
    view.addSubview(headerStackView)
    view.addSubview(statsStackView)
    view.addSubview(hourlyForecastLabel)
    view.addSubview(hourlyCollectionView)
    view.addSubview(dailyForecastLabel)
    view.addSubview(dailyForecastTableView)
  }
  
  private func setConstraints() {
    backgroundViewConstraints()
    temperatureLabelConstraints()
    headerStackViewConstraints()
    statsStackViewConstraints()
    hourlyForecastLabelConstraints()
    hourlyCollectionViewConstraints()
    dailyForecastLabelConstraints()
    dailyForecastTableConstraints()
  }
  
  private func backgroundViewConstraints() {
    NSLayoutConstraint.activate([
      backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
      backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  private func temperatureLabelConstraints() {
    NSLayoutConstraint.activate([
      temperatureLabel.widthAnchor.constraint(equalToConstant: 168)
    ])
  }
  
  private func headerStackViewConstraints() {
    NSLayoutConstraint.activate([
      headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48),
      headerStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
    ])
  }
  
  private func statsStackViewConstraints() {
    NSLayoutConstraint.activate([
      statsStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 24),
      statsStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
    ])
  }
  
  private func hourlyForecastLabelConstraints() {
    NSLayoutConstraint.activate([
      hourlyForecastLabel.topAnchor.constraint(equalTo: statsStackView.bottomAnchor, constant: 24),
      hourlyForecastLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
  }
  
  private func hourlyCollectionViewConstraints() {
    NSLayoutConstraint.activate([
      hourlyCollectionView.topAnchor.constraint(equalTo: hourlyForecastLabel.bottomAnchor, constant: 20),
      hourlyCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      hourlyCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      hourlyCollectionView.heightAnchor.constraint(equalToConstant: 88)
    ])
  }
  
  private func dailyForecastLabelConstraints() {
    NSLayoutConstraint.activate([
      dailyForecastLabel.topAnchor.constraint(equalTo: hourlyCollectionView.bottomAnchor, constant: 24),
      dailyForecastLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
  }
  
  private func dailyForecastTableConstraints() {
    NSLayoutConstraint.activate([
      dailyForecastTableView.topAnchor.constraint(equalTo: dailyForecastLabel.bottomAnchor , constant: 16),
      dailyForecastTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      dailyForecastTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      dailyForecastTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
    ])
  }
}

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return forecastResponse?.hourly.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCollectionViewCell.identifier, for: indexPath) as? HourlyForecastCollectionViewCell else {
      return UICollectionViewCell()
    }
    
    let forecast = forecastResponse?.hourly[indexPath.row]
    
    let time = forecast?.dt.toHourFormat()
    
    let icon = UIImage(named: "sunIcon")
    
    let temperature = forecast?.temp.toCelsius()
    
    cell.loadWeatherData(time: time, icon: icon, temperature: temperature)
    
    return cell
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return forecastResponse?.daily.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: DailyForecastTableViewCell.identifier, for: indexPath) as? DailyForecastTableViewCell else {
      return UITableViewCell()
    }
    
    let forecast = forecastResponse?.daily[indexPath.row]
    
    let weekDay = forecast?.dt.toWeekdayName()
    
    let minTemp = forecast?.temp.min.toCelsius()
    
    let maxTemp = forecast?.temp.max.toCelsius()
    
    let icon = UIImage(named: "cloudIcon")
    
    cell.loadData(weekDay: weekDay, min: minTemp, max: maxTemp, icon: icon)
    
    return cell
  }
}
