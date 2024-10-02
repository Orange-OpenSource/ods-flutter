'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.json": "012409462d476443ccf4f490b9da27de",
"assets/THIRD_PARTY.md": "6bb3fa816e84d6039d43834ef2a29666",
"assets/assets/il_app_bars_top_generic.svg": "7c1ab7208402b510b8c347908e7a8962",
"assets/assets/ic_about_privacy_policy.md": "06749c9475a5ab808b7b3aadfd82f5e0",
"assets/assets/ic_modules_molecule.svg": "95d7f39290c304d3fea194bcc4140515",
"assets/assets/placeholder.png": "8a33e037f705bf245c42e1104561aecb",
"assets/assets/recipes.json": "8d9d20ed3e8f1c76725e487b71884236",
"assets/assets/1.5x/placeholder.png": "212828718e4a68e835271ec32f9bc2f0",
"assets/assets/1.5x/ic_task_list.png": "bf61d9546e297ab5e13147ff1c9c62d0",
"assets/assets/1.5x/ic_heart_selected.png": "0dd4f70e431457f30f174bd39b1dc04d",
"assets/assets/1.5x/il_about.png": "4c174f1c682469ee54535abead52efca",
"assets/assets/1.5x/ic_calendar_event_info.png": "c52427c73b23eacfcbda41fed72fe0e1",
"assets/assets/1.5x/il_typography.png": "6d0d635b6220898d3efbc1676fccd211",
"assets/assets/1.5x/ic_identity_protection.png": "5a30c2152377b199ee37a438efa14ed1",
"assets/assets/1.5x/il_navigation_bar.png": "8927163cc6c2dbb7dc950fa5882fb67a",
"assets/assets/1.5x/ic_heart_deselected.png": "519a0b70354e59fc0d8d7551fabd94b6",
"assets/assets/1.5x/il_chips.png": "d644d3d1c57f04c4c7dd4a3eab9d0e11",
"assets/assets/1.5x/il_switches.png": "65e603bf82cf1bc0eccef328c63cc8a7",
"assets/assets/declaration_ios.json": "51e2978a79af4ddbcd956cd9324d2046",
"assets/assets/il_navigation_rail.png": "73edfa420f94a9172261c91e5850a4c6",
"assets/assets/recipes/ic_heart_favorite.svg": "cf17f432bd4dbcb6dad1b05503087e28",
"assets/assets/recipes/ic_ice_cream.svg": "dab434415ca2900ec4ebc69851c33869",
"assets/assets/recipes/ic_coffee.svg": "af19234e2998b56f7c84b8a806f39aad",
"assets/assets/recipes/ic_restaurant.svg": "c1798f4069c15fdf38430b75612172f5",
"assets/assets/recipes/ic_cooking_pot.svg": "fdd264b08b7f25c4a6928665248eeab7",
"assets/assets/il_dialogs.png": "321fc971ddf5f0c30fbda673785b7dce",
"assets/assets/ic_task_list.png": "9085b42adcdc8ec7aa96214b65c86970",
"assets/assets/il_list_item.png": "c6fd2e70c92ce69c3f5679b36fb3ba39",
"assets/assets/ic_accessibility.png": "c1d5a013fe8b757d4b5ac4ad227928a0",
"assets/assets/il_progress.png": "93585fffa1ae775e8faf61779bf59106",
"assets/assets/ic_profile.svg": "1730196ba6e76e6038eefedcb929ba74",
"assets/assets/il_lists.png": "c0fbba99cfd4eb225d2fc8419a92a972",
"assets/assets/il_floating_action_button.svg": "a2ba0e798cd019e27ff7c9a706486984",
"assets/assets/il_menu.png": "ddc8532dfecf3676343d749fc0f7a681",
"assets/assets/il_sliders.png": "27bbeb67fbb52dd25f311a0a45b17519",
"assets/assets/il_sheets_bottom.png": "88e670045d4aae3497a73dd296f511fe",
"assets/assets/ic_heart_selected.png": "6915b81fd8c7e1e8bd59057a1e1540d7",
"assets/assets/il_about.png": "ce66b44bb4b6b93aea78cbc08e711470",
"assets/assets/ic_calendar_event_info.png": "b31b7394e15e6707125fcdfed05d0581",
"assets/assets/il_radio_buttons.svg": "5fe3717ddd4fa3735dfff66cb9258af3",
"assets/assets/il_typography.png": "ea5d460295677d2374ce19d5f5096dbe",
"assets/assets/ic_identity_protection.png": "b4ebe37650971dcb4a548756b3b75353",
"assets/assets/il_cards.svg": "b5d29a54a8e825d1270bfe041d275961",
"assets/assets/il_checkbox.svg": "40ff55794ad5255b8c95bb0e4c6b01a1",
"assets/assets/ic_about_terms_of_service.md": "3273660919581bd42389fa9051553b6d",
"assets/assets/il_snackbars.svg": "1d6b5803539742a4f11626336ccec404",
"assets/assets/4.0x/placeholder.png": "31b7de4af9d668cdde267f1870fdaacb",
"assets/assets/4.0x/ic_task_list.png": "d7bbfabf8b33d1ad27510d0e2c2d942e",
"assets/assets/4.0x/ic_heart_selected.png": "a2c44070cbe340ca840d60d293d85f81",
"assets/assets/4.0x/il_about.png": "cd45187a0f8a5797187d308e8a1d8ac0",
"assets/assets/4.0x/ic_calendar_event_info.png": "396331bf797591e4d31caffc09ee3baf",
"assets/assets/4.0x/il_typography.png": "0ea75da2e9fea6664ae27c95001c5927",
"assets/assets/4.0x/ic_identity_protection.png": "302dcea208c39059c1f9842d78e67016",
"assets/assets/4.0x/il_navigation_bar.png": "513557514dfba9fba2204a8040dd5adb",
"assets/assets/4.0x/ic_heart_deselected.png": "f76f22ec450914d69210d4850a2a6c09",
"assets/assets/4.0x/il_chips.png": "9a66954e4195ea7789567e94b04e2782",
"assets/assets/4.0x/il_switches.png": "e4a2d46e313bb71f913233fd0f243ca1",
"assets/assets/ic_chevron_down.svg": "0e2ba41ac75ebd092d1fe34a572294ee",
"assets/assets/il_navigation_bar.png": "309047997ddb8ba02235e6a61d076a0a",
"assets/assets/il_buttons.svg": "879c47c6b0034f1bfa00c2f5332d2a3d",
"assets/assets/ic_heart_deselected.png": "cc21387e4898c602e10bc92b3f00f2ab",
"assets/assets/ic_about_info.svg": "87c18a04e9f807dfd25601d88949b283",
"assets/assets/il_text-fields.png": "2033ddf03a91f743bdecda28ebfc92f4",
"assets/assets/il_spacing.png": "b4fa3d4172b24b541d44b987e0d729e1",
"assets/assets/3.0x/placeholder.png": "08b769a0b4b7663ae7784fa964cf8abe",
"assets/assets/3.0x/ic_task_list.png": "cb6b47e5814f2f9a7285e6e313dfa919",
"assets/assets/3.0x/ic_heart_selected.png": "c951a29386f1e26990834ae4d28bfc5d",
"assets/assets/3.0x/il_about.png": "7be7e478e11dcb994cd03d52e65a6fc4",
"assets/assets/3.0x/ic_calendar_event_info.png": "b3d650b3945b2f360be37dd3eb1e13a6",
"assets/assets/3.0x/il_typography.png": "ecc4c2ded49dce72f86110017a2ac42a",
"assets/assets/3.0x/ic_identity_protection.png": "4606c84f48276b2b7d28a6fc2e64be98",
"assets/assets/3.0x/il_navigation_bar.png": "f9612fe258c267e6ea8ae07693a223da",
"assets/assets/3.0x/ic_heart_deselected.png": "6d166984351c5c10c4a767d89d674f07",
"assets/assets/3.0x/il_chips.png": "830ea1aff3707c37d8c90719da8c3a4b",
"assets/assets/3.0x/il_switches.png": "a82d1015b6d7afdf99c6874f6edd67cd",
"assets/assets/il_color.png": "f7cd1dc0baeb9e5b46fc2ea08c5f145d",
"assets/assets/ic_components_atom.svg": "163165c9a17798d3ae4aecdd9ecdb07e",
"assets/assets/il_chips.png": "cbeeaf0369cb414388342eb43328dc11",
"assets/assets/il_switches.png": "1fa07ee316905ffbe127f164a5421f15",
"assets/assets/2.0x/placeholder.png": "06ae60e8597533d13f41643b2d8750d8",
"assets/assets/2.0x/ic_task_list.png": "e105ffe64a0bbf8ca4d7d76ec2817002",
"assets/assets/2.0x/ic_heart_selected.png": "aa78fa5150f5a3b4197175efdd65f7c8",
"assets/assets/2.0x/il_about.png": "faa319c3b2dc560761aae5dd7bec6cb2",
"assets/assets/2.0x/ic_calendar_event_info.png": "6cfcad776a5752eac43dbbc482f813c9",
"assets/assets/2.0x/il_typography.png": "5f15be0f38278edce7a4b86d646e8d78",
"assets/assets/2.0x/il_navigation_bar.png": "dea6fad1fb475f86725042bc2eeb9b44",
"assets/assets/2.0x/ic_heart_deselected.png": "1f2611f58ce93e6766963d85d73ef8c6",
"assets/assets/2.0x/il_chips.png": "cbeeaf0369cb414388342eb43328dc11",
"assets/assets/2.0x/il_switches.png": "2d01949c289b10e4907de31734f35f02",
"assets/assets/declaration_android.json": "7136525c00de84259a74ef94c97797fd",
"assets/assets/fonts/ios/SF-Mono-Regular.otf": "8e9701d8efc7df15706b06712b1c6de1",
"assets/assets/fonts/ios/SF-Mono-Semibold.otf": "86be70089450e9ba1d5b8d2b49f352a0",
"assets/assets/fonts/ios/SF-Mono-Medium.otf": "d6cd444515f72d0508bf106dbe42bbae",
"assets/assets/fonts/ios/SF-Mono-Heavy.otf": "0e9c24e2e9015ec4284addc27012a91d",
"assets/assets/fonts/ios/SF-Mono-RegularItalic.otf": "7ac6b2e22d8628f07da13549bac0ef33",
"assets/assets/fonts/ios/SF-Mono-HeavyItalic.otf": "aacb5bda062b8f7958ab2443d17654dc",
"assets/assets/fonts/ios/SF-Mono-Bold.otf": "096048104d0ca07dddb7aab3b39b495a",
"assets/assets/fonts/ios/SF-Mono-BoldItalic.otf": "64f1eaa1d097fbfeee4e5c2aef58fce3",
"assets/assets/fonts/ios/SF-Mono-LightItalic.otf": "c997b75a921a5ffeee9681bfb2330125",
"assets/assets/fonts/ios/SF-Mono-MediumItalic.otf": "aeb08c59851c90cab3d8a1708feb5638",
"assets/assets/fonts/ios/SF-Mono-SemiboldItalic.otf": "d7fe3a13419175c8ef679b09cbc90d3c",
"assets/assets/fonts/ios/SF-Mono-Light.otf": "3c9ed6c811918e95abe107bb3b31acbc",
"assets/assets/fonts/android/RobotoMono-VariableFont_wght.ttf": "336102a48d996db3d945a346b1790b1f",
"assets/assets/fonts/android/static/RobotoMono-BoldItalic.ttf": "ff657358db1650242d3896f4e6a17cb1",
"assets/assets/fonts/android/static/RobotoMono-Bold.ttf": "90190d91283189e340b2a44fe560f2cd",
"assets/assets/fonts/android/static/RobotoMono-ThinItalic.ttf": "a114a11bf7df312c7c0ca28a8ed848a6",
"assets/assets/fonts/android/static/RobotoMono-Medium.ttf": "0eaa3f458fb2611ca44b021db3db09a8",
"assets/assets/fonts/android/static/RobotoMono-ExtraLight.ttf": "642c61c3093f360ebfe8c96dce691e21",
"assets/assets/fonts/android/static/RobotoMono-LightItalic.ttf": "029bc3c3cc4278d2e0830f4240c9903d",
"assets/assets/fonts/android/static/RobotoMono-Thin.ttf": "564755b4222c6321216f1e764c9204f9",
"assets/assets/fonts/android/static/RobotoMono-SemiBold.ttf": "eabbacb68fea19c24a80eaed6715ca4a",
"assets/assets/fonts/android/static/RobotoMono-MediumItalic.ttf": "6bea71cb28b47720d7d1298dc6e30842",
"assets/assets/fonts/android/static/RobotoMono-SemiBoldItalic.ttf": "d6cd56b24c1859f3e01ec50684338882",
"assets/assets/fonts/android/static/RobotoMono-Light.ttf": "c9166464b1db95fc3cdf9b50fc7f98e2",
"assets/assets/fonts/android/static/RobotoMono-ExtraLightItalic.ttf": "6fe6edf7704d61127966047e0ee05e7e",
"assets/assets/fonts/android/RobotoMono-Italic-VariableFont_wght.ttf": "e2a43959c0a8c62aa65dc5160efb15d9",
"assets/assets/ic_guidelines_dna.svg": "ae5dae7d3ef67995ba1100f5ac021b8e",
"assets/AssetManifest.bin.json": "c71d334d26269e8873650236706a38fd",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "1499c638c985e4d2e0bf35d55a4e606b",
"assets/FontManifest.json": "ba6caf0cbb36bdc87fff2289488a670e",
"assets/CHANGELOG.md": "fd1506ea1f1622977883209c868061b0",
"assets/NOTICES": "78b07b91a2f2c29d83a37c6251d52071",
"assets/fonts/MaterialIcons-Regular.otf": "5fde3482553cb32500557434a9bdaf8d",
"assets/packages/ods_flutter/assets/placeholder.png": "8a33e037f705bf245c42e1104561aecb",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"main.dart.js": "8b1df4b40e6d4b62006cb1086520c5f2",
"browserconfig.xml": "a493ba0aa0b8ec8068d786d7248bb92c",
"favicon-16x16.png": "432c5effd08aa105c60e00af714eb9f2",
"favicon-32x32.png": "a465c5868297ee2fafb649913644a1f3",
"flutter_bootstrap.js": "a2195f0aac03d82c0ea1eeb8efd80bce",
"site.webmanifest": "b9aa277fcfc34c31db6c7a7ea3469b8c",
"mstile-150x150.png": "8008c3bafec59df8c561287616a1843a",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"android-chrome-192x192.png": "bd21fb58b025bbbb7c014ab3e89bd14d",
"apple-touch-icon.png": "3fe5a5775e75f1de1e7828e6a74fab80",
"android-chrome-512x512.png": "1269dce3139bb79859418c85b7b82b57",
"index.html": "84c8395d5c1877d55818be0d3a14506d",
"/": "84c8395d5c1877d55818be0d3a14506d",
"favicon.ico": "896b7d2800f5d9c205218decd1e70db6",
"version.json": "07b7389f95984e041f67c4af658cf9f9",
"safari-pinned-tab.svg": "b9b254aae3c748726218ae1ab5610890"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
