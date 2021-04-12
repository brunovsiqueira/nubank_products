import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nubankproducts/blocs/marketplace_bloc.dart';
import 'package:nubankproducts/utils/functions.dart';
import 'package:provider/provider.dart';

class BalanceContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    MarketplaceBloc _marketplaceBloc = Provider.of<MarketplaceBloc>(context);

    if(_marketplaceBloc.customer == null && !_marketplaceBloc.customerError) {
      _marketplaceBloc.fetchCustomer();
    }

    if (_marketplaceBloc.loadingCustomer) {
      return Center(child: CircularProgressIndicator());
    }

    if (_marketplaceBloc.customerError) {
      return Text("Error loading Customer Balance.",
          style: TextStyle(fontSize: 22),
          key: Key("error"));
    } else {
      var customer = _marketplaceBloc.customer;
      return Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("${Functions.getWelcomeMessage(TimeOfDay.now())}, ${customer.name}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400))
              ),
            ),
            Text("Your Balance: ${NumberFormat.currency().format(customer.balance)}", style: TextStyle(fontSize: 24), key: Key("balance")),
          ],
        ),
      );
    }
  }

}