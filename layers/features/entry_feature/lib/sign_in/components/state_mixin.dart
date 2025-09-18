part of '../sign_in_page.dart';

mixin _StateHelper on State<SignInPage> {
  late final TextEditingController _emailCtrl, _passwordCtrl;
  late final ValueNotifier<bool> _obscurePassword;
  List<
    ({
      String label,
      String hint,
      TextEditingController ctrl,
      FocusNode node,
      bool isPassword,
    })
  >?
  _data;

  List<
    ({
      String label,
      String hint,
      TextEditingController ctrl,
      FocusNode node,
      bool isPassword,
    })
  >
  get data => _data ??= [
    (
      label: 'Email',
      hint: 'Enter your email address',
      ctrl: _emailCtrl,
      node: FocusNode(),
      isPassword: false,
    ),
    (
      label: 'Password',
      hint: 'Enter your password',
      ctrl: _passwordCtrl,
      node: FocusNode(),
      isPassword: true,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _emailCtrl = TextEditingController();
    _passwordCtrl = TextEditingController();
    _obscurePassword = ValueNotifier(true);
  }

  @override
  void dispose() {
    _obscurePassword.dispose();
    _passwordCtrl.dispose();
    _emailCtrl.dispose();
    for (var d in data) {
      d.node.dispose();
    }

    super.dispose();
  }
}
