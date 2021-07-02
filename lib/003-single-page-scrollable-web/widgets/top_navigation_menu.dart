import 'package:flutter/material.dart';
import 'package:ulusoyapps_flutter/003-single-page-scrollable-web/entity/color_code.dart';
import 'package:ulusoyapps_flutter/extensions/color_extensions.dart';

import 'navigation_menu_button.dart';

class TopNavigationMenu extends StatelessWidget {
  final List<MaterialColor> colors;
  final ValueNotifier<ColorCode> colorCodeNotifier;

  const TopNavigationMenu({
    Key key,
    this.colors,
    this.colorCodeNotifier,
  }) : super(key: key);

  int get colorCodeIndex {
    final selectedHexColorCode = colorCodeNotifier.value?.hexColorCode;
    int index = colors.indexWhere((element) => element.toHex() == selectedHexColorCode);
    return index > -1 ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: colorCodeNotifier,
      builder: (BuildContext context, ColorCode value, Widget child) {
        return Container(
          color: Colors.black87,
          child: Wrap(
            direction: Axis.horizontal,
            children: [
              for (int i = 0; i < colors.length; i++)
                NavigationMenuButton(
                  color: colors[i],
                  colorCodeNotifier: colorCodeNotifier,
                  selected: colorCodeIndex == i,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  onPressed: () {
                    colorCodeNotifier.value = ColorCode(
                      hexColorCode: colors[i].toHex(),
                      source: ColorCodeSelectionSource.fromButtonClick,
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
