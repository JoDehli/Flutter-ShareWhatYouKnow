/*
 * Copyright 2020 Cagatay Ulusoy (Ulus Oy Apps). All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulusoyapps_flutter/002-navigator-2/entity/shape_border_type.dart';

import '../../home_screen_03.dart';

class HomePage extends Page {
  final List<MaterialColor> colors;
  final ValueListenable<ShapeBorderType> selectedShapeBorderTypeNotifier;
  final ValueNotifier<String> selectedColorCodeByUserScrollNotifier;
  final ValueNotifier<String> selectedColorCodeByMenuClickNotifier;

  HomePage({
    this.colors,
    this.selectedColorCodeByUserScrollNotifier,
    this.selectedColorCodeByMenuClickNotifier,
    this.selectedShapeBorderTypeNotifier,
  }) : super(key: ValueKey('HomePage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return HomeScreen(
          colors: colors,
          selectedColorCodeByMenuClickNotifier: selectedColorCodeByMenuClickNotifier,
          selectedColorCodeByUserScrollNotifier: selectedColorCodeByUserScrollNotifier,
          selectedShapeBorderTypeNotifier: selectedShapeBorderTypeNotifier,
        );
      },
    );
  }
}
