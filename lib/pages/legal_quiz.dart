import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:karotator/api/karotter_api.dart";
import "package:karotator/objects/legal.dart";
import "package:karotator/objects/legal_documents.dart";
import "package:karotator/objects/legal_quiz.dart";
import "package:karotator/pages/legal.dart";
import "package:karotator/providers/auth_user.dart";

/// 規約理解クイズ。
///
/// 1 回合格するとアカウントに記録され、メール認証と合わせて投稿制限が解ける。
/// 何度でも別の問題に挑戦できる（仕様: specs/004-posting-restrictions）。
class LegalQuizPage extends ConsumerStatefulWidget {
  const LegalQuizPage({super.key});

  @override
  ConsumerState<LegalQuizPage> createState() => _LegalQuizPageState();
}

class _LegalQuizPageState extends ConsumerState<LegalQuizPage> {
  LegalQuiz? _quiz;

  /// 設問 ID → 選択肢 ID。どちらも文字列。
  final Map<String, String> _answers = {};

  /// 採点後の解説。`設問ID:選択肢ID` で引く。空なら未採点。
  Map<String, LegalQuizGradedOption> _graded = {};

  bool _loading = true;
  bool _grading = false;
  String? _error;
  String? _resultMessage;
  bool _passed = false;
  int _passedCount = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  /// 問題を取り直す (REQ-GATE-007, 012)。
  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
      _resultMessage = null;
      _graded = {};
      _answers.clear();
    });

    try {
      final quiz = await KarotterApi().auth.legalQuiz();
      if (!mounted) return;
      setState(() => _quiz = quiz);
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      if (!mounted) return;
      // 失敗しても画面は開いたままにして、やり直せるようにする (REQ-GATE-022)。
      setState(() {
        _quiz = null;
        _error = "規約クイズを読み込めませんでした。";
      });
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  bool get _canGrade {
    final quiz = _quiz;
    return quiz != null &&
        quiz.questions.isNotEmpty &&
        _answers.length == quiz.questions.length &&
        _graded.isEmpty &&
        !_grading;
  }

  Future<void> _grade() async {
    final quiz = _quiz;
    if (quiz == null || !_canGrade) return;

    setState(() {
      _grading = true;
      _error = null;
    });

    try {
      final result = await KarotterApi().auth.gradeLegalQuiz(
        token: quiz.token,
        answers: _answers,
      );
      if (!mounted) return;

      // 記録されたときだけ手元の控えを直す。`passed` だけでは立てない。
      if (result.passed && result.legalQuizPassed) {
        await ref
            .read(authUserProvider.notifier)
            .patch((user) => user.copyWith(legalQuizPassed: true));
      }
      if (!mounted) return;

      setState(() {
        _graded = result.byOption;
        _passed = result.passed;
        if (result.passed) _passedCount++;
        _resultMessage = _passMessage(result);
      });
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      if (!mounted) return;
      setState(() => _error = "採点できませんでした。もう一度お試しください。");
    } finally {
      if (mounted) setState(() => _grading = false);
    }
  }

  /// 合否の文言 (REQ-GATE-010, 011)。Karotter Web の 3 分岐をそのまま写す。
  String _passMessage(LegalQuizResult result) {
    if (!result.passed) return "不合格です。解説を読んで、別の問題に挑戦してください。";

    final emailVerified = ref.read(authUserProvider)?.emailVerified ?? false;
    if (result.legalQuizPassed && emailVerified) {
      return "合格です。投稿制限が解除されました。";
    }
    if (result.legalQuizPassed) {
      return "合格です。アカウントへの記録後、メール認証も完了すると投稿制限が解除されます。";
    }
    return "合格です。別の問題にも何回でも挑戦できます。";
  }

  @override
  Widget build(BuildContext context) {
    final quiz = _quiz;

    return Scaffold(
      appBar: AppBar(title: const Text("規約理解クイズ")),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const _MinorNotice(),
                if (_passedCount > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      "合格回数: $_passedCount",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                const SizedBox(height: 16),
                _Controls(
                  canGrade: _canGrade,
                  grading: _grading,
                  graded: _graded.isNotEmpty,
                  onGrade: _grade,
                  onReload: _load,
                ),
                if (_error != null) ...[
                  const SizedBox(height: 12),
                  _Notice(text: _error!, tone: _Tone.error),
                ],
                if (_resultMessage != null) ...[
                  const SizedBox(height: 12),
                  _Notice(
                    text: _resultMessage!,
                    tone: _passed ? _Tone.success : _Tone.warning,
                  ),
                ],
                const SizedBox(height: 16),
                if (quiz != null)
                  for (final (index, question) in quiz.questions.indexed) ...[
                    _QuestionCard(
                      index: index,
                      question: question,
                      selected: _answers[question.id],
                      graded: _graded,
                      // 採点後は選び直せない。引き直しは「別の問題に挑戦」。
                      onSelected: _graded.isNotEmpty
                          ? null
                          : (optionId) => setState(() {
                              _answers[question.id] = optionId;
                              _resultMessage = null;
                            }),
                    ),
                    const SizedBox(height: 12),
                  ],
              ],
            ),
    );
  }
}

