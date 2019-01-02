class AppState {

  final List<String> imagePaths;
  final bool isFetching;
  final Exception error;

  AppState({
    this.imagePaths = const[],
    this.isFetching = false,
    this.error});
}