class Menu {
  final int id;
  final String title;
  final String imagePath; // external URL
  final double price;
  final String category;
  final bool isBestSeller;

  Menu({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.isBestSeller,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json['id'] as int,
      title: json['title'] as String,
      imagePath: json['imagePath'] as String, // URL dari API
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String? ?? '',
      isBestSeller: (json['isBestSeller'] ?? false) as bool,
    );
  }
}
