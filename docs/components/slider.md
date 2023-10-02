---
layout: detail
title: Sliders
description: Sliders allow users to make selections from a range of values.
---

---

**Page Summary**

* [Specifications references](#specifications-references)
* [Accessibility](#accessibility)
* [Variants](#variants)
  * [Continuous slider](#continuous-slider)
  * [Continuous lockups slider](#continuous-lockups-slider)
  * [Discrete slider](#discrete-slider)
  * [Discrete lockups slider](#discrete-lockups-slider)
* [Component specific tokens](#component-specific-tokens)

---

## Specifications references

- [Design System Manager - Sliders](https://system.design.orange.com/0c1af118d/p/66b77a-sliders/b/10df4f)
- [Material Design - Sliders](https://material.io/components/sliders/)
- Technical documentation soon available

## Accessibility

Please follow [accessibility criteria for development](https://m3.material.io/components/sliders/accessibility)

Sliders support setting content descriptors for use with screen readers. 

## Variants

## Continuous slider

Continuous sliders allow users to make meaningful selections that don’t require
a specific value.

![Continuous slider](images/slider_continuous_light.png) ![Continuous slider dark](images/slider_continuous_dark.png)

With icons:

![Continuous slider with icons](images/slider_continuous_with_icon_light.png) ![Continuous slider with icons dark](images/slider_continuous_with_icon_dark.png)


In your screen you can use:

```dart
class SliderDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return OdsSlider(
      value: 20.0,
    );
  }
}
```

You can add icons to the continuous slider like this:

```dart
return OdsSlider(
      value: 20.0,
      leftIcon: Icon(Icons.volume_mute),
      rightIcon: Icon(Icons.volume_up),
);
```

## Continuous lockups slider

![Continuous lockups slider](images/slider_continuous_lockups_light.png) ![Continuous lockups slider dark](images/slider_continuous_lockups_light.png)

With icons:

![Continuous lockups slider with icons](images/slider_continuous_lockups_with_icon_light.png) ![Continuous lockups slider with icons dark](images/slider_continuous_lockups_with_icon_dark.png)


In your screen you can use:

```dart
class SliderDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return OdsSlider(
      value: 20.0,
      label: 20.0.round().toString(),
    );
  }
}
```

You can add icons to the continuous lockups slider like this:

```dart
return OdsSlider(
      value: 20.0,
      label: sliderValue.round().toString(),
      leftIcon: Icon(Icons.volume_mute),
      rightIcon: Icon(Icons.volume_up),
);
```

### Discrete slider

Discrete sliders display a numeric value label upon pressing the thumb, which
allows a user to input an exact value.

![Discrete slider](images/slider_discrete_light.png) ![Discrete slider dark](images/slider_discrete_dark.png)

With icons:

![Discrete slider with icon](images/slider_discrete_with_icon_light.png) ![Discrete slider with icon dark](images/slider_discrete_with_icon_dark.png)

In your screen you can use:

```dart
class SliderDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return OdsSlider(
      value: 20.0,
      steps: 10,
    );
  }
}
```

You can add icons to the discrete slider like this:

```dart
return OdsSlider(
      value: 20.0,
      steps: 10,
      leftIcon: Icon(Icons.volume_mute),
      rightIcon: Icon(Icons.volume_up),
 );
```

## Component specific tokens

_Soon available_

