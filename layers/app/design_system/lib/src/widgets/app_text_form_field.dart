import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends TextFormField {
  AppTextFormField({
    required BuildContext context,
    super.key,
    super.focusNode,
    super.keyboardType,
    super.autofocus,
    super.readOnly,
    super.obscuringCharacter,
    super.maxLines,
    super.minLines,
    super.onChanged,
    super.onTap,
    super.onEditingComplete,
    super.onFieldSubmitted,
    super.onSaved,
    super.validator,
    super.inputFormatters,
    super.enabled,
    super.initialValue,
    super.selectionControls,
    super.enableSuggestions,
    super.autocorrect,
    super.cursorColor,
    super.textAlignVertical,
    super.textInputAction,
    super.maxLength,
    super.onTapOutside,
    super.textCapitalization,
    bool obscureText = false,
    TextFieldType type = const TextFieldType.basic(),
    TextEditingController? controller,
    String? labelText,
    Color? labelColor,
    Color? textColor,
    Widget? prefix,
    String? prefixText,
    Widget? prefixIcon,
    Widget? suffix,
    String? suffixText,
    Widget? suffixIcon,
    InputBorder? border,
    InputBorder? disabledBorder,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? focusedErrorBorder,
    InputBorder? errorBorder,
    AutovalidateMode? autoValidateMode,
    EdgeInsets? contentPadding,
    bool? isDense,
    String? hintText,
    String? counterText,
    BoxConstraints? prefixIconConstraints,
    BoxConstraints? suffixIconConstraints,
    int errorMaxLines = 3,
    bool? filled,
    Color? fillColor,
    FloatingLabelBehavior? floatingLabelBehavior,
    String? helperText,
    TextStyle? style,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    TextStyle? floatingLabelStyle,
    TextStyle? prefixStyle,
    TextStyle? errorStyle,
    TextStyle? suffixStyle,
  }) : super(
         controller: controller,
         obscureText: obscureText,
         autovalidateMode: autoValidateMode,
         style:
             style ??
             Theme.of(context).textTheme.bodySmall?.modifier(
               color: textColor ?? AppColor.text.shade800,
             ),
         decoration: InputDecoration(
           helperText: helperText,
           counterText: counterText,
           alignLabelWithHint: false,
           prefixIconConstraints: prefixIconConstraints,
           floatingLabelBehavior: floatingLabelBehavior,
           prefix: prefix,
           filled: filled,
           fillColor: fillColor,
           isDense: isDense,
           hintText: hintText,
           hintStyle: hintStyle ?? TextStyle(color: labelColor),
           contentPadding: contentPadding,
           labelText: labelText,
           labelStyle:
               labelStyle ?? TextStyle(color: labelColor, fontSize: 14.sp),
           floatingLabelStyle:
               floatingLabelStyle ?? TextStyle(height: 0.8, color: labelColor),
           prefixText: prefixText,
           prefixIcon: prefixIcon,
           prefixStyle:
               prefixStyle ??
               TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
           errorStyle: errorStyle ?? TextStyle(color: AppColor.error.shade500),
           errorMaxLines: errorMaxLines,
           errorBorder:
               errorBorder ??
               OutlineInputBorder(
                 borderSide: BorderSide(color: AppColor.error.shade500),
                 borderRadius: BorderRadius.circular(
                   DesignConstants.borderRadius12,
                 ),
               ),
           suffix: suffix,
           suffixText: suffixText,
           suffixIcon:
               suffixIcon ??
               (controller == null
                   ? null
                   : ValueListenableBuilder(
                       valueListenable: controller,
                       builder: (context, value, _) {
                         return AnimatedSwitcher(
                           duration: const Duration(milliseconds: 250),
                           child: value.text.isEmpty
                               ? SizedBox.shrink()
                               : IconButton(
                                   iconSize: 24.r,
                                   onPressed: () {
                                     type.when(
                                       basic: () {
                                         controller.clear();
                                       },
                                       password: (notifier) {
                                         notifier.value = !obscureText;
                                       },
                                     );
                                   },
                                   icon: type.when(
                                     basic: () => Icon(
                                       Icons.close,
                                       color: AppColor.neutral.shade600,
                                     ),
                                     password: (_) {
                                       final icon = obscureText
                                           ? AppAsset.icEye
                                           : AppAsset.icEyeClosed;
                                       return icon.displayImage(
                                         type: AssetType.svg,
                                         color: AppColor.neutral.shade600,
                                       );
                                     },
                                   ),
                                 ),
                         );
                       },
                     )),
           suffixIconConstraints: suffixIconConstraints,
           suffixStyle:
               suffixStyle ?? TextStyle(color: textColor, fontSize: 16),
           border:
               border ??
               OutlineInputBorder(
                 borderSide: BorderSide(color: AppColor.neutral.shade100),
                 borderRadius: BorderRadius.circular(
                   DesignConstants.borderRadius12,
                 ),
               ),
           disabledBorder:
               disabledBorder ??
               OutlineInputBorder(
                 borderSide: BorderSide(color: AppColor.neutral.shade100),
                 borderRadius: BorderRadius.circular(
                   DesignConstants.borderRadius12,
                 ),
               ),
           enabledBorder:
               enabledBorder ??
               OutlineInputBorder(
                 borderSide: BorderSide(color: AppColor.neutral.shade100),
                 borderRadius: BorderRadius.circular(
                   DesignConstants.borderRadius12,
                 ),
               ),
           focusedBorder:
               focusedBorder ??
               OutlineInputBorder(
                 borderSide: BorderSide.none,
                 borderRadius: BorderRadius.circular(
                   DesignConstants.borderRadius12,
                 ),
               ),
           focusedErrorBorder:
               focusedErrorBorder ??
               OutlineInputBorder(
                 borderSide: BorderSide.none,
                 borderRadius: BorderRadius.circular(
                   DesignConstants.borderRadius12,
                 ),
               ),
         ),
       );
}

sealed class TextFieldType {
  const TextFieldType._();

  const factory TextFieldType.basic() = _BasicTextField;

  const factory TextFieldType.password(ValueNotifier<bool> notifier) =
      _PasswordTextField;

  T when<T>({
    required T Function() basic,
    required T Function(ValueNotifier<bool>) password,
  }) {
    return switch (this) {
      _BasicTextField() => basic(),
      _PasswordTextField(:final notifier) => password(notifier),
    };
  }

  T? whenOrNull<T>({
    T Function()? basic,
    T Function(ValueNotifier<bool>)? password,
  }) {
    return switch (this) {
      _BasicTextField() => basic?.call(),
      _PasswordTextField(:final notifier) => password?.call(notifier),
    };
  }

  T maybeWhen<T>({
    T Function()? basic,
    T Function(ValueNotifier<bool>)? password,
    required T Function() orElse,
  }) {
    return whenOrNull(basic: basic, password: password) ?? orElse();
  }
}

final class _BasicTextField extends TextFieldType {
  const _BasicTextField() : super._();
}

final class _PasswordTextField extends TextFieldType {
  final ValueNotifier<bool> notifier;

  const _PasswordTextField(this.notifier) : super._();
}
