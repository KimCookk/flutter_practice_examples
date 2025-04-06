import 'package:flutter/material.dart';
import 'package:flutter_practice_examples/examples/10_navigator/login/home_page.dart';

class NavigatorExample extends StatefulWidget {
  const NavigatorExample({super.key});

  @override
  State<StatefulWidget> createState() => _NavigatorExampleState();
}

class _NavigatorExampleState extends State<NavigatorExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _loginTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingContoller =
      TextEditingController();

  String _realTimeEmailValidateMessage = 'Please enter some text';
  TextStyle _realTimeEmailValidateTextStyle = TextStyle(color: Colors.red);

  String _realTimePasswordValidateMessage = 'Please enter some text';
  TextStyle _realTimePasswordValidateTextStyle = TextStyle(color: Colors.red);

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20.0,
            children: [
              Text("email"),
              TextFormField(
                controller: _loginTextEditingController,
                onChanged: (value) => {
                  // 실시간 검증용
                  if (value.isEmpty)
                    {
                      setState(() {
                        _realTimeEmailValidateMessage =
                            'Please enter some text.';
                        _realTimeEmailValidateTextStyle =
                            TextStyle(color: Colors.red);
                      })
                    }
                  else if (value.contains("@") == false)
                    {
                      setState(() {
                        _realTimeEmailValidateMessage = 'Not email format.';
                        _realTimeEmailValidateTextStyle =
                            TextStyle(color: Colors.red);
                      })
                    }
                  else
                    {
                      setState(() {
                        _realTimeEmailValidateMessage = 'Inputing.';
                        _realTimeEmailValidateTextStyle =
                            TextStyle(color: Colors.blue);
                      })
                    }
                },
                decoration: InputDecoration(
                  hintText: "input email",
                ),
                validator: (String? value) {
                  _email = value ?? "";
                  return null;
                  //  validator의 리턴 값은 "오류 메시지 전용"
                },
              ),
              Text(
                _realTimeEmailValidateMessage,
                style: _realTimeEmailValidateTextStyle,
              ),
              Text("password"),
              TextFormField(
                controller: _passwordTextEditingContoller,
                onChanged: (value) => {
                  if (value.isEmpty)
                    {
                      setState(() {
                        _realTimePasswordValidateMessage =
                            'Please enter some text.';
                        _realTimePasswordValidateTextStyle =
                            TextStyle(color: Colors.red);
                      })
                    }
                  else
                    {
                      setState(() {
                        _realTimePasswordValidateMessage = 'Inputing.';
                        _realTimePasswordValidateTextStyle =
                            TextStyle(color: Colors.blue);
                      })
                    }
                },
                decoration: InputDecoration(
                  hintText: "input password",
                ),
                obscureText: true,
                validator: (String? value) {
                  _password = value ?? "";
                  return null;
                },
              ),
              Text(
                _realTimePasswordValidateMessage,
                style: _realTimePasswordValidateTextStyle,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: validateLogin,
                  child: Text("Login"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void validateLogin() {
    _formKey.currentState?.validate();
    if (_email == "test@test" && _password == "test") {
      goToHome();
    }
  }

  void goToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return HomePage();
        },
      ),
    );
  }
}
