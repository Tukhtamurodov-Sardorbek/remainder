import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends TextFormField {
  AppTextFormField._({
    super.key,
    super.groupId,
    super.controller,
    super.initialValue,
    super.focusNode,
    super.forceErrorText,
    super.decoration,
    super.keyboardType,
    super.textCapitalization,
    super.textInputAction,
    super.style,
    super.strutStyle,
    super.textDirection,
    super.textAlign,
    super.textAlignVertical,
    super.autofocus,
    super.readOnly,
    super.showCursor,
    super.obscuringCharacter,
    super.obscureText,
    super.autocorrect,
    super.smartDashesType,
    super.smartQuotesType,
    super.enableSuggestions,
    super.maxLengthEnforcement,
    super.maxLines,
    super.minLines,
    super.expands,
    super.maxLength,
    super.onChanged,
    super.onTap,
    super.onTapAlwaysCalled,
    super.onTapOutside,
    super.onTapUpOutside,
    super.onEditingComplete,
    super.onFieldSubmitted,
    super.onSaved,
    super.validator,
    super.errorBuilder,
    super.inputFormatters,
    super.enabled,
    super.ignorePointers,
    super.cursorWidth,
    super.cursorHeight,
    super.cursorRadius,
    super.cursorColor,
    super.cursorErrorColor,
    super.keyboardAppearance,
    super.scrollPadding,
    super.enableInteractiveSelection,
    super.selectAllOnFocus,
    super.selectionControls,
    super.buildCounter,
    super.scrollPhysics,
    super.autofillHints,
    super.autovalidateMode,
    super.scrollController,
    super.restorationId,
    super.enableIMEPersonalizedLearning,
    super.mouseCursor,
    super.contextMenuBuilder,
    super.spellCheckConfiguration,
    super.magnifierConfiguration,
    super.undoController,
    super.onAppPrivateCommand,
    super.cursorOpacityAnimates,
    super.selectionHeightStyle,
    super.selectionWidthStyle,
    super.dragStartBehavior,
    super.contentInsertionConfiguration,
    super.statesController,
    super.clipBehavior,
  });

  factory AppTextFormField.__({
    Key? key,
    required BuildContext context,
    TextEditingController? controller,
    String? initialValue,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    bool? showCursor,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autocorrect = true,
    bool enableSuggestions = true,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    ValueChanged<String>? onChanged,
    GestureTapCallback? onTap,
    TapRegionCallback? onTapOutside,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    Color? cursorColor,
    TextSelectionControls? selectionControls,
    AutovalidateMode? autoValidateMode,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    TextStyle? floatingLabelStyle,
    TextStyle? prefixStyle,
    TextStyle? suffixStyle,
    TextFieldType type = const TextFieldType.basic(),
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
    EdgeInsets? contentPadding,
    bool? isDense,
    String? hintText,
    String? counterText,
    BoxConstraints? prefixIconConstraints,
    BoxConstraints? suffixIconConstraints,
    bool? filled,
    Color? fillColor,
    FloatingLabelBehavior? floatingLabelBehavior,
    String? helperText,
  }) {
    return AppTextFormField._(
      key: key,
      controller: controller,
      initialValue: initialValue,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      autofocus: autofocus,
      readOnly: readOnly,
      showCursor: showCursor,
      obscuringCharacter: obscuringCharacter,
      obscureText: obscureText,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      maxLength: maxLength,
      onChanged: onChanged,
      onTap: onTap,
      onTapOutside: onTapOutside,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
      inputFormatters: inputFormatters,
      enabled: enabled,
      cursorColor: cursorColor,
      selectionControls: selectionControls,
      autovalidateMode: autoValidateMode,

      style:
          style ??
          Theme.of(context).textTheme.bodySmall?.modifier(
            color: textColor ?? AppColor.text.shade800,
          ),
      errorBuilder: (context, errorText) {
        return const SizedBox.shrink();
      },
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
        errorStyle: TextStyle(height: 0, color: Colors.transparent),
        contentPadding: contentPadding,
        labelText: labelText,
        labelStyle: labelStyle ?? TextStyle(color: labelColor, fontSize: 14.sp),
        floatingLabelStyle:
            floatingLabelStyle ?? TextStyle(height: 0.8, color: labelColor),
        prefixText: prefixText,
        prefixIcon: prefixIcon,
        prefixStyle:
            prefixStyle ??
            TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
        suffix: suffix,
        suffixText: suffixText,
        suffixIcon:
            suffixIcon ??
            (controller == null
                ? null
                : ValueListenableBuilder(
                    valueListenable: controller,
                    builder: (context, value, _) {
                      final hasError = validator?.call(value.text) != null;

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
                                    color: hasError
                                        ? AppColor.error.shade500
                                        : AppColor.neutral.shade600,
                                  ),
                                  password: (_) {
                                    final icon = obscureText
                                        ? AppAsset.icEye
                                        : AppAsset.icEyeClosed;
                                    return icon.displayImage(
                                      type: AssetType.svg,
                                      color: hasError
                                          ? AppColor.error.shade500
                                          : AppColor.neutral.shade600,
                                    );
                                  },
                                ),
                              ),
                      );
                    },
                  )),
        suffixIconConstraints: suffixIconConstraints,
        suffixStyle: suffixStyle ?? TextStyle(color: textColor, fontSize: 16),
        border:
            border ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.neutral.shade100),
              borderRadius: BorderRadius.circular(
                DesignConstants.borderRadius12,
              ),
            ),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.text.shade800),
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
        focusedErrorBorder:
            focusedErrorBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.error.shade500),
              borderRadius: BorderRadius.circular(
                DesignConstants.borderRadius12,
              ),
            ),
        errorBorder:
            errorBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.error.shade500),
              borderRadius: BorderRadius.circular(
                DesignConstants.borderRadius12,
              ),
            ),
      ),
    );
  }

  static Column labeledTextFormField({
    Key? key,
    required BuildContext context,
    TextEditingController? controller,
    String? initialValue,
    FocusNode? focusNode,
    String? forceErrorText,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    bool? showCursor,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autocorrect = true,
    bool enableSuggestions = true,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    ValueChanged<String>? onChanged,
    GestureTapCallback? onTap,
    TapRegionCallback? onTapOutside,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    FormFieldErrorBuilder? errorBuilder,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    Color? cursorColor,
    TextSelectionControls? selectionControls,
    AutovalidateMode? autoValidateMode,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    TextStyle? floatingLabelStyle,
    TextStyle? prefixStyle,
    TextStyle? errorStyle,
    TextStyle? suffixStyle,
    TextFieldType type = const TextFieldType.basic(),
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
  }) {
    return Column(
      children: [
        AppTextFormField.__(
          key: key,
          context: context,
          controller: controller,
          initialValue: initialValue,
          focusNode: focusNode,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          style: style,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          autofocus: autofocus,
          readOnly: readOnly,
          showCursor: showCursor,
          obscuringCharacter: obscuringCharacter,
          obscureText: obscureText,
          autocorrect: autocorrect,
          enableSuggestions: enableSuggestions,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          maxLength: maxLength,
          onChanged: onChanged,
          onTap: onTap,
          onTapOutside: onTapOutside,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          validator: validator,
          inputFormatters: inputFormatters,
          enabled: enabled,
          cursorColor: cursorColor,
          selectionControls: selectionControls,
          autoValidateMode: autoValidateMode,
          hintStyle: hintStyle,
          labelStyle: labelStyle,
          floatingLabelStyle: floatingLabelStyle,
          prefixStyle: prefixStyle,
          suffixStyle: suffixStyle,
          type: type,
          labelText: labelText,
          labelColor: labelColor,
          textColor: textColor,
          prefix: prefix,
          prefixText: prefixText,
          prefixIcon: prefixIcon,
          suffix: suffix,
          suffixText: suffixText,
          suffixIcon: suffixIcon,
          border: border,
          disabledBorder: disabledBorder,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          focusedErrorBorder: focusedErrorBorder,
          errorBorder: errorBorder,
          contentPadding: contentPadding,
          isDense: isDense,
          hintText: hintText,
          counterText: counterText,
          prefixIconConstraints: prefixIconConstraints,
          suffixIconConstraints: suffixIconConstraints,
          filled: filled,
          fillColor: fillColor,
          floatingLabelBehavior: floatingLabelBehavior,
          helperText: helperText,
        ),
        8.verticalSpace,
        // if(erro)
        // errorStyle: errorStyle ?? TextStyle(color: AppColor.error.shade500),
        // int errorMaxLines = 3,
        // TextStyle? errorStyle,
        // FormFieldErrorBuilder? errorBuilder,
      ],
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
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
