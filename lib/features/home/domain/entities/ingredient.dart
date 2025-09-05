class IngredientDetails {
  final String name;
  final String type;

  IngredientDetails({required this.name, required this.type});
}

class Ingredient {
  final double price;
  final int quantity;
  final String unit;
  final IngredientDetails ingredientDetails;

  Ingredient({
    required this.price,
    required this.quantity,
    required this.unit,
    required this.ingredientDetails,
  });
}
