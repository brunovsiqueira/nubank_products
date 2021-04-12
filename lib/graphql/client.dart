import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Client {
  static final HttpLink _httpLink = HttpLink(
    'https://staging-nu-needful-things.nubank.com.br/query',
  );

  static final AuthLink _authLink = AuthLink(
    getToken: () async => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhd2Vzb21lY3VzdG9tZXJAZ21haWwuY29tIn0.cGT2KqtmT8KNIJhyww3T8fAzUsCD5_vxuHl5WbXtp8c',

  );

  static final Link link = _authLink.concat(_httpLink);

  static ValueNotifier<GraphQLClient> graphqlClient = ValueNotifier(
    GraphQLClient(
      link: link,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

}


