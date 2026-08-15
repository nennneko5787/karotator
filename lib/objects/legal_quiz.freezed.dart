// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'legal_quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalizedText {

 String get ja; String get en;
/// Create a copy of LocalizedText
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<LocalizedText> get copyWith => _$LocalizedTextCopyWithImpl<LocalizedText>(this as LocalizedText, _$identity);

  /// Serializes this LocalizedText to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalizedText&&(identical(other.ja, ja) || other.ja == ja)&&(identical(other.en, en) || other.en == en));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ja,en);

@override
String toString() {
  return 'LocalizedText(ja: $ja, en: $en)';
}


}

/// @nodoc
abstract mixin class $LocalizedTextCopyWith<$Res>  {
  factory $LocalizedTextCopyWith(LocalizedText value, $Res Function(LocalizedText) _then) = _$LocalizedTextCopyWithImpl;
@useResult
$Res call({
 String ja, String en
});




}
/// @nodoc
class _$LocalizedTextCopyWithImpl<$Res>
    implements $LocalizedTextCopyWith<$Res> {
  _$LocalizedTextCopyWithImpl(this._self, this._then);

  final LocalizedText _self;
  final $Res Function(LocalizedText) _then;

/// Create a copy of LocalizedText
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ja = null,Object? en = null,}) {
  return _then(LocalizedText(
ja: null == ja ? _self.ja : ja // ignore: cast_nullable_to_non_nullable
as String,en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalizedText].
extension LocalizedTextPatterns on LocalizedText {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalizedText value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalizedText() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalizedText value)  $default,){
final _that = this;
switch (_that) {
case _LocalizedText():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalizedText value)?  $default,){
final _that = this;
switch (_that) {
case _LocalizedText() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ja,  String en)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalizedText() when $default != null:
return $default(_that.ja,_that.en);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ja,  String en)  $default,) {final _that = this;
switch (_that) {
case _LocalizedText():
return $default(_that.ja,_that.en);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ja,  String en)?  $default,) {final _that = this;
switch (_that) {
case _LocalizedText() when $default != null:
return $default(_that.ja,_that.en);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocalizedText implements LocalizedText {
  const _LocalizedText({this.ja = '', this.en = ''});
  factory _LocalizedText.fromJson(Map<String, dynamic> json) => _$LocalizedTextFromJson(json);

@override@JsonKey() final  String ja;
@override@JsonKey() final  String en;

/// Create a copy of LocalizedText
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalizedTextCopyWith<_LocalizedText> get copyWith => __$LocalizedTextCopyWithImpl<_LocalizedText>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalizedTextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalizedText&&(identical(other.ja, ja) || other.ja == ja)&&(identical(other.en, en) || other.en == en));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ja,en);

@override
String toString() {
  return 'LocalizedText(ja: $ja, en: $en)';
}


}

