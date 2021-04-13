import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:nubankproducts/blocs/marketplace_bloc.dart';
import 'package:nubankproducts/graphql/client.dart';
import 'package:nubankproducts/models/customer.dart';
import 'package:nubankproducts/services/offers_service.dart';
import 'package:nubankproducts/utils/functions.dart';
import 'package:nubankproducts/widgets/balance_container.dart';
import 'package:provider/provider.dart';

class GraphQLClientMock extends Mock implements GraphQLClient {}

//class ClientMock extends Mock implements Client {}

void main()  {
//  await initHiveForFlutter();
  group('Balance container test', () {



     Widget createTestableWidget(Customer customer) {
       return MaterialApp(
         home: BalanceContainer(customer)
       );
     }


      testWidgets('should show name and correct balance', (tester) async {
        var balanceMock1 = createTestableWidget(Customer(id: "asda", name: "Bruno Siqueira", balance: 100));

        await tester.pumpWidget(balanceMock1);

        expect(find.text("${Functions.getWelcomeMessage(TimeOfDay.now())}, Bruno Siqueira"), findsOneWidget);
        var balanceFinder = find.byKey(Key("balance"));

        expect(balanceFinder, findsOneWidget);
        Text widget = tester.firstWidget(balanceFinder);
        expect(widget.data.contains("100"), true);
      });


  });
}
