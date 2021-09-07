import 'dart:async';

class SignInBloc {
  StreamController<bool> _isLoadingStream = StreamController<bool>();
  Stream<bool> get isLoading => _isLoadingStream.stream;

  void dispose() {
    _isLoadingStream.close();
  }

  void setIsLoadingStream(bool isLoading) => _isLoadingStream.add(isLoading);
}