/// @nodoc
abstract mixin class _$LocalizedTextCopyWith<$Res> implements $LocalizedTextCopyWith<$Res> {
  factory _$LocalizedTextCopyWith(_LocalizedText value, $Res Function(_LocalizedText) _then) = __$LocalizedTextCopyWithImpl;
@override @useResult
$Res call({
 String ja, String en
});




}
/// @nodoc
class __$LocalizedTextCopyWithImpl<$Res>
    implements _$LocalizedTextCopyWith<$Res> {
  __$LocalizedTextCopyWithImpl(this._self, this._then);

  final _LocalizedText _self;
  final $Res Function(_LocalizedText) _then;

/// Create a copy of LocalizedText
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ja = null,Object? en = null,}) {
  return _then(_LocalizedText(
ja: null == ja ? _self.ja : ja // ignore: cast_nullable_to_non_nullable
as String,en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LegalQuiz {

/// 採点時にそのまま送り返す。実測で 1.8KB ほどある。
 String get token;/// [token] の寿命。実測 900（15 分）。
 int get expiresInSeconds;/// 合格に必要な正解数。実測は設問数と同じ 5 で、全問正解が要る。
 int get requiredCorrectAnswers; List<LegalQuizQuestion> get questions;
/// Create a copy of LegalQuiz
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LegalQuizCopyWith<LegalQuiz> get copyWith => _$LegalQuizCopyWithImpl<LegalQuiz>(this as LegalQuiz, _$identity);

  /// Serializes this LegalQuiz to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LegalQuiz&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresInSeconds, expiresInSeconds) || other.expiresInSeconds == expiresInSeconds)&&(identical(other.requiredCorrectAnswers, requiredCorrectAnswers) || other.requiredCorrectAnswers == requiredCorrectAnswers)&&const DeepCollectionEquality().equals(other.questions, questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,expiresInSeconds,requiredCorrectAnswers,const DeepCollectionEquality().hash(questions));

@override
String toString() {
  return 'LegalQuiz(token: $token, expiresInSeconds: $expiresInSeconds, requiredCorrectAnswers: $requiredCorrectAnswers, questions: $questions)';
}


}

/// @nodoc
abstract mixin class $LegalQuizCopyWith<$Res>  {
  factory $LegalQuizCopyWith(LegalQuiz value, $Res Function(LegalQuiz) _then) = _$LegalQuizCopyWithImpl;
@useResult
$Res call({
 String token, int expiresInSeconds, int requiredCorrectAnswers, List<LegalQuizQuestion> questions
});




}
/// @nodoc
class _$LegalQuizCopyWithImpl<$Res>
    implements $LegalQuizCopyWith<$Res> {
  _$LegalQuizCopyWithImpl(this._self, this._then);

  final LegalQuiz _self;
  final $Res Function(LegalQuiz) _then;

/// Create a copy of LegalQuiz
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? expiresInSeconds = null,Object? requiredCorrectAnswers = null,Object? questions = null,}) {
  return _then(LegalQuiz(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiresInSeconds: null == expiresInSeconds ? _self.expiresInSeconds : expiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,requiredCorrectAnswers: null == requiredCorrectAnswers ? _self.requiredCorrectAnswers : requiredCorrectAnswers // ignore: cast_nullable_to_non_nullable
as int,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<LegalQuizQuestion>,
  ));
}

}


/// Adds pattern-matching-related methods to [LegalQuiz].
extension LegalQuizPatterns on LegalQuiz {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LegalQuiz value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LegalQuiz() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LegalQuiz value)  $default,){
final _that = this;
switch (_that) {
case _LegalQuiz():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LegalQuiz value)?  $default,){
final _that = this;
switch (_that) {
case _LegalQuiz() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  int expiresInSeconds,  int requiredCorrectAnswers,  List<LegalQuizQuestion> questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LegalQuiz() when $default != null:
return $default(_that.token,_that.expiresInSeconds,_that.requiredCorrectAnswers,_that.questions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  int expiresInSeconds,  int requiredCorrectAnswers,  List<LegalQuizQuestion> questions)  $default,) {final _that = this;
switch (_that) {
case _LegalQuiz():
return $default(_that.token,_that.expiresInSeconds,_that.requiredCorrectAnswers,_that.questions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  int expiresInSeconds,  int requiredCorrectAnswers,  List<LegalQuizQuestion> questions)?  $default,) {final _that = this;
switch (_that) {
case _LegalQuiz() when $default != null:
return $default(_that.token,_that.expiresInSeconds,_that.requiredCorrectAnswers,_that.questions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LegalQuiz implements LegalQuiz {
  const _LegalQuiz({this.token = '', this.expiresInSeconds = 0, this.requiredCorrectAnswers = 0,  List<LegalQuizQuestion> questions = const []}): _questions = questions;
  factory _LegalQuiz.fromJson(Map<String, dynamic> json) => _$LegalQuizFromJson(json);

/// 採点時にそのまま送り返す。実測で 1.8KB ほどある。
@override@JsonKey() final  String token;
/// [token] の寿命。実測 900（15 分）。
@override@JsonKey() final  int expiresInSeconds;
/// 合格に必要な正解数。実測は設問数と同じ 5 で、全問正解が要る。
@override@JsonKey() final  int requiredCorrectAnswers;
 final  List<LegalQuizQuestion> _questions;
@override@JsonKey() List<LegalQuizQuestion> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of LegalQuiz
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LegalQuizCopyWith<_LegalQuiz> get copyWith => __$LegalQuizCopyWithImpl<_LegalQuiz>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LegalQuizToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LegalQuiz&&(identical(other.token, token) || other.token == token)&&(identical(other.expiresInSeconds, expiresInSeconds) || other.expiresInSeconds == expiresInSeconds)&&(identical(other.requiredCorrectAnswers, requiredCorrectAnswers) || other.requiredCorrectAnswers == requiredCorrectAnswers)&&const DeepCollectionEquality().equals(other._questions, _questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,expiresInSeconds,requiredCorrectAnswers,const DeepCollectionEquality().hash(_questions));

@override
String toString() {
  return 'LegalQuiz(token: $token, expiresInSeconds: $expiresInSeconds, requiredCorrectAnswers: $requiredCorrectAnswers, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$LegalQuizCopyWith<$Res> implements $LegalQuizCopyWith<$Res> {
  factory _$LegalQuizCopyWith(_LegalQuiz value, $Res Function(_LegalQuiz) _then) = __$LegalQuizCopyWithImpl;
@override @useResult
$Res call({
 String token, int expiresInSeconds, int requiredCorrectAnswers, List<LegalQuizQuestion> questions
});




}
/// @nodoc
class __$LegalQuizCopyWithImpl<$Res>
    implements _$LegalQuizCopyWith<$Res> {
  __$LegalQuizCopyWithImpl(this._self, this._then);

  final _LegalQuiz _self;
  final $Res Function(_LegalQuiz) _then;

/// Create a copy of LegalQuiz
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? expiresInSeconds = null,Object? requiredCorrectAnswers = null,Object? questions = null,}) {
  return _then(_LegalQuiz(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiresInSeconds: null == expiresInSeconds ? _self.expiresInSeconds : expiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,requiredCorrectAnswers: null == requiredCorrectAnswers ? _self.requiredCorrectAnswers : requiredCorrectAnswers // ignore: cast_nullable_to_non_nullable
as int,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<LegalQuizQuestion>,
  ));
}


}


/// @nodoc
mixin _$LegalQuizQuestion {

/// `privacy-minors-careful` のようなスラグ。数値ではない。
 String get id; LocalizedText get prompt;/// 根拠となる規約の名前。
 LocalizedText get document;/// Karotter Web 上のパス。`/terms` など。`legalDocuments` の `path` と対応する。
 String get documentPath; List<LegalQuizOption> get options;
/// Create a copy of LegalQuizQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LegalQuizQuestionCopyWith<LegalQuizQuestion> get copyWith => _$LegalQuizQuestionCopyWithImpl<LegalQuizQuestion>(this as LegalQuizQuestion, _$identity);

  /// Serializes this LegalQuizQuestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LegalQuizQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.document, document) || other.document == document)&&(identical(other.documentPath, documentPath) || other.documentPath == documentPath)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prompt,document,documentPath,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'LegalQuizQuestion(id: $id, prompt: $prompt, document: $document, documentPath: $documentPath, options: $options)';
}


}

/// @nodoc
abstract mixin class $LegalQuizQuestionCopyWith<$Res>  {
  factory $LegalQuizQuestionCopyWith(LegalQuizQuestion value, $Res Function(LegalQuizQuestion) _then) = _$LegalQuizQuestionCopyWithImpl;
@useResult
$Res call({
 String id, LocalizedText prompt, LocalizedText document, String documentPath, List<LegalQuizOption> options
});


$LocalizedTextCopyWith<$Res> get prompt;$LocalizedTextCopyWith<$Res> get document;

}
/// @nodoc
class _$LegalQuizQuestionCopyWithImpl<$Res>
    implements $LegalQuizQuestionCopyWith<$Res> {
  _$LegalQuizQuestionCopyWithImpl(this._self, this._then);

  final LegalQuizQuestion _self;
  final $Res Function(LegalQuizQuestion) _then;

/// Create a copy of LegalQuizQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? prompt = null,Object? document = null,Object? documentPath = null,Object? options = null,}) {
  return _then(LegalQuizQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as LocalizedText,document: null == document ? _self.document : document // ignore: cast_nullable_to_non_nullable
as LocalizedText,documentPath: null == documentPath ? _self.documentPath : documentPath // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<LegalQuizOption>,
  ));
}
/// Create a copy of LegalQuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get prompt {
  
  return $LocalizedTextCopyWith<$Res>(_self.prompt, (value) {
    return _then(_self.copyWith(prompt: value));
  });
}/// Create a copy of LegalQuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get document {
  
  return $LocalizedTextCopyWith<$Res>(_self.document, (value) {
    return _then(_self.copyWith(document: value));
  });
}
}


