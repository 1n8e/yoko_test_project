class Active {
  final String activeName;
  final String image;
  final List<dynamic> dates;
  final List<Tariff> tariffs;

  Active({
    required this.activeName,
    required this.image,
    required this.dates,
    required this.tariffs,
  });

  factory Active.fromJson(Map<String, dynamic> json) {
    return Active(
      activeName: json['nameRu'] as String,
      image: json['imageUrl'] as String,
      dates: json['availableDates'] as List<dynamic>,
      tariffs: (json['tariffs'] as List<dynamic>)
          .map((e) => Tariff.fromJson(e))
          .toList(),
    );
  }
}

class Tariff {
  final String tariffName;
  final double price;
  final String date;

  Tariff({required this.tariffName, required this.price, required this.date});

  factory Tariff.fromJson(Map<String, dynamic> json) {
    return Tariff(
      tariffName: json['nameRu'] as String,
      price: json['priceInfo']['price'] as double,
      date: json['priceInfo']['date'] as String,
    );
  }
}
