import 'package:flutter/cupertino.dart';
import 'package:nubankproducts/widgets/balance_container.dart';
import 'package:nubankproducts/widgets/offers_container.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BalanceContainer(),
        Expanded(
          child: OffersContainer(),
        )
      ],
    );
  }

}