/// Adds pattern-matching-related methods to [LegalQuizQuestion].
extension LegalQuizQuestionPatterns on LegalQuizQuestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LegalQuizQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LegalQuizQuestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LegalQuizQuestion value)  $default,){
final _that = this;
switch (_that) {
case _LegalQuizQuestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LegalQuizQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _LegalQuizQuestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LocalizedText prompt,  LocalizedText document,  String documentPath,  List<LegalQuizOption> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LegalQuizQuestion() when $default != null:
return $default(_that.id,_that.prompt,_that.document,_that.documentPath,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LocalizedText prompt,  LocalizedText document,  String documentPath,  List<LegalQuizOption> options)  $default,) {final _that = this;
switch (_that) {
case _LegalQuizQuestion():
return $default(_that.id,_that.prompt,_that.document,_that.documentPath,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LocalizedText prompt,  LocalizedText document,  String documentPath,  List<LegalQuizOption> options)?  $default,) {final _that = this;
switch (_that) {
case _LegalQuizQuestion() when $default != null:
return $default(_that.id,_that.prompt,_that.document,_that.documentPath,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LegalQuizQuestion implements LegalQuizQuestion {
  const _LegalQuizQuestion({required this.id, this.prompt = const LocalizedText(), this.document = const LocalizedText(), this.documentPath = '',  List<LegalQuizOption> options = const []}): _options = options;
  factory _LegalQuizQuestion.fromJson(Map<String, dynamic> json) => _$LegalQuizQuestionFromJson(json);

/// `privacy-minors-careful` のようなスラグ。数値ではない。
@override final  String id;
@override@JsonKey() final  LocalizedText prompt;
/// 根拠となる規約の名前。
@override@JsonKey() final  LocalizedText document;
/// Karotter Web 上のパス。`/terms` など。`legalDocuments` の `path` と対応する。
@override@JsonKey() final  String documentPath;
 final  List<LegalQuizOption> _options;
@override@JsonKey() List<LegalQuizOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of LegalQuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LegalQuizQuestionCopyWith<_LegalQuizQuestion> get copyWith => __$LegalQuizQuestionCopyWithImpl<_LegalQuizQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LegalQuizQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LegalQuizQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.prompt, prompt) || other.prompt == prompt)&&(identical(other.document, document) || other.document == document)&&(identical(other.documentPath, documentPath) || other.documentPath == documentPath)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prompt,document,documentPath,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'LegalQuizQuestion(id: $id, prompt: $prompt, document: $document, documentPath: $documentPath, options: $options)';
}


}

/// @nodoc
abstract mixin class _$LegalQuizQuestionCopyWith<$Res> implements $LegalQuizQuestionCopyWith<$Res> {
  factory _$LegalQuizQuestionCopyWith(_LegalQuizQuestion value, $Res Function(_LegalQuizQuestion) _then) = __$LegalQuizQuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, LocalizedText prompt, LocalizedText document, String documentPath, List<LegalQuizOption> options
});


@override $LocalizedTextCopyWith<$Res> get prompt;@override $LocalizedTextCopyWith<$Res> get document;

}
/// @nodoc
class __$LegalQuizQuestionCopyWithImpl<$Res>
    implements _$LegalQuizQuestionCopyWith<$Res> {
  __$LegalQuizQuestionCopyWithImpl(this._self, this._then);

  final _LegalQuizQuestion _self;
  final $Res Function(_LegalQuizQuestion) _then;

/// Create a copy of LegalQuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? prompt = null,Object? document = null,Object? documentPath = null,Object? options = null,}) {
  return _then(_LegalQuizQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as LocalizedText,document: null == document ? _self.document : document // ignore: cast_nullable_to_non_nullable
as LocalizedText,documentPath: null == documentPath ? _self.documentPath : documentPath // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<LegalQuizOption>,
  ));
}

