class QrState {

  final String formButton;
  final String serializedProduct;

  QrState({this.formButton, this.serializedProduct});

  factory QrState.id() {
    return QrState(
        formButton: 'Id'
    );
  }

  factory QrState.name() {
    return QrState(
        formButton: 'Name'
    );
  }

  factory QrState.price() {
    return QrState(
      formButton: 'Price'
    );
  }

  factory QrState.qrCode(String serializedQrCode) {
    return QrState(
      formButton: 'Id',
      serializedProduct: serializedQrCode,
    );
  }
}