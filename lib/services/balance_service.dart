import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nubankproducts/graphql/client.dart';
import 'package:nubankproducts/graphql/queries.dart';

class CustomerService {

  Future<QueryResult> getCustomerBalance() async {

    final QueryOptions _options = QueryOptions(document: gql(Queries.customerQuery));

    return await Client.graphqlClient.value.query(_options);
  }
}