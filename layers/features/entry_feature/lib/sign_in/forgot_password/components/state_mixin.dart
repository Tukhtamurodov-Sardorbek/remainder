part of '../forgot_password_page.dart';

mixin _StateHelper on State<ForgotPasswordPage> {
  late final TextEditingController _emailCtrl;
  ({String label, String hint})? _data;

  ({String label, String hint}) get data =>
      _data ??= (label: 'Email', hint: 'Enter your email address');

  @override
  void initState() {
    super.initState();
    _emailCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }
}
