import 'package:flutter/material.dart' show ValueNotifier;

class DerivedValueNotifier<T, R> extends ValueNotifier<R> {
  final ValueNotifier<T> _source;
  final R Function(T value) _transform;

  DerivedValueNotifier(this._source, this._transform)
    : super(_transform(_source.value)) {
    _source.addListener(_listener);
  }

  @override
  void dispose() {
    _source.removeListener(_listener);
    super.dispose();
  }

  void _listener() {
    final newValue = _transform(_source.value);
    if (newValue != value) {
      value = newValue;
    }
  }
}
