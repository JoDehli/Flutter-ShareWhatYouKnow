import 'package:flutter/material.dart';
import 'package:ulusoyapps_flutter/extensions/color_extensions.dart';

import 'navigation_menu_button.dart';

class TopNavigationMenu extends StatefulWidget {
  final List<MaterialColor> colors;
  final ValueNotifier<String> selectedColorCodeNotifier;

  const TopNavigationMenu({
    Key key,
    this.colors,
    this.selectedColorCodeNotifier,
  }) : super(key: key);

  @override
  _TopNavigationMenuState createState() => _TopNavigationMenuState();
}

class _TopNavigationMenuState extends State<TopNavigationMenu> {
  int get selectedColorCodeIndex {
    int index = widget.colors.indexWhere((element) => element.toHex() == widget.selectedColorCodeNotifier.value);
    return index > -1 ? index : 0;
  }

  @override
  void initState() {
    widget.selectedColorCodeNotifier.addListener(() {
      setState(() => {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          for (int i = 0; i < widget.colors.length; i++)
            NavigationMenuButton(
              color: widget.colors[i],
              selectedColorCodeNotifier: widget.selectedColorCodeNotifier,
              selected: selectedColorCodeIndex == i,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            ),
        ],
      ),
    );
  }
}
