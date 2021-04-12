class Queries {
  static String customerQuery = '''
    query customerQuery { 
      viewer {
        id
        name
        balance
      }
    }
    ''';
  static String offersQuery = '''
    query offersQuery {
      viewer {
          id
          offers {
            id
            price
            product {
              id
              name
              description
              image
            }
          }
        }
      }
    ''';

  static purchaseMutation(String id) {
    return """
      mutation {
        purchase (offerId: \"$id\") {
            success
            errorMessage
            customer {
                id
                name
                balance
            }
        }
      }
      """;
  }
}
