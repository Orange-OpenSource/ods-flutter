---
layout: detail
title: Typography
---
---

**Page Summary**

* [Specifications references](#specifications-references)
* [Implementation](#implementation)
  * [Apply font style on text](#apply-font-style-on-text)
  * [Apply font style on view](#apply-font-style-on-view)
  
---

## Specifications references

- [Design System Manager - Typography]()
- [Apple guideline - Typography](https://developer.apple.com/design/human-interface-guidelines/foundations/typography/)
- [Android material - Typography](https://m3.material.io/styles/typography/overview)

## Implementation 

ODS library defines its own font style. The font associated to the style is defined in the theme set in the environment.

### Apply font style on text

Apply the font style on text like this:

``` dart
Text("Sample",
	style: Theme.of(context).textTheme.bodyLarge,
),
```

### Apply font style on view

In the example the first text field has a font style set directly.
    
``` dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Font applied to a text view',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
```

