class WeatherModel {
  WeatherModel(
      this.weather_status, this.des, this.temp, this.humidity, this.pressure);

  String weather_status = "";
  String des = "";
  num temp = 0;
  num pressure = 0;
  num humidity = 0;

  factory WeatherModel.fromJson(Map json) {
    return WeatherModel(
      json['weather'][0]['main'] ?? "Unknown",
      json['weather'][0]['description'] ?? "Unknown",
      json['main']['temp'] ?? "Unknown",
      json['main']['humidity'] ?? "Unknown",
      json['main']['pressure'] ?? "Unknown",
    );
  }
}
