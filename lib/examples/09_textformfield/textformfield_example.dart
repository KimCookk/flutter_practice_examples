import 'package:flutter/material.dart';

class TextFormFieldExample extends StatefulWidget {
  const TextFormFieldExample({super.key});

  @override
  State<StatefulWidget> createState() => _TextFormFieldExampleState();
}

class _TextFormFieldExampleState extends State<TextFormFieldExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _loginTextEditingController =
      TextEditingController();

  String _realTimeValidateMessage = 'Please enter some text';
  TextStyle _realTimeValidateTextStyle = TextStyle(color: Colors.red);

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
                  // if (value == null || value.isEmpty) {
                  //   return 'Please enter some text';
                  // } else if (value.contains("@") == false) {
                  //   return 'Not email format';
                  // } else {
                  //   return null;
                  // }
                  if (value.isEmpty)
                    {
                      setState(() {
                        _realTimeValidateMessage = 'Please enter some text.';
                        _realTimeValidateTextStyle =
                            TextStyle(color: Colors.red);
                      })
                    }
                  else if (value.contains("@") == false)
                    {
                      setState(() {
                        _realTimeValidateMessage = 'Not email format.';
                        _realTimeValidateTextStyle =
                            TextStyle(color: Colors.red);
                      })
                    }
                  else
                    {
                      setState(() {
                        _realTimeValidateMessage = 'Inputing.';
                        _realTimeValidateTextStyle =
                            TextStyle(color: Colors.blue);
                      })
                    }
                },
                decoration: InputDecoration(
                  hintText: "input email",
                ),
                validator: (String? value) {
                  return null;

                  //  validator의 리턴 값은 "오류 메시지 전용"
                },
              ),
              Text(
                _realTimeValidateMessage,
                style: _realTimeValidateTextStyle,
              ),
              Text("password"),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "input password",
                ),
                obscureText: true,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
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
  }
}
