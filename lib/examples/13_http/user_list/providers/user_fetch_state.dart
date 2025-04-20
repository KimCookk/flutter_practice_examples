// pubspec.yaml 세팅 후
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_fetch_state.freezed.dart';

@freezed
class UserFetchState with _$UserFetchState {
  const factory UserFetchState.success(List<dynamic> users) = Success;
  const factory UserFetchState.error(String message) = Error;
  const factory UserFetchState.loading() = Loading;
  const factory UserFetchState.initial() = Initial;
}