/// 未成年向けの案内 (REQ-GATE-014)。ひらがなを併記する。
class _MinorNotice extends StatelessWidget {
  const _MinorNotice();

  @override
  Widget build(BuildContext context) {
    final subColor = Theme.of(context).secondaryHeaderColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(
          "各種規約・ポリシーの理解を確認するクイズです。",
          style: TextStyle(color: subColor),
        ),
        Text(
          "18歳未満の方は、保護者・法定代理人と一緒に取り組めます。",
          style: TextStyle(color: subColor, fontSize: 13),
        ),
        Text(
          "じゅうはっさいよりちいさいひとは おうちのひとや ほうていだいりにんと いっしょに といていいよ",
          style: TextStyle(color: subColor, fontSize: 13),
        ),
      ],
    );
  }
}

class _Controls extends StatelessWidget {
  const _Controls({
    required this.canGrade,
    required this.grading,
    required this.graded,
    required this.onGrade,
    required this.onReload,
  });

  final bool canGrade;
  final bool grading;
  final bool graded;
  final VoidCallback onGrade;
  final VoidCallback onReload;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        // 全問埋まるまで押せない (REQ-GATE-008)。
        FilledButton(
          onPressed: canGrade ? onGrade : null,
          child: Text(grading ? "採点中..." : "採点する"),
        ),
        OutlinedButton(
          onPressed: grading ? null : onReload,
          child: Text(graded ? "別の問題に挑戦" : "問題を引き直す"),
        ),
      ],
    );
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({
    required this.index,
    required this.question,
    required this.selected,
    required this.graded,
    required this.onSelected,
  });

  final int index;
  final LegalQuizQuestion question;
  final String? selected;
  final Map<String, LegalQuizGradedOption> graded;
  final ValueChanged<String>? onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              CircleAvatar(radius: 11, child: Text("${index + 1}")),
              Expanded(
                child: Text(
                  question.prompt.text,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          _DocumentLink(question: question),
          for (final option in question.options)
            _OptionTile(
              option: option,
              questionId: question.id,
              selected: selected == option.id,
              graded: graded["${question.id}:${option.id}"],
              onTap: onSelected == null ? null : () => onSelected!(option.id),
            ),
        ],
      ),
    );
  }
}

/// 根拠となる規約へ飛ばす (REQ-GATE-013)。
///
/// `documentPath` は Web のパス（`/terms` など）。`legalDocuments` に同じ
/// `path` があればアプリ内で開く。見つからなければリンクを出さない。
class _DocumentLink extends StatelessWidget {
  const _DocumentLink({required this.question});

  final LegalQuizQuestion question;

  @override
  Widget build(BuildContext context) {
    final label = question.document.text;
    if (label.isEmpty || question.documentPath.isEmpty) {
      return const SizedBox.shrink();
    }

    LegalDocumentRef? ref;
    for (final doc in legalDocuments) {
      if (doc.path == question.documentPath) {
        ref = doc;
        break;
      }
    }
    if (ref == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: InkWell(
        onTap: () => openLegalDocument(context, ref!),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF1D9BF0),
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.option,
    required this.questionId,
    required this.selected,
    required this.graded,
    required this.onTap,
  });

  final LegalQuizOption option;
  final String questionId;
  final bool selected;
  final LegalQuizGradedOption? graded;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final result = graded;

    // 採点後は 正解 / 自分が選んだ / それ以外 で色を分ける (REQ-GATE-009)。
    final Color? explanationColor = result == null
        ? null
        : result.isCorrect
        ? const Color(0xFF00A06B)
        : result.isSelected
        ? const Color(0xFFC77700)
        : theme.secondaryHeaderColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            // 行全体が押せるので、丸は表示だけ。Radio を置くと
            // RadioGroup 必須の非推奨 API になる。
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Icon(
                selected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                size: 18,
                color: selected
                    ? const Color(0xFF1D9BF0)
                    : theme.secondaryHeaderColor,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(option.label.text),
                  ),
                  if (result != null && result.explanation.text.isNotEmpty)
                    Text(
                      result.explanation.text,
                      style: TextStyle(fontSize: 12, color: explanationColor),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _Tone { success, warning, error }

class _Notice extends StatelessWidget {
  const _Notice({required this.text, required this.tone});

  final String text;
  final _Tone tone;

  @override
  Widget build(BuildContext context) {
    final color = switch (tone) {
      _Tone.success => const Color(0xFF00A06B),
      _Tone.warning => const Color(0xFFC77700),
      _Tone.error => Theme.of(context).colorScheme.error,
    };

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Text(text, style: TextStyle(color: color)),
    );
  }
}
