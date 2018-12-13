import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cafe_scanner_app/bloc/qr_event.dart';
import 'package:cafe_scanner_app/bloc/qr_state.dart';
import 'package:cafe_scanner_app/model/Product.dart';

class QrBloc extends Bloc<QrEvent, QrState> {

  int _id;
  String _name;
  double _price;

  @override
  QrState get initialState => QrState.id();

  @override
  Stream<QrState> mapEventToState(QrState state, QrEvent event) async* {
    var formInput = state.formButton;
    switch(formInput) {
      case 'Id':
        _id = int.parse((event as FormQrEvent).productItem);
        yield QrState.name();
        break;
      case 'Name':
        _name = (event as FormQrEvent).productItem;
        yield QrState.price();
        break;
      case 'Price':
        _price = double.parse((event as FormQrEvent).productItem);
        yield QrState.id();
        var product = Product(_id, _name, _price);
        var serializedProduct = json.encode(product);
        yield QrState.qrCode(serializedProduct);
        break;
    }
  }

}