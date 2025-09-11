// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pop_handler_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PopHandlerState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopHandlerState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PopHandlerState()';
}


}

/// @nodoc
class $PopHandlerStateCopyWith<$Res>  {
$PopHandlerStateCopyWith(PopHandlerState _, $Res Function(PopHandlerState) __);
}


/// Adds pattern-matching-related methods to [PopHandlerState].
extension PopHandlerStatePatterns on PopHandlerState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitialState value)?  initial,TResult Function( _PopRouteState value)?  popRoute,TResult Function( _KeepRoute value)?  keepRoute,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial(_that);case _PopRouteState() when popRoute != null:
return popRoute(_that);case _KeepRoute() when keepRoute != null:
return keepRoute(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitialState value)  initial,required TResult Function( _PopRouteState value)  popRoute,required TResult Function( _KeepRoute value)  keepRoute,}){
final _that = this;
switch (_that) {
case _InitialState():
return initial(_that);case _PopRouteState():
return popRoute(_that);case _KeepRoute():
return keepRoute(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitialState value)?  initial,TResult? Function( _PopRouteState value)?  popRoute,TResult? Function( _KeepRoute value)?  keepRoute,}){
final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial(_that);case _PopRouteState() when popRoute != null:
return popRoute(_that);case _KeepRoute() when keepRoute != null:
return keepRoute(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  popRoute,TResult Function()?  keepRoute,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial();case _PopRouteState() when popRoute != null:
return popRoute();case _KeepRoute() when keepRoute != null:
return keepRoute();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  popRoute,required TResult Function()  keepRoute,}) {final _that = this;
switch (_that) {
case _InitialState():
return initial();case _PopRouteState():
return popRoute();case _KeepRoute():
return keepRoute();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  popRoute,TResult? Function()?  keepRoute,}) {final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial();case _PopRouteState() when popRoute != null:
return popRoute();case _KeepRoute() when keepRoute != null:
return keepRoute();case _:
  return null;

}
}

}

/// @nodoc


class _InitialState implements PopHandlerState {
  const _InitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PopHandlerState.initial()';
}


}




/// @nodoc


class _PopRouteState implements PopHandlerState {
  const _PopRouteState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PopRouteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PopHandlerState.popRoute()';
}


}




/// @nodoc


class _KeepRoute implements PopHandlerState {
  const _KeepRoute();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KeepRoute);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PopHandlerState.keepRoute()';
}


}




// dart format on
