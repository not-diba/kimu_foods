class RecipesSchema {
  static String getRecipesSchemaJSON = """ 
    query GetRecipes {
      getRecipes {
        id
        categoryName
        imageUrl
        recipeName
        amount
        ingredients {
          name
          quantity
        }
        instructions
      }
  }
  """;
}
