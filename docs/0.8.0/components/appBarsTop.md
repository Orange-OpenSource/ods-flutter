---
layout: detail
title: "App bars: top"
description: Top app bars display information and actions relating to the current screen.
---

<br>**On this page**

* Table of contents
{:toc}

---

## Specifications references

- [Design System Manager - App bars](https://system.design.orange.com/0c1af118d/p/16218a-app-bars-top/b/618e7d)
- [Material Design - App bars: top](https://material.io/components/app-bars-top/)

## Accessibility

Please follow [accessibility criteria for development](https://m3.material.io/components/top-app-bar/accessibility).

`OdsTopAppBar` provides accessibility support for the navigation icon,
action items for informing the user as to what each action performs.

## Variants

### Regular top app bar

#### Flutter implementation

Add `OdsTopAppBar` to your Scaffold `topBar`.
Here is an example of use:

```dart
return OdsAppTopBar(
  title: "App Bar",
  actions: [
    IconButton(icon: const Icon(Icons.color_lens), onPressed: () {})
  ],
  navigationIcon: const BackButton(),
);
```

##### OdsTopAppBar API

Parameter | Default&nbsp;value | Description
-- | -- | --
`title: String` | | Title to be displayed in the center of the top app bar
`navigationIcon: Widget?` | `null` | Icon to be displayed at the start of the top app bar
`actions: List<Widget?>` | `null` | Actions to be displayed at the end of the top app bar.

### Large top app bar

#### Flutter implementation


Add `OdsLargeTopAppBar` to your Scaffold `topBar`.
Here is an example of use:

```dart
return OdsLargeTopAppBar(
  title: "Large",
  actions: IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
  leading: BackButton(),
  scrollBehavior: SliverList(
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return ListTile(
          title: Text('List item $index'),
        );
      },
      childCount: 20,
    ),
  ),
);
```

##### OdsLargeTopAppBar API

Parameter | Default&nbsp;value | Description
-- | -- | --
`title: String` | | Title to be displayed in the center of the top app bar
`navigationIcon: Widget?` | `null` | Icon to be displayed at the start of the top app bar
`actions: List<Widget?>` | `null` | Actions to be displayed at the end of the top app bar.
`scrollBehavior: Widget?` | `null` | `TopAppBarScrollBehavior` attached to the top app bar
