---
layout: detail
title: Buttons
description: Buttons allow users to take actions, and make choices, with a single tap.
---

---

**Page Summary**

* Table of contents
{:toc}

---

## Specifications references

- [Design System Manager - Buttons](https://system.design.orange.com/0c1af118d/p/120472-buttons/b/223c31)
- [Material Design - Buttons](https://m3.material.io/components/buttons/overview)
- Technical documentation soon available

## Accessibility

Please follow [accessibility criteria for development](https://m3.material.io/components/buttons/accessibility)

Buttons support content labeling for accessibility and are readable by most screen readers, such as
TalkBack. Text rendered in buttons is automatically provided to accessibility services. Additional
content labels are usually unnecessary.

## Variants

### Text button

Text buttons are typically used for less-pronounced actions, including those located in dialogs and
cards. In cards, text buttons help maintain an emphasis on card content.

![TextButton](images/button_text_light.png) ![TextButton dark](images/button_text_dark.png)

#### Flutter implementation

Use the `OdsTextButton`:

```dart
return OdsTextButton(
  text: "Text button",
  onClick: () {},
  icon: SvgPicture.asset("assets/ic_profile.svg", // Optional, line can be removed if you don't need any icon
);
```

To display a primary button, you need to pass an `OdsTextButtonStyle`
through the `style` parameter:

```dart
return OdsTextButton(
  text: "Text button",
  onClick: () {},
  icon: SvgPicture.asset("assets/ic_profile.svg"), // Optional, line can be removed if you don't need any icon
  style: OdsTextButtonStyle.functionalPrimary
);
```

### Outlined button

Outlined buttons are medium-emphasis buttons. They contain actions that are important, but aren’t
the primary action in an app.

![ButtonOutlined](images/button_outlined_light.png) ![ButtonOutlined dark](images/button_outlined_dark.png)

#### Flutter implementation

Use the `OdsOutlinedButton` composable:

```dart
return OdsOutlinedButton(
  text: "Outlined button",
  onClick: () {},
  icon: SvgPicture.asset('assets/ic_profile.svg'), // Optional, line can be removed if you don't need any icon
);
```

### Contained button

Contained buttons are high-emphasis, distinguished by their use of elevation and fill. They contain
actions that are primary to your app.

![ContainedButton](images/button_contained_light.png) ![ContainedButton dark](images/button_contained_dark.png)

Functional positive:

![ContainedButton positive light](images/button_contained_positive_light.png) ![ContainedButton positive dark](images/button_contained_positive_dark.png)

Functional negative:

![ContainedButton negative light](images/button_contained_negative_light.png) ![ContainedButton negative dark](images/button_contained_negative_dark.png)

#### Flutter implementation

Use the `OdsButton`:

```dart
return OdsButton(
  text: "Contained button",
  onClick: () {},
  icon: SvgPicture.asset("assets/ic_profile.svg"), // Optional, line can be removed if you don't need any icon
);
```

To display a primary button or a functional green/red button, you need to pass an `OdsButtonStyle`
through the `style` parameter:

```dart
return OdsButton(
  text: "Positive button",
  onClick: () {},
  icon: SvgPicture.asset("assets/ic_profile.svg"), // Optional, line can be removed if you don't need any icon
  style: OdsButtonStyle.functionalPositive
);
```

### Segmented button

A group of toggle buttons. Only one option in a group of toggle buttons can be selected and active
at a time.
Selecting one option deselects any other.
Use for simple choices between two to five items (for more items or complex choices, use chips)

![Segmented button single light](images/segmented_button_single_light.png) ![Segmented button single dark](images/segmented_button_single_dark.png)

#### Flutter implementation

Single-select segmented button :

```dart
enum Foods { ham, milk, figs, eggs, oil }

///Single Choice
Foods foodsView = Foods.ham;
  
return OdsSegmentedButton<Foods>(
        enabled: false, //Optional by default true
        segments: <ButtonSegment<Foods>>[
          ButtonSegment<Foods>(
            value: Foods.ham,
            label: Text("Ham"),
            icon: Icon(Icons.restaurant), // Optional, line can be removed if you don't need any icon
          ),
          ButtonSegment<Foods>(
            value: Foods.milk,
            label: Text("Milk"),
            icon: Icon(Icons.restaurant), // Optional, line can be removed if you don't need any icon
          ),
        ],
        selected: <Foods>{foodsView},
        onSelectionChanged: (Set<Foods> newSelection) {
          setState(
            () {
              foodsView = newSelection.last;
            },
          );
        });
```

Multi-select segmented button :

![Segmented button multi light](images/segmented_button_multi_light.png) ![Segmented button multi dark](images/segmented_button_multi_dark.png)

```dart
enum Foods { ham, milk, figs, eggs, oil }

///Multi Choice
Set<Foods> selectionMulti = <Foods>{Foods.ham, Foods.milk};
  
return OdsSegmentedButton<Foods>(
  enabled: false, //Optional by default true
  segments: <ButtonSegment<Foods>>[
    ButtonSegment<Foods>(
      value: Foods.ham,
      label: Text("Ham"),
      icon: Icon(Icons.restaurant), // Optional, line can be removed if you don't need any icon
    ),
    ButtonSegment<Foods>(
      value: Foods.milk,
      label: Text("Milk"),
      icon: Icon(Icons.restaurant), // Optional, line can be removed if you don't need any icon
    ),
  ],
  selected: selectionMulti,
  onSelectionChanged: (Set<Foods> newSelection) {
    setState(() {
      selectionMulti = newSelection;
    });
  },
);


```

##### OdsSegmentedButton API

Parameter | Default&nbsp;value | Description
-- | -- | --
`segments: List<ButtonSegment<T>> segment` | | Descriptions of the segments in the button.
`selected: Set<T>` | | The set of `ButtonSegment.values` that indicate which `segments` are selected.
`onSelectionChanged: (Set<T>)? onSelectionChanged` | `null` | Callback invoked on selection change
`enabled: bool?` | `true` | Controls the enabled state of the segmented button. When false, this segmented button will not be clickable.

### Button icon

Each icon button has as an optional toggle behavior, which gives the button a selected and unselected state. Toggle buttons remain highlighted when selected, and are styled differently than the default icon buttons.

There are four styles of icon buttons:

- Filled icon button
- Filled tonal icon button
- Outlined icon button 
- Standard icon button

Selected

![Segmented button single light](images/button_icon_selected_light.png) ![Segmented button single dark](images/button_icon_selected_dark.png)

Deselected

![Segmented button single light](images/button_icon_deselected_light.png) ![Segmented button single dark](images/button_icon_deselected_dark.png)

#### Flutter implementation

The button has a standard style by default. Please add the attribute according to your need :

- Standard : OdsButtonIconStyle.functionalStandard
- Filled : OdsButtonIconStyle.functionalFilled
- Tonal : OdsButtonIconStyle.functionalTonal
- Outlined : OdsButtonIconStyle.functionalOutlined

```dart
bool selected = false;

return IconButton(
  icon: Icon(Icons.settings_outlined),
  selectedIcon: const Icon(Icons.settings), // Optional
  style: OdsButtonIconStyle.functionalStandard, // Optional by default OdsButtonIconStyle.functionalStandard
  isSelected: selected,
  isEnabled: true, // Optional by default true
  onClick: () {
    setState(() {
      selected = !selected;
    });
  },
),
```

##### OdsButtonIcon API

Parameter | Default&nbsp;value | Description
-- | -- | --
`icon: Widget` | | The icon to display inside the button.
`selectedIcon: Widget?` | `null` | The icon to display inside the button when `isSelected` is true.
`isSelected: bool` | `false` | The optional selection state of the icon button.
`isEnabled: bool` | `true` | The optional selection state enabled/disabled of the icon button.
`onClick: void Function()?` | `null` | The action to be executed when the button is pressed.
`style: OdsButtonIconStyle` | `OdsButtonIconStyle.functionalStandard` | The button's style color.
