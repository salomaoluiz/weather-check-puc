import 'dart:async';

typedef Debounceable<S, T> = Future<S?> Function(T parameter);

Debounceable<S, T> debounce<S, T>(int timeMilliseconds, Debounceable<S?, T> function) {
  DebounceTimer? debounceTimer;

  return (T parameter) async {
    if (debounceTimer != null && !debounceTimer!.isCompleted) {
      debounceTimer!.cancel();
    }
    debounceTimer = DebounceTimer(debounceDuration: timeMilliseconds);
    try {
      await debounceTimer!.future;
    } catch (error) {
      if (error is _CancelException) {
        return null;
      }
      rethrow;
    }
    return function(parameter);
  };
}

class DebounceTimer {
  final int debounceDuration;

  DebounceTimer({required this.debounceDuration}) {
    _timer = Timer(Duration(milliseconds: debounceDuration), _onComplete);
  }

  late final Timer _timer;
  final Completer<void> _completer = Completer<void>();

  void _onComplete() {
    _completer.complete();
  }

  Future<void> get future => _completer.future;

  bool get isCompleted => _completer.isCompleted;

  void cancel() {
    _timer.cancel();
    _completer.completeError(const _CancelException());
  }
}

class _CancelException implements Exception {
  const _CancelException();
}
