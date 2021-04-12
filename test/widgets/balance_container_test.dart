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



     Widget createTestableWidget(MarketplaceBloc marketplaceBloc) {
       return MaterialApp(
         home: ChangeNotifierProvider(
             create: (_) => marketplaceBloc,
             child: BalanceContainer()
         ),
       );
     }


      testWidgets('should show name and correct balance when success', (tester) async {
        MarketplaceBloc marketplaceBloc =  MarketplaceBloc(OffersService());
        marketplaceBloc.customerError = false;
        marketplaceBloc.loadingCustomer = false;
        marketplaceBloc.customer = Customer(id: "asda", name: "Bruno Siqueira", balance: 100);
        var balanceMock1 = createTestableWidget(marketplaceBloc);

        await tester.pumpWidget(balanceMock1);

        expect(find.text("${Functions.getWelcomeMessage(TimeOfDay.now())}, ${marketplaceBloc.customer.name}"), findsOneWidget);
        var balanceFinder = find.byKey(Key("balance"));

        expect(balanceFinder, findsOneWidget);
        Text widget = tester.firstWidget(balanceFinder);
        expect(widget.data.contains("100"), true);
      });

     testWidgets('should show error message when error', (tester) async {
       await initHiveForFlutter();
       MarketplaceBloc marketplaceBloc =  MarketplaceBloc(OffersService());
       marketplaceBloc.customerError = true;
       marketplaceBloc.loadingCustomer = false;
       var balanceMock1 = createTestableWidget(marketplaceBloc);

       await tester.pumpWidget(balanceMock1);

       expect(find.byKey(Key("error")), findsOneWidget);
     });

//     testWidgets('should show CircularProgressIndicator before load', (tester) async {
//       MarketplaceBloc marketplaceBloc =  MarketplaceBloc(OffersService());
//       marketplaceBloc.customerError = false;
//       marketplaceBloc.loadingCustomer = true;
//       var balanceMock1 = createTestableWidget(marketplaceBloc);
//
//       await tester.pumpWidget(balanceMock1);
//
//       expect(find.byType(CircularProgressIndicator), findsOneWidget);
//     });


  });
}
