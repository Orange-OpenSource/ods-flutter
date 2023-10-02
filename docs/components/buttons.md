---
layout: detail
title: Buttons
description: A button allows a user to perform an action or to navigate to another page. It contains a text label and a supporting icon can be displayed.
---

---

**Page Summary**

* [Specifications references](#specifications-references)
* [Accessibility](#accessibility)
* [Variants](#variants)
    * [Emphasis button](#emphasis-button)
    * [Functional button](#functional-button)
    * [Icon button](#icon-button)

---

## Specifications references

- [Design System Manager - Buttons](https://system.design.orange.com/0c1af118d/p/120472-buttons/b/223c31)
- [Material guideline - Buttons](https://m3.material.io/components/buttons/guidelines)

## Accessibility

Please follow [accessibility criteria for development](https://m3.material.io/components/buttons/accessibility)

## Variants

### Emphasis button

Button variants range in style to denote emphasis. Use different styles and not size to show the preferred choice. 

```swift
// Highest emphasis
ODSButton(text: "Some text",
          image: Image("Add"),
          emphasis: .highest,
          variableWidth: true) {}

// Low emphasis
ODSButton(text: "Some text",
          image: Image("Add"),
          emphasis: .low,
          variableWidth: true) {}
``` 

### Functional button

If required, colour versions can also be used to inform users of positive or negative destructive actions.

```swift
    // Negative button
    ODSFunctionalButton(text: "Some text", style: .negative) 
    { /* action: Do something */ }
    
    ODSFunctionalButton(text: "Some text", image: Image("Add"), style: .negative)
    { /* action: Do something */ }
    
    // Positive button
    ODSFunctionalButton(text: "Some text", style: .positive)
    { /* action: Do something */ }
    
    ODSFunctionalButton(text: "Some text", image: Image("Add"), style: .positive)
    { /* action: Do something */ }
    
    // To disable the button
    ODSFunctionalButton(text: "Some text", style: .positive) { /* action: Do something */ }
    .disabled(true)
```

### Icon button

Plain buttons are the most ubiquitous component found throughout applications. Consisting an icon, they are the most simple button style.

```swift
// icon with system asset
ODSIconButton(image: Image(systemName: "info.circle")) {}

// icon with Solaris asset
ODSIconButton(image: Image("Add")) {}
```



