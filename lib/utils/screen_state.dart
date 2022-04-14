enum ScreenEvent { NONE, LOADING, SUCCESS, FAILED }

ScreenState<T> idle<T>({T? data}) =>
    ScreenState(event: ScreenEvent.NONE, data: data);

ScreenState loading() => ScreenState(event: ScreenEvent.LOADING);

ScreenState<T> success<T>(T data) =>
    ScreenState(event: ScreenEvent.SUCCESS, data: data);

ScreenState fail(String message) =>
    ScreenState(event: ScreenEvent.FAILED, message: message);

class ScreenState<T> {
  ScreenEvent event = ScreenEvent.NONE;
  T? data;
  String? message;

  ScreenState({required this.event, this.data, this.message});
}
