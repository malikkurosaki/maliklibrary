/// bismillah
library text_shadow;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// for alignment of shadow
/// [CENTER] will create the neon like effect
enum ShadowAlign {
  TOP_LEFT,
  TOP_CENTER,
  TOP_RIGHT,
  CENTER_RIGHT,
  BOTTOM_RIGHT,
  BOTTOM_CENTER,
  BOTTOM_LEFT,
  CENTER_LEFT,
  CENTER
}

/// blur size (default value = [MEDIUM])
enum BlurSize {
  EXTRA_SMALL,
  SMALL,
  MEDIUM,
  LARGE,
  EXTRA_LARGE
}

/// font size (default value = [H6])
/// NAME  SIZE
/// H1    64.0
/// H2    32.0
/// H3    24.0
/// H4    18.0
/// H5    16.0
/// H6    14.0
enum FontSize {
  H1,
  H2,
  H3,
  H4,
  H5,
  H6
}

/// extension on text to give the shadow to the text
/// yes! just an extension to make simple
/// textColor is the color of the text
/// shadowColor is the color of the shadow of the text
/// align is an enum ShadowAlign for the alignment of the shadow
/// blurSize is the blurRadius of the shadow
/// fontSize is the fontSize of the text
extension Bayangan on Text{
  /// extension on text widget
  Text shadow({
    Color textColor,
    Color shadowColor,
    ShadowAlign align,
    BlurSize blurZize,
    FontSize fontSize
  }){

    /// default font size is 14
    double size = 14;
    if(fontSize?.index != null){
      switch (fontSize.index){
        case 0:
          size = 64.0;
        break;
        case 1:
          size = 32.0;
        break;
        case 2:
          size = 24.0;
        break;
        case 3:
          size = 18.0;
        break;
        case 4:
          size = 16.0;
        break;
        case 5:
          size = 14.0;
        break;
      }
    }

    /// default blur size is 3.0
    double blur = 3.0;
    if(blurZize?.index != null){
      switch(blurZize.index){
        case 0: // extra small
          blur = blurZize.index.toDouble() + 1.0;
        break;
        case 1: // small
          blur = blurZize.index.toDouble() + 2.0;
        break;
        case 2: // medium
          blur = blurZize.index.toDouble() + 3.0;
        break;
        case 3: // large
          blur = blurZize.index.toDouble() + 4.0;
        break;
        case 4: // extra large
          blur = blurZize.index.toDouble() + 5.0;
        break;
      }
    }

    /// alignment of shadow
    /// to give a neon like effect, align the shadow to the center
    Offset arah = Offset(blur, blur);
    if(align?.index != null){
      switch(align.index){
        case 0: // top_left
        arah = Offset(- blur, - blur);
        break;
        case 1: // top_center
        arah = Offset(0, - blur);
        break;
        case 2: // top_right
        arah = Offset(blur, - blur);
        break;
        case 3: // center_right
        arah = Offset( blur, 0);
        break;
        case 4: // bottom right
        arah = Offset( blur, blur);
        break;
        case 5: // bottom center
        arah = Offset( 0, blur);
        break;
        case 6: // bottom_left
        arah = Offset(- blur, blur);
        break;
        case 7: // center_left
        arah = Offset(- blur, 0);
        break;
        case 8: // center
        arah = Offset(0, 0);
        break;
      }
    }
    /// returns the text with shadow with all the properties given
    return Text(this.data,
      style: TextStyle(
        color: textColor??Colors.black,
        fontSize: size,
        shadows: <Shadow>[
          Shadow(
            offset: arah,
            blurRadius: blur,
            color: shadowColor??Colors.grey,
          ),

        ]
      ),
    );
  }
}
