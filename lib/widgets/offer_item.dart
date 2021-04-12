import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:nubankproducts/graphql/queries.dart';
import 'package:nubankproducts/models/offer.dart';
import 'package:nubankproducts/services/offers_service.dart';

class OfferItem extends StatefulWidget {
  Offer _offer;

  OfferItem(this._offer);

  @override
  _OfferItemState createState() => _OfferItemState();
}

class _OfferItemState extends State<OfferItem> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ExpansionTile(
        title: Row(
          children: [
            Flexible(
                flex: 4, child: Image.network(widget._offer.product.image)),
            Flexible(
                flex: 6,
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget._offer.product.name,
                          style: TextStyle(fontSize: 20)),
                      Text(
                          "${NumberFormat.currency().format(widget._offer.price)}",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                ))
          ],
        ),
        children: [
          Container(
              margin: EdgeInsets.all(10),
              child: Text(widget._offer.product.description,
                  style: TextStyle(fontSize: 18))),
          _isLoading
              ? CircularProgressIndicator(strokeWidth: 1)
              : SizedBox(
                  width: double.infinity,
                  child: Container(
                      height: 50,
                      padding: EdgeInsets.all(5),
                      child: FlatButton(
                          color: Colors.black,
                          child: FittedBox(
                              child: Text("Purchase",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () async {
                            OffersService offersService = OffersService();
                            try {
                              setState(() {
                                _isLoading = true;
                              });
                              QueryResult queryResult = await offersService
                                  .purchaseOffer(widget._offer.id);
                              setState(() {
                                _isLoading = false;
                              });

                              if (queryResult.data["purchase"]["success"]) {
                                return showResultDialog(true, context);
                              } else {
                                return showResultDialog(false, context,
                                    errorMessage: queryResult.data["purchase"]
                                        ["errorMessage"]);
                              }
                            } catch (e) {
                              return showResultDialog(false, context);
                            }
                          })),
                )
        ],
      ),
    );
  }

  showResultDialog(bool success, BuildContext context, {String errorMessage}) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
          context: context,
          builder: (BuildContext context) {
            // retorna um objeto do tipo Dialog
            return AlertDialog(
              title: success ? Text("Success") : Text("Error"),
              content: success
                  ? Text(
                      "You have purchased your ${widget._offer.product.name}")
                  : Text(errorMessage != null
                      ? errorMessage
                      : "Unable to purchase the ${widget._offer.product.name}"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ));
  }
}
