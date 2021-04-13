import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nubankproducts/graphql/queries.dart';
import 'package:nubankproducts/models/customer.dart';
import 'package:nubankproducts/models/offer.dart';
import 'package:nubankproducts/widgets/balance_container.dart';
import 'package:nubankproducts/widgets/offers_container.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Query(
          options: QueryOptions(
            document: gql(Queries.customerQuery),
          ),
          builder: (QueryResult queryResult, { VoidCallback refetch, FetchMore fetchMore }) {
            if (queryResult.hasException) {
              return Text("Error loading balance.", style: TextStyle(fontSize: 22), key: Key("error"));
            }

            if (queryResult.isLoading) {
              return CircularProgressIndicator();
            }


            return BalanceContainer(Customer.fromJson(queryResult.data['viewer']));
          },
        ),
        Expanded(
          child: Query(
            options: QueryOptions(
              document: gql(Queries.offersQuery),
            ),
            builder: (QueryResult queryResult, { VoidCallback refetch, FetchMore fetchMore }) {
              if (queryResult.hasException) {
                return Text("Error loading offers.", style: TextStyle(fontSize: 22));
              }

              if (queryResult.isLoading) {
                return Text('Loading');
              }


              return OffersContainer((queryResult.data["viewer"]["offers"] as List)
                  .map((e) => Offer.fromJson(e))
                  .toList());
            },
          )
        )
      ],
    );
  }

}