import 'package:coffee_selfie_app/api/storage.dart';
import 'package:coffee_selfie_app/redux/actions/actions.dart';
import 'package:coffee_selfie_app/redux/models/app_state.dart';
import 'package:coffee_selfie_app/widgets/camera.dart';
import 'package:redux/redux.dart';

void middleware(Store<AppState> store, action, NextDispatcher next) {

  if(action is LoadThumbsAction)
    Storage.getFilePaths().then((paths) {
      store.dispatch(LoadThumbsSucceededAction(paths));
    }).catchError((Exception error) {
      store.dispatch(LoadThumbsFailedAction(error));
    });
  else if(action is CaptureImageAction)
    CameraState.captureImage().then((path) {
      store.dispatch(CaptureImageSucceededAction(path));
    }).catchError((Exception error) {
      store.dispatch(CaptureImageFailedAction(error));
    });
  next(action);

}