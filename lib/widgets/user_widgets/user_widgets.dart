library user_widgets;

// all included parts (widgets) have the packages listed here available to them
// add your required dependencies here
// imports for robots
import 'dart:async';
import 'dart:math';

//imports for Rift
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

/// communal imports
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
// imports for daseed
import 'package:flutter_buddies/widgets/user_widgets/daseed/widgets/decoration_painter.dart';
import 'package:flutter_buddies/widgets/user_widgets/daseed/widgets/my_profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart'; // Added so we can link to socials or Discord

import 'goober0329/qr_game_of_life/game_of_life_widget.dart';

/// imports for Grayson's developer widget
import 'goober0329/qr_game_of_life/gol_glider.dart';
import 'robots/bloc/robots_bloc.dart';
import 'robots/monster_controller.dart';
import 'robots/robots_models.dart';
import 'robots/secrets.dart';

part 'daseed/pierre-emmanuel_legrain.dart';
// You need do the following to add your widget to the project
// TODO: 1. Add "part of user_widgets;" to your widget file.
// TODO: 2. Add "part <path_to>/<your_filename>.dart;" below.
// TODO: 3. Build your widget in your directory
// TODO: 4. Extend WidgetInfo class from './widget_info.dart' in your main widget file.
// TODO: 4a. Instantiate your WidgetInfo Object in your widget's dart file
// TODO: 4b. See example/example.dart for an example of step 4

part 'example/example.dart'; // <-- from TODO step 2
part 'goober0329/goober_widget.dart';
part 'hsinats/hsinats_widget.dart';
part 'rift/rift_widget.dart';
part 'robots/robots_widget.dart';
part 'sleepingisimportant/sleepingisimportant_widget.dart';
part 'slovnicki/slovnicki_widget.dart';
part 'thgehr/thomasgehrmann.dart';
//defines the widget info abstract class
part 'widget_info.dart';
part 'yazeedalkhalaf/yazeedalkhalaf_widget.dart';
part 'zambrella/zambrella_widget.dart';

// TODO: 5. Add your Widget Info class object from step 4a to the list
List<WidgetInfo> widgetInfoList = [
  zambrella, //user @Zambrella
  goober,
  rift,
  slovnicki,
  hsinats,
  daseed,
  sleepingisimportant,
  robots,
  yazeedAlKhalaf,
  gehrmannInfo,
  //exampleInfo, // <-- from TODO step 5: add your widgetinfo class here
];
// can this be done without instantiating or adding the widgetinfo to the list? (see user_widgets.dart)

// TODO: 6. Create a Pull Request on Github
