// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecommendedPagination {

 int get limit; int get page;
/// Create a copy of RecommendedPagination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendedPaginationCopyWith<RecommendedPagination> get copyWith => _$RecommendedPaginationCopyWithImpl<RecommendedPagination>(this as RecommendedPagination, _$identity);

  /// Serializes this RecommendedPagination to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendedPagination&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,page);

@override
String toString() {
  return 'RecommendedPagination(limit: $limit, page: $page)';
}


}

/// @nodoc
abstract mixin class $RecommendedPaginationCopyWith<$Res>  {
  factory $RecommendedPaginationCopyWith(RecommendedPagination value, $Res Function(RecommendedPagination) _then) = _$RecommendedPaginationCopyWithImpl;
@useResult
$Res call({
 int limit, int page
});




}
/// @nodoc
class _$RecommendedPaginationCopyWithImpl<$Res>
    implements $RecommendedPaginationCopyWith<$Res> {
  _$RecommendedPaginationCopyWithImpl(this._self, this._then);

  final RecommendedPagination _self;
  final $Res Function(RecommendedPagination) _then;

/// Create a copy of RecommendedPagination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,Object? page = null,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RecommendedPagination].
extension RecommendedPaginationPatterns on RecommendedPagination {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendedPagination value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendedPagination() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendedPagination value)  $default,){
final _that = this;
switch (_that) {
case _RecommendedPagination():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendedPagination value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendedPagination() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int limit,  int page)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendedPagination() when $default != null:
return $default(_that.limit,_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int limit,  int page)  $default,) {final _that = this;
switch (_that) {
case _RecommendedPagination():
return $default(_that.limit,_that.page);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int limit,  int page)?  $default,) {final _that = this;
switch (_that) {
case _RecommendedPagination() when $default != null:
return $default(_that.limit,_that.page);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendedPagination implements RecommendedPagination {
  const _RecommendedPagination({required this.limit, required this.page});
  factory _RecommendedPagination.fromJson(Map<String, dynamic> json) => _$RecommendedPaginationFromJson(json);

@override final  int limit;
@override final  int page;

/// Create a copy of RecommendedPagination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendedPaginationCopyWith<_RecommendedPagination> get copyWith => __$RecommendedPaginationCopyWithImpl<_RecommendedPagination>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendedPaginationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendedPagination&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,page);

@override
String toString() {
  return 'RecommendedPagination(limit: $limit, page: $page)';
}


}

/// @nodoc
abstract mixin class _$RecommendedPaginationCopyWith<$Res> implements $RecommendedPaginationCopyWith<$Res> {
  factory _$RecommendedPaginationCopyWith(_RecommendedPagination value, $Res Function(_RecommendedPagination) _then) = __$RecommendedPaginationCopyWithImpl;
@override @useResult
$Res call({
 int limit, int page
});




}
/// @nodoc
class __$RecommendedPaginationCopyWithImpl<$Res>
    implements _$RecommendedPaginationCopyWith<$Res> {
  __$RecommendedPaginationCopyWithImpl(this._self, this._then);

  final _RecommendedPagination _self;
  final $Res Function(_RecommendedPagination) _then;

/// Create a copy of RecommendedPagination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? page = null,}) {
  return _then(_RecommendedPagination(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RepliesPagination {

 int get limit; int get page; int get total; int get pages;
/// Create a copy of RepliesPagination
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RepliesPaginationCopyWith<RepliesPagination> get copyWith => _$RepliesPaginationCopyWithImpl<RepliesPagination>(this as RepliesPagination, _$identity);

  /// Serializes this RepliesPagination to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepliesPagination&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&(identical(other.pages, pages) || other.pages == pages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,page,total,pages);

@override
String toString() {
  return 'RepliesPagination(limit: $limit, page: $page, total: $total, pages: $pages)';
}


}

/// @nodoc
abstract mixin class $RepliesPaginationCopyWith<$Res>  {
  factory $RepliesPaginationCopyWith(RepliesPagination value, $Res Function(RepliesPagination) _then) = _$RepliesPaginationCopyWithImpl;
@useResult
$Res call({
 int limit, int page, int total, int pages
});




}
/// @nodoc
class _$RepliesPaginationCopyWithImpl<$Res>
    implements $RepliesPaginationCopyWith<$Res> {
  _$RepliesPaginationCopyWithImpl(this._self, this._then);

  final RepliesPagination _self;
  final $Res Function(RepliesPagination) _then;

/// Create a copy of RepliesPagination
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,Object? page = null,Object? total = null,Object? pages = null,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RepliesPagination].
extension RepliesPaginationPatterns on RepliesPagination {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RepliesPagination value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RepliesPagination() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RepliesPagination value)  $default,){
final _that = this;
switch (_that) {
case _RepliesPagination():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RepliesPagination value)?  $default,){
final _that = this;
switch (_that) {
case _RepliesPagination() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int limit,  int page,  int total,  int pages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RepliesPagination() when $default != null:
return $default(_that.limit,_that.page,_that.total,_that.pages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int limit,  int page,  int total,  int pages)  $default,) {final _that = this;
switch (_that) {
case _RepliesPagination():
return $default(_that.limit,_that.page,_that.total,_that.pages);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int limit,  int page,  int total,  int pages)?  $default,) {final _that = this;
switch (_that) {
case _RepliesPagination() when $default != null:
return $default(_that.limit,_that.page,_that.total,_that.pages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RepliesPagination implements RepliesPagination {
  const _RepliesPagination({required this.limit, required this.page, required this.total, required this.pages});
  factory _RepliesPagination.fromJson(Map<String, dynamic> json) => _$RepliesPaginationFromJson(json);

@override final  int limit;
@override final  int page;
@override final  int total;
@override final  int pages;

/// Create a copy of RepliesPagination
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RepliesPaginationCopyWith<_RepliesPagination> get copyWith => __$RepliesPaginationCopyWithImpl<_RepliesPagination>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RepliesPaginationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RepliesPagination&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.total, total) || other.total == total)&&(identical(other.pages, pages) || other.pages == pages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit,page,total,pages);

@override
String toString() {
  return 'RepliesPagination(limit: $limit, page: $page, total: $total, pages: $pages)';
}


}

/// @nodoc
abstract mixin class _$RepliesPaginationCopyWith<$Res> implements $RepliesPaginationCopyWith<$Res> {
  factory _$RepliesPaginationCopyWith(_RepliesPagination value, $Res Function(_RepliesPagination) _then) = __$RepliesPaginationCopyWithImpl;
@override @useResult
$Res call({
 int limit, int page, int total, int pages
});




}
/// @nodoc
class __$RepliesPaginationCopyWithImpl<$Res>
    implements _$RepliesPaginationCopyWith<$Res> {
  __$RepliesPaginationCopyWithImpl(this._self, this._then);

  final _RepliesPagination _self;
  final $Res Function(_RepliesPagination) _then;

/// Create a copy of RepliesPagination
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,Object? page = null,Object? total = null,Object? pages = null,}) {
  return _then(_RepliesPagination(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RecommendedResponse {

 RecommendedPagination get pagination; List<Post> get posts;
/// Create a copy of RecommendedResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendedResponseCopyWith<RecommendedResponse> get copyWith => _$RecommendedResponseCopyWithImpl<RecommendedResponse>(this as RecommendedResponse, _$identity);

  /// Serializes this RecommendedResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendedResponse&&(identical(other.pagination, pagination) || other.pagination == pagination)&&const DeepCollectionEquality().equals(other.posts, posts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pagination,const DeepCollectionEquality().hash(posts));

@override
String toString() {
  return 'RecommendedResponse(pagination: $pagination, posts: $posts)';
}


}

/// @nodoc
abstract mixin class $RecommendedResponseCopyWith<$Res>  {
  factory $RecommendedResponseCopyWith(RecommendedResponse value, $Res Function(RecommendedResponse) _then) = _$RecommendedResponseCopyWithImpl;
@useResult
$Res call({
 RecommendedPagination pagination, List<Post> posts
});


$RecommendedPaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class _$RecommendedResponseCopyWithImpl<$Res>
    implements $RecommendedResponseCopyWith<$Res> {
  _$RecommendedResponseCopyWithImpl(this._self, this._then);

  final RecommendedResponse _self;
  final $Res Function(RecommendedResponse) _then;

/// Create a copy of RecommendedResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pagination = null,Object? posts = null,}) {
  return _then(_self.copyWith(
pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as RecommendedPagination,posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}
/// Create a copy of RecommendedResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecommendedPaginationCopyWith<$Res> get pagination {
  
  return $RecommendedPaginationCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecommendedResponse].
extension RecommendedResponsePatterns on RecommendedResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendedResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendedResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendedResponse value)  $default,){
final _that = this;
switch (_that) {
case _RecommendedResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendedResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendedResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RecommendedPagination pagination,  List<Post> posts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendedResponse() when $default != null:
return $default(_that.pagination,_that.posts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RecommendedPagination pagination,  List<Post> posts)  $default,) {final _that = this;
switch (_that) {
case _RecommendedResponse():
return $default(_that.pagination,_that.posts);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RecommendedPagination pagination,  List<Post> posts)?  $default,) {final _that = this;
switch (_that) {
case _RecommendedResponse() when $default != null:
return $default(_that.pagination,_that.posts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendedResponse implements RecommendedResponse {
  const _RecommendedResponse({required this.pagination, required final  List<Post> posts}): _posts = posts;
  factory _RecommendedResponse.fromJson(Map<String, dynamic> json) => _$RecommendedResponseFromJson(json);

@override final  RecommendedPagination pagination;
 final  List<Post> _posts;
@override List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of RecommendedResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendedResponseCopyWith<_RecommendedResponse> get copyWith => __$RecommendedResponseCopyWithImpl<_RecommendedResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendedResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendedResponse&&(identical(other.pagination, pagination) || other.pagination == pagination)&&const DeepCollectionEquality().equals(other._posts, _posts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pagination,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'RecommendedResponse(pagination: $pagination, posts: $posts)';
}


}

/// @nodoc
abstract mixin class _$RecommendedResponseCopyWith<$Res> implements $RecommendedResponseCopyWith<$Res> {
  factory _$RecommendedResponseCopyWith(_RecommendedResponse value, $Res Function(_RecommendedResponse) _then) = __$RecommendedResponseCopyWithImpl;
@override @useResult
$Res call({
 RecommendedPagination pagination, List<Post> posts
});


@override $RecommendedPaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class __$RecommendedResponseCopyWithImpl<$Res>
    implements _$RecommendedResponseCopyWith<$Res> {
  __$RecommendedResponseCopyWithImpl(this._self, this._then);

  final _RecommendedResponse _self;
  final $Res Function(_RecommendedResponse) _then;

/// Create a copy of RecommendedResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pagination = null,Object? posts = null,}) {
  return _then(_RecommendedResponse(
pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as RecommendedPagination,posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}

/// Create a copy of RecommendedResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecommendedPaginationCopyWith<$Res> get pagination {
  
  return $RecommendedPaginationCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// @nodoc
mixin _$TimeLineResponse {

 RecommendedPagination get pagination; List<Post> get posts;
/// Create a copy of TimeLineResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeLineResponseCopyWith<TimeLineResponse> get copyWith => _$TimeLineResponseCopyWithImpl<TimeLineResponse>(this as TimeLineResponse, _$identity);

  /// Serializes this TimeLineResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeLineResponse&&(identical(other.pagination, pagination) || other.pagination == pagination)&&const DeepCollectionEquality().equals(other.posts, posts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pagination,const DeepCollectionEquality().hash(posts));

@override
String toString() {
  return 'TimeLineResponse(pagination: $pagination, posts: $posts)';
}


}

/// @nodoc
abstract mixin class $TimeLineResponseCopyWith<$Res>  {
  factory $TimeLineResponseCopyWith(TimeLineResponse value, $Res Function(TimeLineResponse) _then) = _$TimeLineResponseCopyWithImpl;
@useResult
$Res call({
 RecommendedPagination pagination, List<Post> posts
});


$RecommendedPaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class _$TimeLineResponseCopyWithImpl<$Res>
    implements $TimeLineResponseCopyWith<$Res> {
  _$TimeLineResponseCopyWithImpl(this._self, this._then);

  final TimeLineResponse _self;
  final $Res Function(TimeLineResponse) _then;

/// Create a copy of TimeLineResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pagination = null,Object? posts = null,}) {
  return _then(_self.copyWith(
pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as RecommendedPagination,posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}
/// Create a copy of TimeLineResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecommendedPaginationCopyWith<$Res> get pagination {
  
  return $RecommendedPaginationCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [TimeLineResponse].
extension TimeLineResponsePatterns on TimeLineResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeLineResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeLineResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeLineResponse value)  $default,){
final _that = this;
switch (_that) {
case _TimeLineResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeLineResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TimeLineResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RecommendedPagination pagination,  List<Post> posts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeLineResponse() when $default != null:
return $default(_that.pagination,_that.posts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RecommendedPagination pagination,  List<Post> posts)  $default,) {final _that = this;
switch (_that) {
case _TimeLineResponse():
return $default(_that.pagination,_that.posts);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RecommendedPagination pagination,  List<Post> posts)?  $default,) {final _that = this;
switch (_that) {
case _TimeLineResponse() when $default != null:
return $default(_that.pagination,_that.posts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeLineResponse implements TimeLineResponse {
  const _TimeLineResponse({required this.pagination, required final  List<Post> posts}): _posts = posts;
  factory _TimeLineResponse.fromJson(Map<String, dynamic> json) => _$TimeLineResponseFromJson(json);

@override final  RecommendedPagination pagination;
 final  List<Post> _posts;
@override List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}


/// Create a copy of TimeLineResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeLineResponseCopyWith<_TimeLineResponse> get copyWith => __$TimeLineResponseCopyWithImpl<_TimeLineResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeLineResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeLineResponse&&(identical(other.pagination, pagination) || other.pagination == pagination)&&const DeepCollectionEquality().equals(other._posts, _posts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pagination,const DeepCollectionEquality().hash(_posts));

@override
String toString() {
  return 'TimeLineResponse(pagination: $pagination, posts: $posts)';
}


}

/// @nodoc
abstract mixin class _$TimeLineResponseCopyWith<$Res> implements $TimeLineResponseCopyWith<$Res> {
  factory _$TimeLineResponseCopyWith(_TimeLineResponse value, $Res Function(_TimeLineResponse) _then) = __$TimeLineResponseCopyWithImpl;
@override @useResult
$Res call({
 RecommendedPagination pagination, List<Post> posts
});


@override $RecommendedPaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class __$TimeLineResponseCopyWithImpl<$Res>
    implements _$TimeLineResponseCopyWith<$Res> {
  __$TimeLineResponseCopyWithImpl(this._self, this._then);

  final _TimeLineResponse _self;
  final $Res Function(_TimeLineResponse) _then;

/// Create a copy of TimeLineResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pagination = null,Object? posts = null,}) {
  return _then(_TimeLineResponse(
pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as RecommendedPagination,posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}

/// Create a copy of TimeLineResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecommendedPaginationCopyWith<$Res> get pagination {
  
  return $RecommendedPaginationCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// @nodoc
mixin _$RepliesResponse {

 RepliesPagination get pagination; List<Post> get replies;
/// Create a copy of RepliesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RepliesResponseCopyWith<RepliesResponse> get copyWith => _$RepliesResponseCopyWithImpl<RepliesResponse>(this as RepliesResponse, _$identity);

  /// Serializes this RepliesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RepliesResponse&&(identical(other.pagination, pagination) || other.pagination == pagination)&&const DeepCollectionEquality().equals(other.replies, replies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pagination,const DeepCollectionEquality().hash(replies));

@override
String toString() {
  return 'RepliesResponse(pagination: $pagination, replies: $replies)';
}


}

/// @nodoc
abstract mixin class $RepliesResponseCopyWith<$Res>  {
  factory $RepliesResponseCopyWith(RepliesResponse value, $Res Function(RepliesResponse) _then) = _$RepliesResponseCopyWithImpl;
@useResult
$Res call({
 RepliesPagination pagination, List<Post> replies
});


$RepliesPaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class _$RepliesResponseCopyWithImpl<$Res>
    implements $RepliesResponseCopyWith<$Res> {
  _$RepliesResponseCopyWithImpl(this._self, this._then);

  final RepliesResponse _self;
  final $Res Function(RepliesResponse) _then;

/// Create a copy of RepliesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pagination = null,Object? replies = null,}) {
  return _then(_self.copyWith(
pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as RepliesPagination,replies: null == replies ? _self.replies : replies // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}
/// Create a copy of RepliesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RepliesPaginationCopyWith<$Res> get pagination {
  
  return $RepliesPaginationCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [RepliesResponse].
extension RepliesResponsePatterns on RepliesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RepliesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RepliesResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RepliesResponse value)  $default,){
final _that = this;
switch (_that) {
case _RepliesResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RepliesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RepliesResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RepliesPagination pagination,  List<Post> replies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RepliesResponse() when $default != null:
return $default(_that.pagination,_that.replies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RepliesPagination pagination,  List<Post> replies)  $default,) {final _that = this;
switch (_that) {
case _RepliesResponse():
return $default(_that.pagination,_that.replies);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RepliesPagination pagination,  List<Post> replies)?  $default,) {final _that = this;
switch (_that) {
case _RepliesResponse() when $default != null:
return $default(_that.pagination,_that.replies);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RepliesResponse implements RepliesResponse {
  const _RepliesResponse({required this.pagination, required final  List<Post> replies}): _replies = replies;
  factory _RepliesResponse.fromJson(Map<String, dynamic> json) => _$RepliesResponseFromJson(json);

@override final  RepliesPagination pagination;
 final  List<Post> _replies;
@override List<Post> get replies {
  if (_replies is EqualUnmodifiableListView) return _replies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_replies);
}


/// Create a copy of RepliesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RepliesResponseCopyWith<_RepliesResponse> get copyWith => __$RepliesResponseCopyWithImpl<_RepliesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RepliesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RepliesResponse&&(identical(other.pagination, pagination) || other.pagination == pagination)&&const DeepCollectionEquality().equals(other._replies, _replies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pagination,const DeepCollectionEquality().hash(_replies));

@override
String toString() {
  return 'RepliesResponse(pagination: $pagination, replies: $replies)';
}


}

/// @nodoc
abstract mixin class _$RepliesResponseCopyWith<$Res> implements $RepliesResponseCopyWith<$Res> {
  factory _$RepliesResponseCopyWith(_RepliesResponse value, $Res Function(_RepliesResponse) _then) = __$RepliesResponseCopyWithImpl;
@override @useResult
$Res call({
 RepliesPagination pagination, List<Post> replies
});


@override $RepliesPaginationCopyWith<$Res> get pagination;

}
/// @nodoc
class __$RepliesResponseCopyWithImpl<$Res>
    implements _$RepliesResponseCopyWith<$Res> {
  __$RepliesResponseCopyWithImpl(this._self, this._then);

  final _RepliesResponse _self;
  final $Res Function(_RepliesResponse) _then;

/// Create a copy of RepliesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pagination = null,Object? replies = null,}) {
  return _then(_RepliesResponse(
pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as RepliesPagination,replies: null == replies ? _self._replies : replies // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}

/// Create a copy of RepliesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RepliesPaginationCopyWith<$Res> get pagination {
  
  return $RepliesPaginationCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// @nodoc
mixin _$LoginResponse {

 String get accessToken; String get deviceId; String get sessionId; AuthUser get user;
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<LoginResponse> get copyWith => _$LoginResponseCopyWithImpl<LoginResponse>(this as LoginResponse, _$identity);

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,deviceId,sessionId,user);

@override
String toString() {
  return 'LoginResponse(accessToken: $accessToken, deviceId: $deviceId, sessionId: $sessionId, user: $user)';
}


}

/// @nodoc
abstract mixin class $LoginResponseCopyWith<$Res>  {
  factory $LoginResponseCopyWith(LoginResponse value, $Res Function(LoginResponse) _then) = _$LoginResponseCopyWithImpl;
@useResult
$Res call({
 String accessToken, String deviceId, String sessionId, AuthUser user
});


$AuthUserCopyWith<$Res> get user;

}
/// @nodoc
class _$LoginResponseCopyWithImpl<$Res>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._self, this._then);

  final LoginResponse _self;
  final $Res Function(LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? deviceId = null,Object? sessionId = null,Object? user = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUser,
  ));
}
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserCopyWith<$Res> get user {
  
  return $AuthUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginResponse].
extension LoginResponsePatterns on LoginResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResponse value)  $default,){
final _that = this;
switch (_that) {
case _LoginResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String deviceId,  String sessionId,  AuthUser user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.accessToken,_that.deviceId,_that.sessionId,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String deviceId,  String sessionId,  AuthUser user)  $default,) {final _that = this;
switch (_that) {
case _LoginResponse():
return $default(_that.accessToken,_that.deviceId,_that.sessionId,_that.user);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String deviceId,  String sessionId,  AuthUser user)?  $default,) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.accessToken,_that.deviceId,_that.sessionId,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResponse implements LoginResponse {
  const _LoginResponse({required this.accessToken, required this.deviceId, required this.sessionId, required this.user});
  factory _LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

@override final  String accessToken;
@override final  String deviceId;
@override final  String sessionId;
@override final  AuthUser user;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResponseCopyWith<_LoginResponse> get copyWith => __$LoginResponseCopyWithImpl<_LoginResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,deviceId,sessionId,user);

@override
String toString() {
  return 'LoginResponse(accessToken: $accessToken, deviceId: $deviceId, sessionId: $sessionId, user: $user)';
}


}

/// @nodoc
abstract mixin class _$LoginResponseCopyWith<$Res> implements $LoginResponseCopyWith<$Res> {
  factory _$LoginResponseCopyWith(_LoginResponse value, $Res Function(_LoginResponse) _then) = __$LoginResponseCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String deviceId, String sessionId, AuthUser user
});


@override $AuthUserCopyWith<$Res> get user;

}
/// @nodoc
class __$LoginResponseCopyWithImpl<$Res>
    implements _$LoginResponseCopyWith<$Res> {
  __$LoginResponseCopyWithImpl(this._self, this._then);

  final _LoginResponse _self;
  final $Res Function(_LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? deviceId = null,Object? sessionId = null,Object? user = null,}) {
  return _then(_LoginResponse(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUser,
  ));
}

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserCopyWith<$Res> get user {
  
  return $AuthUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$RefreshResponse {

 String get accessToken; String get sessionId;
/// Create a copy of RefreshResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshResponseCopyWith<RefreshResponse> get copyWith => _$RefreshResponseCopyWithImpl<RefreshResponse>(this as RefreshResponse, _$identity);

  /// Serializes this RefreshResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,sessionId);

@override
String toString() {
  return 'RefreshResponse(accessToken: $accessToken, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $RefreshResponseCopyWith<$Res>  {
  factory $RefreshResponseCopyWith(RefreshResponse value, $Res Function(RefreshResponse) _then) = _$RefreshResponseCopyWithImpl;
@useResult
$Res call({
 String accessToken, String sessionId
});




}
/// @nodoc
class _$RefreshResponseCopyWithImpl<$Res>
    implements $RefreshResponseCopyWith<$Res> {
  _$RefreshResponseCopyWithImpl(this._self, this._then);

  final RefreshResponse _self;
  final $Res Function(RefreshResponse) _then;

/// Create a copy of RefreshResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? sessionId = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RefreshResponse].
extension RefreshResponsePatterns on RefreshResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefreshResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefreshResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefreshResponse value)  $default,){
final _that = this;
switch (_that) {
case _RefreshResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefreshResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RefreshResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String sessionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefreshResponse() when $default != null:
return $default(_that.accessToken,_that.sessionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String sessionId)  $default,) {final _that = this;
switch (_that) {
case _RefreshResponse():
return $default(_that.accessToken,_that.sessionId);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String sessionId)?  $default,) {final _that = this;
switch (_that) {
case _RefreshResponse() when $default != null:
return $default(_that.accessToken,_that.sessionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefreshResponse implements RefreshResponse {
  const _RefreshResponse({required this.accessToken, required this.sessionId});
  factory _RefreshResponse.fromJson(Map<String, dynamic> json) => _$RefreshResponseFromJson(json);

@override final  String accessToken;
@override final  String sessionId;

/// Create a copy of RefreshResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshResponseCopyWith<_RefreshResponse> get copyWith => __$RefreshResponseCopyWithImpl<_RefreshResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefreshResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,sessionId);

@override
String toString() {
  return 'RefreshResponse(accessToken: $accessToken, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$RefreshResponseCopyWith<$Res> implements $RefreshResponseCopyWith<$Res> {
  factory _$RefreshResponseCopyWith(_RefreshResponse value, $Res Function(_RefreshResponse) _then) = __$RefreshResponseCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String sessionId
});




}
/// @nodoc
class __$RefreshResponseCopyWithImpl<$Res>
    implements _$RefreshResponseCopyWith<$Res> {
  __$RefreshResponseCopyWithImpl(this._self, this._then);

  final _RefreshResponse _self;
  final $Res Function(_RefreshResponse) _then;

/// Create a copy of RefreshResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? sessionId = null,}) {
  return _then(_RefreshResponse(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
