class PlantModel {
  String img;
  String title;
  String dec;
  double price;

  PlantModel({
    required this.img,
    required this.title,
    required this.dec,
    required this.price,
  });

  PlantModel copyWith({
    String? img,
    String? title,
    String? dec,
    double? price,
  }) {
    return PlantModel(
      img: img ?? this.img,
      title: title ?? this.title,
      dec: dec ?? this.dec,
      price: price ?? this.price,
    );
  }
}
