class RecipesSchema {
  static String recipesSchemaJSON = """
    query {
      recipes {
        amount
        categoryName
        description
        duration
        id
        imageUrl
        ingredients {
          name
          quantity
        }
        instructions
        nutrition {
          nutritionItem
          quantity
        }
        people
        recipeName
      }
  }
  """;
}
