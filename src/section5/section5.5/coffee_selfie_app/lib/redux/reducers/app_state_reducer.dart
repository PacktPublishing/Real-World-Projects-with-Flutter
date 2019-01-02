import 'package:coffee_selfie_app/redux/models/app_state.dart';
import 'package:coffee_selfie_app/redux/actions/actions.dart';

AppState appStateReducer(AppState state, action) {
  if(action is LoadThumbsAction)
    return AppState(
      imagePaths: state.imagePaths,
      isFetching: true,
      error: null,
    );
  else if(action is LoadThumbsSucceededAction)
    return AppState(
      imagePaths: action.paths,
      isFetching: false,
      error: null,
    );
  else if(action is LoadThumbsFailedAction)
    return AppState(
      imagePaths: const [],
      isFetching: false,
      error: action.error,
    );
  else if(action is CaptureImageAction)
    return AppState(
      imagePaths: state.imagePaths,
      isFetching: true,
      error: null,
    );
  else if(action is CaptureImageSucceededAction)
    return AppState(
      imagePaths: List.from(state.imagePaths)..insert(0, action.capturedPath),
      isFetching: false,
      error: null,
    );
  else if(action is CaptureImageFailedAction)
    return AppState(
      imagePaths: const[],
      isFetching: false,
      error: action.error,
    );

  return state;
}
