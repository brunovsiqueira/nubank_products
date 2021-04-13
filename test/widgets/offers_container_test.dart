import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:mockito/mockito.dart';
import 'package:nubankproducts/models/offer.dart';
import 'package:nubankproducts/widgets/offers_container.dart';
import 'package:provider/provider.dart';

class GraphQLClientMock extends Mock implements GraphQLClient {}

//class ClientMock extends Mock implements Client {}

void main()  {
//  await initHiveForFlutter();
  group('Offers container test', () {

    List<Offer> offers = [];
    offers.add(Offer(id: "asdas", price: 1000, product: Product(id: "adsas", name: "Portal gun", description: "The Portal Gun is a gadget that allows the user(s) to travel between different universes/dimensions/realities.", image: "https://vignette.wikia.nocookie.net/rickandmorty/images/5/55/Portal_gun.png/revision/latest/scale-to-width-down/310?cb=20140509065310")));
    offers.add(Offer(id: "asdas", price: 2000, product: Product(id: "adsas", name: "Microverse Battery", description: "The Portal Gun is a gadget that allows the user(s) to travel between different universes/dimensions/realities.", image: "https://vignette.wikia.nocookie.net/rickandmorty/images/5/55/Portal_gun.png/revision/latest/scale-to-width-down/310?cb=20140509065310")));
    Widget createTestableWidget() {
      return MaterialApp(
          home: Scaffold(body: OffersContainer(offers))
      );
    }


    testWidgets('should show every product name', (tester) async {

      provideMockedNetworkImages(() async {
        var mock = createTestableWidget();

        await tester.pumpWidget(mock);

        verifyOffersProductsNames(offers, tester);
      });

    });


  });
}

verifyOffersProductsNames(List<Offer> offers, WidgetTester tester) {
  for (Offer offer in offers) {
    expect(find.text(offer.product.name), findsOneWidget);

  }
}
