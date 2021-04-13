//
//
//import 'package:flutter/cupertino.dart';
//import 'package:nubankproducts/models/customer.dart';
//import 'package:nubankproducts/models/offer.dart';
//import 'package:nubankproducts/services/offers_service.dart';
//
//class MarketplaceBloc extends ChangeNotifier {
//  List<Offer> offers = [];
//  bool offersError = false;
//  OffersService _offersService;
//  bool loadingOffers = true;
//
//  Customer customer;
//  bool customerError = false;
//  bool loadingCustomer = true;
//
//  bool isDisposed = false;
//
//  MarketplaceBloc(this._offersService);
//
//  fetchOffers() async {
//    var queryResult = await _offersService.getOffers();
//
//    if (queryResult.hasException) {
//      offersError = true;
//    } else {
//      offers = (queryResult.data["viewer"]["offers"] as List)
//          .map((e) => Offer.fromJson(e))
//          .toList();
//    }
//    loadingOffers = false;
//    notifyListeners();
//  }
//
//  fetchCustomer() async {
//    var queryResult = await _offersService.getCustomerBalance();
//
//    if (queryResult.hasException) {
//      customerError = true;
//    } else {
//      customer = Customer.fromJson(queryResult.data['viewer']);
//    }
//    loadingCustomer = false;
//    notifyListeners();
//  }
//
//  @override
//  void dispose() {
//    if (!isDisposed) {
//      super.dispose();
//    }
//  }
//
//  @override
//  void notifyListeners() {
//    if (!isDisposed) {
//      super.notifyListeners();
//    }
//
//  }
//}