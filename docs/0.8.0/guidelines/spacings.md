---
layout: detail
title: Spacings
---
---

**Page Summary**

* Table of contents
{:toc}
  
---

## Specifications references

- [Design System Manager - Spacings]()
- [Material guideline - Layout](https://m3.material.io/foundations/layout/understanding-layout/spacing)

## Usage 

The spacing scale increases in small increments needed to describe both internal and external spacing relationships. Spacing tokens can be applied as padding and margins.

### Apply spacing for magin

Apply the spacing to get magin arround element like this:

``` dart
// Add a padding of 16px arround the text in the button
ElevatedButton(
  onPressed: () {
    // Add your action here
  },
  child: Padding(
    padding: EdgeInsets.all(spacingM),
    child: Text("ButtonText"),
  ),
),


// Add a magin of 16px (leading and trailing)
Container(
  margin: EdgeInsets.symmetric(horizontal: spacingM),
  child: Column(
    children: [
      Text("Title"),
      Text("A very long text for description in the main view"),
    ],
  ),
),


```

### Apply spacing for padding

Apply the spacing to separate elements like this:

``` dart
Row(
  children: [
    Icon(Icons.favorite),
    SizedBox(width: ODSSpacing.m),
    Text("Some text"),
  ],
)
```
