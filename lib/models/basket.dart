class BasketModel {
  final String imageUrl;
  final String recipeName;
  final String categoryName;
  final int serving;
  final double amount;

  BasketModel({
    required this.imageUrl,
    required this.recipeName,
    required this.categoryName,
    required this.serving,
    required this.amount,
  });
}