import 'package:flutter/material.dart';
import 'package:provider_template/presentation/common/app_styles.dart';
import 'package:provider_template/presentation/common/common_widget_props.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final Widget? trailingIcon;
  final bool isLoading;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isLoading = false,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: roundedButtonStyle,
      onPressed: isLoading ? () {} : onPressed,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
            if (isLoading || trailingIcon != null) ...[hSpacer],
            //if loading, shows the loader. else check if there is a traling icon, if so it will be shown
            isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ))
                : trailingIcon != null
                    ? trailingIcon!
                    : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