/// Create a copy of LegalQuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get prompt {
  
  return $LocalizedTextCopyWith<$Res>(_self.prompt, (value) {
    return _then(_self.copyWith(prompt: value));
  });
}/// Create a copy of LegalQuizQuestion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get document {
  
  return $LocalizedTextCopyWith<$Res>(_self.document, (value) {
    return _then(_self.copyWith(document: value));
  });
}
}


/// @nodoc
mixin _$LegalQuizOption {

/// `c15e08d3385c0822` のような 16 進の文字列。数値ではない。
 String get id; LocalizedText get label;
/// Create a copy of LegalQuizOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LegalQuizOptionCopyWith<LegalQuizOption> get copyWith => _$LegalQuizOptionCopyWithImpl<LegalQuizOption>(this as LegalQuizOption, _$identity);

  /// Serializes this LegalQuizOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LegalQuizOption&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label);

@override
String toString() {
  return 'LegalQuizOption(id: $id, label: $label)';
}


}

/// @nodoc
abstract mixin class $LegalQuizOptionCopyWith<$Res>  {
  factory $LegalQuizOptionCopyWith(LegalQuizOption value, $Res Function(LegalQuizOption) _then) = _$LegalQuizOptionCopyWithImpl;
@useResult
$Res call({
 String id, LocalizedText label
});


$LocalizedTextCopyWith<$Res> get label;

}
/// @nodoc
class _$LegalQuizOptionCopyWithImpl<$Res>
    implements $LegalQuizOptionCopyWith<$Res> {
  _$LegalQuizOptionCopyWithImpl(this._self, this._then);

  final LegalQuizOption _self;
  final $Res Function(LegalQuizOption) _then;

/// Create a copy of LegalQuizOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,}) {
  return _then(LegalQuizOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as LocalizedText,
  ));
}
/// Create a copy of LegalQuizOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get label {
  
  return $LocalizedTextCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}
}


