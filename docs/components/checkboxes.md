---
layout: detail
title: Checkboxes
description: Checkbox selection control allows the user to select options.
---

Use checkboxes to:
* Select one or more options from a list
* Present a list containing sub-selections
* Turn an item on or off in a desktop environment

---

**Page Summary**

* [Specifications references](#specifications-references)
* [Accessibility](#accessibility)
* [Implementation](#implementation)
* [Component specific tokens](#component-specific-tokens)

---

## Specifications references

- [Design System Manager - Checkboxes](https://system.design.orange.com/0c1af118d/p/775cb3-checkboxes/b/077247)
- [Material Design - Checkboxes](https://m3.material.io/components/checkbox/overview)
- Technical documentation soon available

## Accessibility

Please follow [accessibility criteria for development](https://m3.material.io/components/checkbox/accessibility)

Checkboxes support content labeling for accessibility and are readable by most screen readers, such
as TalkBack and Voice Over. Text rendered in check boxes is automatically provided to accessibility services.
Additional content labels are usually unnecessary.

### Implementation

![Checkbox](images/checkbox_light.png) ![Checkbox dark](images/checkbox_dark.png)

> **Flutter implementation**

In your screen you can use CheckboxListTitle or Checkbox :

```dart
return CheckboxListTile(
	value: true,
	title: Text("Enabled"),
	enabled: true,
	onChanged: (value) {
 		setState(() {});
	},
)
```

## Component specific tokens

_Soon available_
