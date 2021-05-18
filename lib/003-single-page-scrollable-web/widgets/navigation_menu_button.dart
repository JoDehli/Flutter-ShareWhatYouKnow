import 'package:flutter/material.dart';
import 'package:ulusoyapps_flutter/extensions/color_extensions.dart';

class NavigationMenuButton extends StatelessWidget {
  final Color color;
  final bool selected;
  final ValueNotifier<String> selectedColorCodeNotifier;
  final EdgeInsets padding;

  const NavigationMenuButton({
    Key key,
    this.color,
    this.selected,
    this.selectedColorCodeNotifier,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Brightness brightness = ThemeData.estimateBrightnessForColor(color);
    Color textColor = brightness == Brightness.light ? Colors.black : Colors.white;
    return Padding(
      padding: padding,
      child: selected
          ? ElevatedButton(
              onPressed: _onPressed,
              style: ElevatedButton.styleFrom(primary: color),
              child: _text(context, textColor),
            )
          : TextButton(
              onPressed: _onPressed,
              child: _text(context, color),
            ),
    );
  }

  _onPressed() => selectedColorCodeNotifier.value = color.toHex();

  Text _text(BuildContext context, Color textColor) => Text(
        "#${color.toHex()}",
        style: Theme.of(context).textTheme.headline6.copyWith(color: textColor),
      );
}
