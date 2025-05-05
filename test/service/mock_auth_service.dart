import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_practice_examples/examples/19_di/get_it_combine_provider/auth_service.dart';
import 'package:flutter_practice_examples/examples/19_di/get_it_combine_provider/login_view_model.dart';

class MockAuthService extends Mock implements AuthService {}

void main() {
  late MockAuthService mockAuthService;
  late LoginViewModel viewModel;

  setUp(() {
    mockAuthService = MockAuthService();
    viewModel = LoginViewModel(mockAuthService);
  });

  test('로그인 성공 시 isLogin이 true가 되어야 한다.', () async {
    when(() => mockAuthService.login(any(), any()))
        .thenAnswer((_) async => true);

    await viewModel.login('flutter_dev', 'pass');
    expect(viewModel.isLogin, isTrue);
  });

  test('로그인 실패 시 isLogin이 false가 되어야 한다.', () async {
    when(() => mockAuthService.login(any(), any()))
        .thenAnswer((_) async => false);

    await viewModel.login('wrong', 'wrong');
    expect(viewModel.isLogin, isFalse);
  });
}