/// Adds pattern-matching-related methods to [LegalQuizOption].
extension LegalQuizOptionPatterns on LegalQuizOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LegalQuizOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LegalQuizOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LegalQuizOption value)  $default,){
final _that = this;
switch (_that) {
case _LegalQuizOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LegalQuizOption value)?  $default,){
final _that = this;
switch (_that) {
case _LegalQuizOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LocalizedText label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LegalQuizOption() when $default != null:
return $default(_that.id,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LocalizedText label)  $default,) {final _that = this;
switch (_that) {
case _LegalQuizOption():
return $default(_that.id,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LocalizedText label)?  $default,) {final _that = this;
switch (_that) {
case _LegalQuizOption() when $default != null:
return $default(_that.id,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LegalQuizOption implements LegalQuizOption {
  const _LegalQuizOption({required this.id, this.label = const LocalizedText()});
  factory _LegalQuizOption.fromJson(Map<String, dynamic> json) => _$LegalQuizOptionFromJson(json);

/// `c15e08d3385c0822` のような 16 進の文字列。数値ではない。
@override final  String id;
@override@JsonKey() final  LocalizedText label;

/// Create a copy of LegalQuizOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LegalQuizOptionCopyWith<_LegalQuizOption> get copyWith => __$LegalQuizOptionCopyWithImpl<_LegalQuizOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LegalQuizOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LegalQuizOption&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label);

@override
String toString() {
  return 'LegalQuizOption(id: $id, label: $label)';
}


}

/// @nodoc
abstract mixin class _$LegalQuizOptionCopyWith<$Res> implements $LegalQuizOptionCopyWith<$Res> {
  factory _$LegalQuizOptionCopyWith(_LegalQuizOption value, $Res Function(_LegalQuizOption) _then) = __$LegalQuizOptionCopyWithImpl;
@override @useResult
$Res call({
 String id, LocalizedText label
});


@override $LocalizedTextCopyWith<$Res> get label;

}
/// @nodoc
class __$LegalQuizOptionCopyWithImpl<$Res>
    implements _$LegalQuizOptionCopyWith<$Res> {
  __$LegalQuizOptionCopyWithImpl(this._self, this._then);

  final _LegalQuizOption _self;
  final $Res Function(_LegalQuizOption) _then;

/// Create a copy of LegalQuizOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,}) {
  return _then(_LegalQuizOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as LocalizedText,
  ));
}

/// Create a copy of LegalQuizOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get label {
  
  return $LocalizedTextCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}
}


/// @nodoc
mixin _$LegalQuizResult {

/// 今回の回答が合格点に達したか。
 bool get passed;/// アカウントに「合格済み」として記録されたか。
///
/// [passed] とは**別物**。未ログインだと合格しても記録されない。
 bool get legalQuizPassed; List<LegalQuizGradedQuestion> get questions;
/// Create a copy of LegalQuizResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LegalQuizResultCopyWith<LegalQuizResult> get copyWith => _$LegalQuizResultCopyWithImpl<LegalQuizResult>(this as LegalQuizResult, _$identity);

  /// Serializes this LegalQuizResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LegalQuizResult&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.legalQuizPassed, legalQuizPassed) || other.legalQuizPassed == legalQuizPassed)&&const DeepCollectionEquality().equals(other.questions, questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,passed,legalQuizPassed,const DeepCollectionEquality().hash(questions));

@override
String toString() {
  return 'LegalQuizResult(passed: $passed, legalQuizPassed: $legalQuizPassed, questions: $questions)';
}


}

/// @nodoc
abstract mixin class $LegalQuizResultCopyWith<$Res>  {
  factory $LegalQuizResultCopyWith(LegalQuizResult value, $Res Function(LegalQuizResult) _then) = _$LegalQuizResultCopyWithImpl;
@useResult
$Res call({
 bool passed, bool legalQuizPassed, List<LegalQuizGradedQuestion> questions
});




}
/// @nodoc
class _$LegalQuizResultCopyWithImpl<$Res>
    implements $LegalQuizResultCopyWith<$Res> {
  _$LegalQuizResultCopyWithImpl(this._self, this._then);

  final LegalQuizResult _self;
  final $Res Function(LegalQuizResult) _then;

/// Create a copy of LegalQuizResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? passed = null,Object? legalQuizPassed = null,Object? questions = null,}) {
  return _then(LegalQuizResult(
passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,legalQuizPassed: null == legalQuizPassed ? _self.legalQuizPassed : legalQuizPassed // ignore: cast_nullable_to_non_nullable
as bool,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<LegalQuizGradedQuestion>,
  ));
}

}


/// Adds pattern-matching-related methods to [LegalQuizResult].
extension LegalQuizResultPatterns on LegalQuizResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LegalQuizResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LegalQuizResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LegalQuizResult value)  $default,){
final _that = this;
switch (_that) {
case _LegalQuizResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LegalQuizResult value)?  $default,){
final _that = this;
switch (_that) {
case _LegalQuizResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool passed,  bool legalQuizPassed,  List<LegalQuizGradedQuestion> questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LegalQuizResult() when $default != null:
return $default(_that.passed,_that.legalQuizPassed,_that.questions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool passed,  bool legalQuizPassed,  List<LegalQuizGradedQuestion> questions)  $default,) {final _that = this;
switch (_that) {
case _LegalQuizResult():
return $default(_that.passed,_that.legalQuizPassed,_that.questions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool passed,  bool legalQuizPassed,  List<LegalQuizGradedQuestion> questions)?  $default,) {final _that = this;
switch (_that) {
case _LegalQuizResult() when $default != null:
return $default(_that.passed,_that.legalQuizPassed,_that.questions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LegalQuizResult implements LegalQuizResult {
  const _LegalQuizResult({this.passed = false, this.legalQuizPassed = false,  List<LegalQuizGradedQuestion> questions = const []}): _questions = questions;
  factory _LegalQuizResult.fromJson(Map<String, dynamic> json) => _$LegalQuizResultFromJson(json);

/// 今回の回答が合格点に達したか。
@override@JsonKey() final  bool passed;
/// アカウントに「合格済み」として記録されたか。
///
/// [passed] とは**別物**。未ログインだと合格しても記録されない。
@override@JsonKey() final  bool legalQuizPassed;
 final  List<LegalQuizGradedQuestion> _questions;
@override@JsonKey() List<LegalQuizGradedQuestion> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of LegalQuizResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LegalQuizResultCopyWith<_LegalQuizResult> get copyWith => __$LegalQuizResultCopyWithImpl<_LegalQuizResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LegalQuizResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LegalQuizResult&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.legalQuizPassed, legalQuizPassed) || other.legalQuizPassed == legalQuizPassed)&&const DeepCollectionEquality().equals(other._questions, _questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,passed,legalQuizPassed,const DeepCollectionEquality().hash(_questions));

@override
String toString() {
  return 'LegalQuizResult(passed: $passed, legalQuizPassed: $legalQuizPassed, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$LegalQuizResultCopyWith<$Res> implements $LegalQuizResultCopyWith<$Res> {
  factory _$LegalQuizResultCopyWith(_LegalQuizResult value, $Res Function(_LegalQuizResult) _then) = __$LegalQuizResultCopyWithImpl;
@override @useResult
$Res call({
 bool passed, bool legalQuizPassed, List<LegalQuizGradedQuestion> questions
});




}
/// @nodoc
class __$LegalQuizResultCopyWithImpl<$Res>
    implements _$LegalQuizResultCopyWith<$Res> {
  __$LegalQuizResultCopyWithImpl(this._self, this._then);

  final _LegalQuizResult _self;
  final $Res Function(_LegalQuizResult) _then;

/// Create a copy of LegalQuizResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? passed = null,Object? legalQuizPassed = null,Object? questions = null,}) {
  return _then(_LegalQuizResult(
passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,legalQuizPassed: null == legalQuizPassed ? _self.legalQuizPassed : legalQuizPassed // ignore: cast_nullable_to_non_nullable
as bool,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<LegalQuizGradedQuestion>,
  ));
}


}


/// @nodoc
mixin _$LegalQuizGradedQuestion {

 String get id; List<LegalQuizGradedOption> get options;
/// Create a copy of LegalQuizGradedQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LegalQuizGradedQuestionCopyWith<LegalQuizGradedQuestion> get copyWith => _$LegalQuizGradedQuestionCopyWithImpl<LegalQuizGradedQuestion>(this as LegalQuizGradedQuestion, _$identity);

  /// Serializes this LegalQuizGradedQuestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LegalQuizGradedQuestion&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'LegalQuizGradedQuestion(id: $id, options: $options)';
}


}

/// @nodoc
abstract mixin class $LegalQuizGradedQuestionCopyWith<$Res>  {
  factory $LegalQuizGradedQuestionCopyWith(LegalQuizGradedQuestion value, $Res Function(LegalQuizGradedQuestion) _then) = _$LegalQuizGradedQuestionCopyWithImpl;
@useResult
$Res call({
 String id, List<LegalQuizGradedOption> options
});




}
/// @nodoc
class _$LegalQuizGradedQuestionCopyWithImpl<$Res>
    implements $LegalQuizGradedQuestionCopyWith<$Res> {
  _$LegalQuizGradedQuestionCopyWithImpl(this._self, this._then);

  final LegalQuizGradedQuestion _self;
  final $Res Function(LegalQuizGradedQuestion) _then;

/// Create a copy of LegalQuizGradedQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? options = null,}) {
  return _then(LegalQuizGradedQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<LegalQuizGradedOption>,
  ));
}

}


