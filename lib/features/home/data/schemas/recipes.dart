class RecipesSchema {
  static const String recipesSchemaJSON = r'''
    query Recipes($categoryName: String) {
      recipes(categoryName: $categoryName) {
        id
        image
        name
        categories {
          name
          id
        }
        createdAt
        createdBy
        duration
        ingredients {
          price
          quantity
          unit
          ingredient {
            name
            type
          }
        }
        instructions
        totalPrice
        updatedAt
      }
    }
  ''';
}
