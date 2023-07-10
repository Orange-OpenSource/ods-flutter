'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"index.html": "400843334c14d8045c1dd694a4b0d2ee",
"/": "400843334c14d8045c1dd694a4b0d2ee",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon-16x16.png": "432c5effd08aa105c60e00af714eb9f2",
"android-chrome-512x512.png": "1269dce3139bb79859418c85b7b82b57",
"safari-pinned-tab.svg": "b9b254aae3c748726218ae1ab5610890",
"main.dart.js": "c56a538ab35b9f5e13be43bc85d0aaf8",
"version.json": "07b7389f95984e041f67c4af658cf9f9",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"favicon-32x32.png": "a465c5868297ee2fafb649913644a1f3",
"apple-touch-icon.png": "3fe5a5775e75f1de1e7828e6a74fab80",
"favicon.ico": "896b7d2800f5d9c205218decd1e70db6",
"android-chrome-192x192.png": "bd21fb58b025bbbb7c014ab3e89bd14d",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/fonts/MaterialIcons-Regular.otf": "590edf2e36b61481691064d0c651015b",
"assets/AssetManifest.bin": "8dacee75b80ea06751af52476562bd2d",
"assets/AssetManifest.json": "8d6cfa7d54e0c996fe064d737a91d7a1",
"assets/NOTICES": "ffe969a916d7118133614bc16f901726",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/assets/4.0x/placeholder.png": "31b7de4af9d668cdde267f1870fdaacb",
"assets/assets/4.0x/il_switches.png": "e4a2d46e313bb71f913233fd0f243ca1",
"assets/assets/4.0x/il_typography.png": "0ea75da2e9fea6664ae27c95001c5927",
"assets/assets/4.0x/il_navigation_bar.png": "513557514dfba9fba2204a8040dd5adb",
"assets/assets/4.0x/il_about.png": "cd45187a0f8a5797187d308e8a1d8ac0",
"assets/assets/4.0x/il_app_bars_top_generic.png": "9a24c1a8e2ffd555290152d0fc5779cf",
"assets/assets/placeholder.png": "8a33e037f705bf245c42e1104561aecb",
"assets/assets/il_checkbox.svg": "40ff55794ad5255b8c95bb0e4c6b01a1",
"assets/assets/1.5x/placeholder.png": "212828718e4a68e835271ec32f9bc2f0",
"assets/assets/1.5x/il_switches.png": "65e603bf82cf1bc0eccef328c63cc8a7",
"assets/assets/1.5x/il_typography.png": "6d0d635b6220898d3efbc1676fccd211",
"assets/assets/1.5x/il_navigation_bar.png": "8927163cc6c2dbb7dc950fa5882fb67a",
"assets/assets/1.5x/il_about.png": "4c174f1c682469ee54535abead52efca",
"assets/assets/1.5x/il_app_bars_top_generic.png": "d5cc3c2cec132b73e7f7bffad4e360ce",
"assets/assets/2.0x/placeholder.png": "06ae60e8597533d13f41643b2d8750d8",
"assets/assets/2.0x/il_switches.png": "2d01949c289b10e4907de31734f35f02",
"assets/assets/2.0x/il_typography.png": "5f15be0f38278edce7a4b86d646e8d78",
"assets/assets/2.0x/il_navigation_bar.png": "dea6fad1fb475f86725042bc2eeb9b44",
"assets/assets/2.0x/il_about.png": "faa319c3b2dc560761aae5dd7bec6cb2",
"assets/assets/2.0x/il_app_bars_top_generic.png": "981cda9016fc2f95fdd565bcfde46f00",
"assets/assets/il_buttons.svg": "f7fb2566c8d1bfc5845ce5777fc1299f",
"assets/assets/il_radio_buttons.svg": "5fe3717ddd4fa3735dfff66cb9258af3",
"assets/assets/ic_components_atom.svg": "163165c9a17798d3ae4aecdd9ecdb07e",
"assets/assets/il_switches.png": "1fa07ee316905ffbe127f164a5421f15",
"assets/assets/recipes/ic_ice_cream.svg": "dab434415ca2900ec4ebc69851c33869",
"assets/assets/recipes/ic_restaurant.svg": "c1798f4069c15fdf38430b75612172f5",
"assets/assets/recipes/ic_cooking_pot.svg": "fdd264b08b7f25c4a6928665248eeab7",
"assets/assets/recipes/ic_coffee.svg": "af19234e2998b56f7c84b8a806f39aad",
"assets/assets/ic_chevron_down.svg": "0e2ba41ac75ebd092d1fe34a572294ee",
"assets/assets/il_typography.png": "ea5d460295677d2374ce19d5f5096dbe",
"assets/assets/ic_about_info.svg": "87c18a04e9f807dfd25601d88949b283",
"assets/assets/il_navigation_bar.png": "309047997ddb8ba02235e6a61d076a0a",
"assets/assets/il_about.png": "ce66b44bb4b6b93aea78cbc08e711470",
"assets/assets/recipes.json": "8d9d20ed3e8f1c76725e487b71884236",
"assets/assets/ic_guidelines_dna.svg": "ae5dae7d3ef67995ba1100f5ac021b8e",
"assets/assets/3.0x/placeholder.png": "08b769a0b4b7663ae7784fa964cf8abe",
"assets/assets/3.0x/il_switches.png": "a82d1015b6d7afdf99c6874f6edd67cd",
"assets/assets/3.0x/il_typography.png": "ecc4c2ded49dce72f86110017a2ac42a",
"assets/assets/3.0x/il_navigation_bar.png": "f9612fe258c267e6ea8ae07693a223da",
"assets/assets/3.0x/il_about.png": "7be7e478e11dcb994cd03d52e65a6fc4",
"assets/assets/3.0x/il_app_bars_top_generic.png": "b042ddd3612a9cc2e966f7beb73b7547",
"assets/assets/il_snackbars.svg": "1d6b5803539742a4f11626336ccec404",
"assets/assets/ic_modules_molecule.svg": "95d7f39290c304d3fea194bcc4140515",
"assets/assets/il_cards.svg": "b5d29a54a8e825d1270bfe041d275961",
"assets/assets/il_app_bars_top_generic.png": "9a24c1a8e2ffd555290152d0fc5779cf",
"site.webmanifest": "b9aa277fcfc34c31db6c7a7ea3469b8c",
"mstile-150x150.png": "8008c3bafec59df8c561287616a1843a",
"browserconfig.xml": "a493ba0aa0b8ec8068d786d7248bb92c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
