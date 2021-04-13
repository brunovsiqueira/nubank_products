import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nubankproducts/blocs/marketplace_bloc.dart';
import 'package:nubankproducts/models/customer.dart';
import 'package:nubankproducts/utils/functions.dart';
import 'package:provider/provider.dart';

class BalanceContainer extends StatelessWidget {

  Customer customer;

  BalanceContainer(this.customer);

  @override
  Widget build(BuildContext context) {

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