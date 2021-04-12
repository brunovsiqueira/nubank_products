import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nubankproducts/blocs/marketplace_bloc.dart';
import 'package:nubankproducts/graphql/queries.dart';
import 'package:nubankproducts/models/offer.dart';
import 'package:nubankproducts/widgets/balance_container.dart';
import 'package:nubankproducts/widgets/offer_item.dart';
import 'package:provider/provider.dart';

class OffersContainer extends StatefulWidget {
  @override
  _OffersContainerState createState() => _OffersContainerState();
}

class _OffersContainerState extends State<OffersContainer> {
  @override
  Widget build(BuildContext context) {
    MarketplaceBloc _offersBloc = Provider.of<MarketplaceBloc>(context);



    if(!_offersBloc.loadingOffers && !_offersBloc.offersError) {
      _offersBloc.fetchOffers();
    }

    if (_offersBloc.loadingOffers) {
      return Center(child: CircularProgressIndicator());
    }

    if (_offersBloc.offersError) {
      return Text("Error loading offers.",
          style: TextStyle(fontSize: 22));
    } else {
      var offers = _offersBloc.offers;
      return offers.length == 0
          ? Text("No offers available.", style: TextStyle(fontSize: 22))
          : ListView.builder(
          itemCount: offers.length,
          itemBuilder: (BuildContext context, int index) {
            return OfferItem(offers[index]);
          });
    }


  }
}
