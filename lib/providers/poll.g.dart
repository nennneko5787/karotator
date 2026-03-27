// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PollNotifier)
final pollProvider = PollNotifierFamily._();

final class PollNotifierProvider
    extends $NotifierProvider<PollNotifier, PollState> {
  PollNotifierProvider._({
    required PollNotifierFamily super.from,
    required PollState super.argument,
  }) : super(
         retry: null,
         name: r'pollProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pollNotifierHash();

  @override
  String toString() {
    return r'pollProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PollNotifier create() => PollNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PollState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PollState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PollNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pollNotifierHash() => r'4bec375ca36536166f55bac69f7e6651a0c219ea';

final class PollNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          PollNotifier,
          PollState,
          PollState,
          PollState,
          PollState
        > {
  PollNotifierFamily._()
    : super(
        retry: null,
        name: r'pollProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PollNotifierProvider call(PollState post) =>
      PollNotifierProvider._(argument: post, from: this);

  @override
  String toString() => r'pollProvider';
}

abstract class _$PollNotifier extends $Notifier<PollState> {
  late final _$args = ref.$arg as PollState;
  PollState get post => _$args;

  PollState build(PollState post);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PollState, PollState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PollState, PollState>,
              PollState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
