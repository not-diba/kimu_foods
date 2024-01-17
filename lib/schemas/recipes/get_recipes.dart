class RecipesSchema {
  static String getRecipesJSON = """ 
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
