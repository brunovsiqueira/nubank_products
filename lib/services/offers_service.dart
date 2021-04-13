import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nubankproducts/graphql/client.dart';
import 'package:nubankproducts/graphql/queries.dart';

class OffersService {

  Future<QueryResult> purchaseOffer(String offerId) async {
    final MutationOptions _options = MutationOptions(
      document: gql(Queries.purchaseMutation(offerId)),
    );

    return await Client.graphqlClient.value.mutate(_options);
  }

//  Future<QueryResult> getOffers() async {
//
//    final QueryOptions _options = QueryOptions(
//    document: gql(Queries.offersQuery), // this is the query string you just created
//    );
//
//    return await Client.graphqlClient.value.query(_options);
//  }
//
//  Future<QueryResult> getCustomerBalance() async {
//    final QueryOptions _options = QueryOptions(document: gql(Queries.customerQuery));
//    return await Client.graphqlClient.value.query(_options);
//  }
}