class LoadThumbsAction {}

class LoadThumbsSucceededAction {

  final List<String> paths;

  LoadThumbsSucceededAction(this.paths);
}

class LoadThumbsFailedAction {

  final Exception error;

  LoadThumbsFailedAction(this.error);
}

class CaptureImageAction {}

class CaptureImageSucceededAction {

  final String capturedPath;

  CaptureImageSucceededAction(this.capturedPath);
}

class CaptureImageFailedAction {

  final Exception error;

  CaptureImageFailedAction(this.error);
}
