class Plant {
  final String title;
  final String image;
  final String description;
  int quantity;
  final double rating;
  final bool isFav;
  final String price;

  Plant({
    required this.title,
    required this.image,
    required this.description,
    required this.quantity,
    required this.rating,
    required this.isFav,
    required this.price,
  });

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
        title: json["title"],
        image: json["image"],
        description: json["description"],
        quantity: json["quantity"],
        rating: json["rating"],
        isFav: json["isFav"],
        price: json["price"],
      );
}
