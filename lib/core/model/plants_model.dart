class PlantModel {
  String img;
  String title;
  String dec;
  double price;
  int piece;

  PlantModel({
    required this.img,
    required this.title,
    required this.dec,
    required this.price,
    this.piece = 1,
  });

  PlantModel copyWith({
    String? img,
    String? title,
    String? dec,
    double? price,
    int? piece,
  }) {
    return PlantModel(
      img: img ?? this.img,
      title: title ?? this.title,
      dec: dec ?? this.dec,
      price: price ?? this.price,
      piece: piece ?? this.piece,
    );
  }
}
