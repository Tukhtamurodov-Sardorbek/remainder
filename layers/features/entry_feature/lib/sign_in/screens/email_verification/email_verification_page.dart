import 'package:core/core.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();

  // Static method to access the state from descendant widgets
  static _EmailVerificationPageState of(BuildContext context) {
    final state = context.findAncestorStateOfType<_EmailVerificationPageState>();
    assert(state != null, 'No EmailVerificationPage ancestor found in the widget tree');
    return state!;
  }
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
