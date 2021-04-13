import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:nubankproducts/models/offer.dart';
import 'package:nubankproducts/widgets/balance_container.dart';
import 'package:nubankproducts/widgets/offer_item.dart';
import 'package:provider/provider.dart';

class OffersContainer extends StatelessWidget {
  List<Offer> offers;

  OffersContainer(this.offers);
  @override
  Widget build(BuildContext context) {

    return offers.length == 0
        ? Text("No offers available.", style: TextStyle(fontSize: 22))
        : Container(
          margin: EdgeInsets.all(10),
          child: ListView.builder(
          itemCount: offers.length,
          itemBuilder: (BuildContext context, int index) {
            return OfferItem(offers[index]);
          }),
        );


  }
}
