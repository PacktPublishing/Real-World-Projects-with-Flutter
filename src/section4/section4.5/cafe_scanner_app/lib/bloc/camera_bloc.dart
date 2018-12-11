import 'package:bloc/bloc.dart';
import 'package:cafe_scanner_app/bloc/camera_event.dart';
import 'package:cafe_scanner_app/bloc/camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  @override
  CameraState get initialState => CameraState.initial();

  @override
  Stream<CameraState> mapEventToState(CameraState state, CameraEvent event) async* {
    var productData = (event as CameraCapture).product;
    yield CameraState.display(productData);
  }

}