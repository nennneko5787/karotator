import 'package:freezed_annotation/freezed_annotation.dart';

part 'legal_quiz.freezed.dart';
part 'legal_quiz.g.dart';

/// `{ja, en}` の組。設問・選択肢・解説がこの形で来る。
@freezed
abstract class LocalizedText with _$LocalizedText {
  const factory LocalizedText({
    @Default('') String ja,
    @Default('') String en,
  }) = _LocalizedText;

  factory LocalizedText.fromJson(Map<String, Object?> json) =>
      _$LocalizedTextFromJson(json);
}

extension LocalizedTextX on LocalizedText {
  /// 画面に出す文字列。今は日本語固定で、無ければ英語に落とす。
  /// 英語表示を入れるときはここだけ直せばよい。
  String get text => ja.isNotEmpty ? ja : en;
}

/// 規約理解クイズ。`GET auth/legal-quiz`。
///
/// 設問数は既定 5 問だが数え打ちしない (REQ-GATE-023)。
@freezed
abstract class LegalQuiz with _$LegalQuiz {
  const factory LegalQuiz({
    /// 採点時にそのまま送り返す。実測で 1.8KB ほどある。
    @Default('') String token,

    /// [token] の寿命。実測 900（15 分）。
    @Default(0) int expiresInSeconds,

    /// 合格に必要な正解数。実測は設問数と同じ 5 で、全問正解が要る。
    @Default(0) int requiredCorrectAnswers,

    @Default([]) List<LegalQuizQuestion> questions,
  }) = _LegalQuiz;

  factory LegalQuiz.fromJson(Map<String, Object?> json) =>
      _$LegalQuizFromJson(json);
}

@freezed
abstract class LegalQuizQuestion with _$LegalQuizQuestion {
  const factory LegalQuizQuestion({
    /// `privacy-minors-careful` のようなスラグ。数値ではない。
    required String id,
    @Default(LocalizedText()) LocalizedText prompt,

    /// 根拠となる規約の名前。
    @Default(LocalizedText()) LocalizedText document,

    /// Karotter Web 上のパス。`/terms` など。`legalDocuments` の `path` と対応する。
    @Default('') String documentPath,

    @Default([]) List<LegalQuizOption> options,
  }) = _LegalQuizQuestion;

  factory LegalQuizQuestion.fromJson(Map<String, Object?> json) =>
      _$LegalQuizQuestionFromJson(json);
}

@freezed
abstract class LegalQuizOption with _$LegalQuizOption {
  const factory LegalQuizOption({
    /// `c15e08d3385c0822` のような 16 進の文字列。数値ではない。
    required String id,
    @Default(LocalizedText()) LocalizedText label,
  }) = _LegalQuizOption;

  factory LegalQuizOption.fromJson(Map<String, Object?> json) =>
      _$LegalQuizOptionFromJson(json);
}

/// 採点結果。`POST auth/legal-quiz/grade`。
@freezed
abstract class LegalQuizResult with _$LegalQuizResult {
  const factory LegalQuizResult({
    /// 今回の回答が合格点に達したか。
    @Default(false) bool passed,

    /// アカウントに「合格済み」として記録されたか。
    ///
    /// [passed] とは**別物**。未ログインだと合格しても記録されない。
    @Default(false) bool legalQuizPassed,

    @Default([]) List<LegalQuizGradedQuestion> questions,
  }) = _LegalQuizResult;

  factory LegalQuizResult.fromJson(Map<String, Object?> json) =>
      _$LegalQuizResultFromJson(json);
}

@freezed
abstract class LegalQuizGradedQuestion with _$LegalQuizGradedQuestion {
  const factory LegalQuizGradedQuestion({
    required String id,
    @Default([]) List<LegalQuizGradedOption> options,
  }) = _LegalQuizGradedQuestion;

  factory LegalQuizGradedQuestion.fromJson(Map<String, Object?> json) =>
      _$LegalQuizGradedQuestionFromJson(json);
}

@freezed
abstract class LegalQuizGradedOption with _$LegalQuizGradedOption {
  const factory LegalQuizGradedOption({
    required String id,
    @Default(LocalizedText()) LocalizedText explanation,
    @Default(false) bool isCorrect,
    @Default(false) bool isSelected,
  }) = _LegalQuizGradedOption;

  factory LegalQuizGradedOption.fromJson(Map<String, Object?> json) =>
      _$LegalQuizGradedOptionFromJson(json);
}

extension LegalQuizResultX on LegalQuizResult {
  /// `設問ID:選択肢ID` で解説を引けるようにする。Web も同じ畳み方をしている。
  Map<String, LegalQuizGradedOption> get byOption => {
    for (final question in questions)
      for (final option in question.options) '${question.id}:${option.id}': option,
  };
}

/// メールアドレスの登録・確認メール再送の応答。
@freezed
abstract class EmailVerificationResult with _$EmailVerificationResult {
  const factory EmailVerificationResult({
    /// 次に再送できるまでの秒数。0 ならすぐ送れる。
    @Default(0) int cooldownSeconds,

    @Default('') String message,
    String? email,
  }) = _EmailVerificationResult;

  factory EmailVerificationResult.fromJson(Map<String, Object?> json) =>
      _$EmailVerificationResultFromJson(json);
}
