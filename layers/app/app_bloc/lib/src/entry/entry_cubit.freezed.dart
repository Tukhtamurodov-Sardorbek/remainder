// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EntryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EntryState()';
}


}

/// @nodoc
class $EntryStateCopyWith<$Res>  {
$EntryStateCopyWith(EntryState _, $Res Function(EntryState) __);
}


/// Adds pattern-matching-related methods to [EntryState].
extension EntryStatePatterns on EntryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitialState value)?  initial,TResult Function( _NotIntroducedState value)?  notIntroduced,TResult Function( _IntroducedState value)?  introduced,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial(_that);case _NotIntroducedState() when notIntroduced != null:
return notIntroduced(_that);case _IntroducedState() when introduced != null:
return introduced(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitialState value)  initial,required TResult Function( _NotIntroducedState value)  notIntroduced,required TResult Function( _IntroducedState value)  introduced,}){
final _that = this;
switch (_that) {
case _InitialState():
return initial(_that);case _NotIntroducedState():
return notIntroduced(_that);case _IntroducedState():
return introduced(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitialState value)?  initial,TResult? Function( _NotIntroducedState value)?  notIntroduced,TResult? Function( _IntroducedState value)?  introduced,}){
final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial(_that);case _NotIntroducedState() when notIntroduced != null:
return notIntroduced(_that);case _IntroducedState() when introduced != null:
return introduced(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  notIntroduced,TResult Function()?  introduced,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial();case _NotIntroducedState() when notIntroduced != null:
return notIntroduced();case _IntroducedState() when introduced != null:
return introduced();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  notIntroduced,required TResult Function()  introduced,}) {final _that = this;
switch (_that) {
case _InitialState():
return initial();case _NotIntroducedState():
return notIntroduced();case _IntroducedState():
return introduced();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  notIntroduced,TResult? Function()?  introduced,}) {final _that = this;
switch (_that) {
case _InitialState() when initial != null:
return initial();case _NotIntroducedState() when notIntroduced != null:
return notIntroduced();case _IntroducedState() when introduced != null:
return introduced();case _:
  return null;

}
}

}

/// @nodoc


class _InitialState implements EntryState {
  const _InitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EntryState.initial()';
}


}




/// @nodoc


class _NotIntroducedState implements EntryState {
  const _NotIntroducedState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotIntroducedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EntryState.notIntroduced()';
}


}




/// @nodoc


class _IntroducedState implements EntryState {
  const _IntroducedState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IntroducedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EntryState.introduced()';
}


}




// dart format on