/// Adds pattern-matching-related methods to [LegalQuizGradedQuestion].
extension LegalQuizGradedQuestionPatterns on LegalQuizGradedQuestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LegalQuizGradedQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LegalQuizGradedQuestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LegalQuizGradedQuestion value)  $default,){
final _that = this;
switch (_that) {
case _LegalQuizGradedQuestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LegalQuizGradedQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _LegalQuizGradedQuestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<LegalQuizGradedOption> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LegalQuizGradedQuestion() when $default != null:
return $default(_that.id,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<LegalQuizGradedOption> options)  $default,) {final _that = this;
switch (_that) {
case _LegalQuizGradedQuestion():
return $default(_that.id,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<LegalQuizGradedOption> options)?  $default,) {final _that = this;
switch (_that) {
case _LegalQuizGradedQuestion() when $default != null:
return $default(_that.id,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LegalQuizGradedQuestion implements LegalQuizGradedQuestion {
  const _LegalQuizGradedQuestion({required this.id,  List<LegalQuizGradedOption> options = const []}): _options = options;
  factory _LegalQuizGradedQuestion.fromJson(Map<String, dynamic> json) => _$LegalQuizGradedQuestionFromJson(json);

@override final  String id;
 final  List<LegalQuizGradedOption> _options;
@override@JsonKey() List<LegalQuizGradedOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of LegalQuizGradedQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LegalQuizGradedQuestionCopyWith<_LegalQuizGradedQuestion> get copyWith => __$LegalQuizGradedQuestionCopyWithImpl<_LegalQuizGradedQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LegalQuizGradedQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LegalQuizGradedQuestion&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'LegalQuizGradedQuestion(id: $id, options: $options)';
}


}

/// @nodoc
abstract mixin class _$LegalQuizGradedQuestionCopyWith<$Res> implements $LegalQuizGradedQuestionCopyWith<$Res> {
  factory _$LegalQuizGradedQuestionCopyWith(_LegalQuizGradedQuestion value, $Res Function(_LegalQuizGradedQuestion) _then) = __$LegalQuizGradedQuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, List<LegalQuizGradedOption> options
});




}
/// @nodoc
class __$LegalQuizGradedQuestionCopyWithImpl<$Res>
    implements _$LegalQuizGradedQuestionCopyWith<$Res> {
  __$LegalQuizGradedQuestionCopyWithImpl(this._self, this._then);

  final _LegalQuizGradedQuestion _self;
  final $Res Function(_LegalQuizGradedQuestion) _then;

/// Create a copy of LegalQuizGradedQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? options = null,}) {
  return _then(_LegalQuizGradedQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<LegalQuizGradedOption>,
  ));
}


}


