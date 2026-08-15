// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocalizedText _$LocalizedTextFromJson(Map<String, dynamic> json) =>
    _LocalizedText(
      ja: json['ja'] as String? ?? '',
      en: json['en'] as String? ?? '',
    );

Map<String, dynamic> _$LocalizedTextToJson(_LocalizedText instance) =>
    <String, dynamic>{'ja': instance.ja, 'en': instance.en};

_LegalQuiz _$LegalQuizFromJson(Map<String, dynamic> json) => _LegalQuiz(
  token: json['token'] as String? ?? '',
  expiresInSeconds: (json['expiresInSeconds'] as num?)?.toInt() ?? 0,
  requiredCorrectAnswers:
      (json['requiredCorrectAnswers'] as num?)?.toInt() ?? 0,
  questions:
      (json['questions'] as List<dynamic>?)
          ?.map((e) => LegalQuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$LegalQuizToJson(_LegalQuiz instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiresInSeconds': instance.expiresInSeconds,
      'requiredCorrectAnswers': instance.requiredCorrectAnswers,
      'questions': instance.questions,
    };

_LegalQuizQuestion _$LegalQuizQuestionFromJson(Map<String, dynamic> json) =>
    _LegalQuizQuestion(
      id: json['id'] as String,
      prompt: json['prompt'] == null
          ? const LocalizedText()
          : LocalizedText.fromJson(json['prompt'] as Map<String, dynamic>),
      document: json['document'] == null
          ? const LocalizedText()
          : LocalizedText.fromJson(json['document'] as Map<String, dynamic>),
      documentPath: json['documentPath'] as String? ?? '',
      options:
          (json['options'] as List<dynamic>?)
              ?.map((e) => LegalQuizOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LegalQuizQuestionToJson(_LegalQuizQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prompt': instance.prompt,
      'document': instance.document,
      'documentPath': instance.documentPath,
      'options': instance.options,
    };

_LegalQuizOption _$LegalQuizOptionFromJson(Map<String, dynamic> json) =>
    _LegalQuizOption(
      id: json['id'] as String,
      label: json['label'] == null
          ? const LocalizedText()
          : LocalizedText.fromJson(json['label'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LegalQuizOptionToJson(_LegalQuizOption instance) =>
    <String, dynamic>{'id': instance.id, 'label': instance.label};

_LegalQuizResult _$LegalQuizResultFromJson(Map<String, dynamic> json) =>
    _LegalQuizResult(
      passed: json['passed'] as bool? ?? false,
      legalQuizPassed: json['legalQuizPassed'] as bool? ?? false,
      questions:
          (json['questions'] as List<dynamic>?)
              ?.map(
                (e) =>
                    LegalQuizGradedQuestion.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LegalQuizResultToJson(_LegalQuizResult instance) =>
    <String, dynamic>{
      'passed': instance.passed,
      'legalQuizPassed': instance.legalQuizPassed,
      'questions': instance.questions,
    };

_LegalQuizGradedQuestion _$LegalQuizGradedQuestionFromJson(
  Map<String, dynamic> json,
) => _LegalQuizGradedQuestion(
  id: json['id'] as String,
  options:
      (json['options'] as List<dynamic>?)
          ?.map(
            (e) => LegalQuizGradedOption.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$LegalQuizGradedQuestionToJson(
  _LegalQuizGradedQuestion instance,
) => <String, dynamic>{'id': instance.id, 'options': instance.options};

_LegalQuizGradedOption _$LegalQuizGradedOptionFromJson(
  Map<String, dynamic> json,
) => _LegalQuizGradedOption(
  id: json['id'] as String,
  explanation: json['explanation'] == null
      ? const LocalizedText()
      : LocalizedText.fromJson(json['explanation'] as Map<String, dynamic>),
  isCorrect: json['isCorrect'] as bool? ?? false,
  isSelected: json['isSelected'] as bool? ?? false,
);

Map<String, dynamic> _$LegalQuizGradedOptionToJson(
  _LegalQuizGradedOption instance,
) => <String, dynamic>{
  'id': instance.id,
  'explanation': instance.explanation,
  'isCorrect': instance.isCorrect,
  'isSelected': instance.isSelected,
};

_EmailVerificationResult _$EmailVerificationResultFromJson(
  Map<String, dynamic> json,
) => _EmailVerificationResult(
  cooldownSeconds: (json['cooldownSeconds'] as num?)?.toInt() ?? 0,
  message: json['message'] as String? ?? '',
  email: json['email'] as String?,
);

Map<String, dynamic> _$EmailVerificationResultToJson(
  _EmailVerificationResult instance,
) => <String, dynamic>{
  'cooldownSeconds': instance.cooldownSeconds,
  'message': instance.message,
  'email': instance.email,
};
