class RecipesSchema {
  static String recipesSchemaJSON = """
query Recipes {
  recipes {
    recipeName
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
    nutrition {
      nutritionItem
      quantity
    }
    instructions
  }
}
  """;
}