/// @nodoc
mixin _$LegalQuizGradedOption {

 String get id; LocalizedText get explanation; bool get isCorrect; bool get isSelected;
/// Create a copy of LegalQuizGradedOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LegalQuizGradedOptionCopyWith<LegalQuizGradedOption> get copyWith => _$LegalQuizGradedOptionCopyWithImpl<LegalQuizGradedOption>(this as LegalQuizGradedOption, _$identity);

  /// Serializes this LegalQuizGradedOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LegalQuizGradedOption&&(identical(other.id, id) || other.id == id)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,explanation,isCorrect,isSelected);

@override
String toString() {
  return 'LegalQuizGradedOption(id: $id, explanation: $explanation, isCorrect: $isCorrect, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class $LegalQuizGradedOptionCopyWith<$Res>  {
  factory $LegalQuizGradedOptionCopyWith(LegalQuizGradedOption value, $Res Function(LegalQuizGradedOption) _then) = _$LegalQuizGradedOptionCopyWithImpl;
@useResult
$Res call({
 String id, LocalizedText explanation, bool isCorrect, bool isSelected
});


$LocalizedTextCopyWith<$Res> get explanation;

}
/// @nodoc
class _$LegalQuizGradedOptionCopyWithImpl<$Res>
    implements $LegalQuizGradedOptionCopyWith<$Res> {
  _$LegalQuizGradedOptionCopyWithImpl(this._self, this._then);

  final LegalQuizGradedOption _self;
  final $Res Function(LegalQuizGradedOption) _then;

/// Create a copy of LegalQuizGradedOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? explanation = null,Object? isCorrect = null,Object? isSelected = null,}) {
  return _then(LegalQuizGradedOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as LocalizedText,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of LegalQuizGradedOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get explanation {
  
  return $LocalizedTextCopyWith<$Res>(_self.explanation, (value) {
    return _then(_self.copyWith(explanation: value));
  });
}
}


/// Adds pattern-matching-related methods to [LegalQuizGradedOption].
extension LegalQuizGradedOptionPatterns on LegalQuizGradedOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LegalQuizGradedOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LegalQuizGradedOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LegalQuizGradedOption value)  $default,){
final _that = this;
switch (_that) {
case _LegalQuizGradedOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LegalQuizGradedOption value)?  $default,){
final _that = this;
switch (_that) {
case _LegalQuizGradedOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LocalizedText explanation,  bool isCorrect,  bool isSelected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LegalQuizGradedOption() when $default != null:
return $default(_that.id,_that.explanation,_that.isCorrect,_that.isSelected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LocalizedText explanation,  bool isCorrect,  bool isSelected)  $default,) {final _that = this;
switch (_that) {
case _LegalQuizGradedOption():
return $default(_that.id,_that.explanation,_that.isCorrect,_that.isSelected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LocalizedText explanation,  bool isCorrect,  bool isSelected)?  $default,) {final _that = this;
switch (_that) {
case _LegalQuizGradedOption() when $default != null:
return $default(_that.id,_that.explanation,_that.isCorrect,_that.isSelected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LegalQuizGradedOption implements LegalQuizGradedOption {
  const _LegalQuizGradedOption({required this.id, this.explanation = const LocalizedText(), this.isCorrect = false, this.isSelected = false});
  factory _LegalQuizGradedOption.fromJson(Map<String, dynamic> json) => _$LegalQuizGradedOptionFromJson(json);

@override final  String id;
@override@JsonKey() final  LocalizedText explanation;
@override@JsonKey() final  bool isCorrect;
@override@JsonKey() final  bool isSelected;

/// Create a copy of LegalQuizGradedOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LegalQuizGradedOptionCopyWith<_LegalQuizGradedOption> get copyWith => __$LegalQuizGradedOptionCopyWithImpl<_LegalQuizGradedOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LegalQuizGradedOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LegalQuizGradedOption&&(identical(other.id, id) || other.id == id)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,explanation,isCorrect,isSelected);

@override
String toString() {
  return 'LegalQuizGradedOption(id: $id, explanation: $explanation, isCorrect: $isCorrect, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class _$LegalQuizGradedOptionCopyWith<$Res> implements $LegalQuizGradedOptionCopyWith<$Res> {
  factory _$LegalQuizGradedOptionCopyWith(_LegalQuizGradedOption value, $Res Function(_LegalQuizGradedOption) _then) = __$LegalQuizGradedOptionCopyWithImpl;
@override @useResult
$Res call({
 String id, LocalizedText explanation, bool isCorrect, bool isSelected
});


@override $LocalizedTextCopyWith<$Res> get explanation;

}
/// @nodoc
class __$LegalQuizGradedOptionCopyWithImpl<$Res>
    implements _$LegalQuizGradedOptionCopyWith<$Res> {
  __$LegalQuizGradedOptionCopyWithImpl(this._self, this._then);

  final _LegalQuizGradedOption _self;
  final $Res Function(_LegalQuizGradedOption) _then;

/// Create a copy of LegalQuizGradedOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? explanation = null,Object? isCorrect = null,Object? isSelected = null,}) {
  return _then(_LegalQuizGradedOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as LocalizedText,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of LegalQuizGradedOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get explanation {
  
  return $LocalizedTextCopyWith<$Res>(_self.explanation, (value) {
    return _then(_self.copyWith(explanation: value));
  });
}
}


/// @nodoc
mixin _$EmailVerificationResult {

/// 次に再送できるまでの秒数。0 ならすぐ送れる。
 int get cooldownSeconds; String get message; String? get email;
/// Create a copy of EmailVerificationResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailVerificationResultCopyWith<EmailVerificationResult> get copyWith => _$EmailVerificationResultCopyWithImpl<EmailVerificationResult>(this as EmailVerificationResult, _$identity);

  /// Serializes this EmailVerificationResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailVerificationResult&&(identical(other.cooldownSeconds, cooldownSeconds) || other.cooldownSeconds == cooldownSeconds)&&(identical(other.message, message) || other.message == message)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cooldownSeconds,message,email);

@override
String toString() {
  return 'EmailVerificationResult(cooldownSeconds: $cooldownSeconds, message: $message, email: $email)';
}


}

/// @nodoc
abstract mixin class $EmailVerificationResultCopyWith<$Res>  {
  factory $EmailVerificationResultCopyWith(EmailVerificationResult value, $Res Function(EmailVerificationResult) _then) = _$EmailVerificationResultCopyWithImpl;
@useResult
$Res call({
 int cooldownSeconds, String message, String? email
});




}
/// @nodoc
class _$EmailVerificationResultCopyWithImpl<$Res>
    implements $EmailVerificationResultCopyWith<$Res> {
  _$EmailVerificationResultCopyWithImpl(this._self, this._then);

  final EmailVerificationResult _self;
  final $Res Function(EmailVerificationResult) _then;

/// Create a copy of EmailVerificationResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cooldownSeconds = null,Object? message = null,Object? email = freezed,}) {
  return _then(EmailVerificationResult(
cooldownSeconds: null == cooldownSeconds ? _self.cooldownSeconds : cooldownSeconds // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailVerificationResult].
extension EmailVerificationResultPatterns on EmailVerificationResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmailVerificationResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailVerificationResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmailVerificationResult value)  $default,){
final _that = this;
switch (_that) {
case _EmailVerificationResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmailVerificationResult value)?  $default,){
final _that = this;
switch (_that) {
case _EmailVerificationResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int cooldownSeconds,  String message,  String? email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailVerificationResult() when $default != null:
return $default(_that.cooldownSeconds,_that.message,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int cooldownSeconds,  String message,  String? email)  $default,) {final _that = this;
switch (_that) {
case _EmailVerificationResult():
return $default(_that.cooldownSeconds,_that.message,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int cooldownSeconds,  String message,  String? email)?  $default,) {final _that = this;
switch (_that) {
case _EmailVerificationResult() when $default != null:
return $default(_that.cooldownSeconds,_that.message,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmailVerificationResult implements EmailVerificationResult {
  const _EmailVerificationResult({this.cooldownSeconds = 0, this.message = '', this.email});
  factory _EmailVerificationResult.fromJson(Map<String, dynamic> json) => _$EmailVerificationResultFromJson(json);

/// 次に再送できるまでの秒数。0 ならすぐ送れる。
@override@JsonKey() final  int cooldownSeconds;
@override@JsonKey() final  String message;
@override final  String? email;

/// Create a copy of EmailVerificationResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailVerificationResultCopyWith<_EmailVerificationResult> get copyWith => __$EmailVerificationResultCopyWithImpl<_EmailVerificationResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmailVerificationResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailVerificationResult&&(identical(other.cooldownSeconds, cooldownSeconds) || other.cooldownSeconds == cooldownSeconds)&&(identical(other.message, message) || other.message == message)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cooldownSeconds,message,email);

@override
String toString() {
  return 'EmailVerificationResult(cooldownSeconds: $cooldownSeconds, message: $message, email: $email)';
}


}

/// @nodoc
abstract mixin class _$EmailVerificationResultCopyWith<$Res> implements $EmailVerificationResultCopyWith<$Res> {
  factory _$EmailVerificationResultCopyWith(_EmailVerificationResult value, $Res Function(_EmailVerificationResult) _then) = __$EmailVerificationResultCopyWithImpl;
@override @useResult
$Res call({
 int cooldownSeconds, String message, String? email
});




}
/// @nodoc
class __$EmailVerificationResultCopyWithImpl<$Res>
    implements _$EmailVerificationResultCopyWith<$Res> {
  __$EmailVerificationResultCopyWithImpl(this._self, this._then);

  final _EmailVerificationResult _self;
  final $Res Function(_EmailVerificationResult) _then;

/// Create a copy of EmailVerificationResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cooldownSeconds = null,Object? message = null,Object? email = freezed,}) {
  return _then(_EmailVerificationResult(
cooldownSeconds: null == cooldownSeconds ? _self.cooldownSeconds : cooldownSeconds // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
