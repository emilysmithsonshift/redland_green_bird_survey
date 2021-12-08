'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "5cce32b5caca8f17e3f28b27e9df1163",
"index.html": "506d3bea7d2233db84ca37e162e8a2dc",
"/": "506d3bea7d2233db84ca37e162e8a2dc",
"main.dart.js": "fd56b270bdea1cfbf06c5325b1df1e6a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "eed945a1a3b73c41f03687c782f2f371",
"assets/AssetManifest.json": "e3f0a33e2f8b518a47e1337d0c4d71df",
"assets/NOTICES": "a5c8e649c88287993aec30fba576e8c6",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/assets/greattit_close.png": "4c78c4e3c4169d0db7b9fcd51181ae59",
"assets/assets/songthrush_2.png": "3bffb4d6f3a707714e935f5b92d9afb0",
"assets/assets/sparrowhawk_2.png": "5a4ba651a0ec7ccc8a9f4aa3f69d0b10",
"assets/assets/robin.png": "a77da3c06682b3b28bd0a0f7b6ca8acf",
"assets/assets/splashscreen.png": "d9d4df04a7ab3c858f7f8357af1a0a31",
"assets/assets/songthrush.png": "b0ded39de91fc24a022e005d52c10196",
"assets/assets/sparrowhawk_3.png": "27c3746423a28a7343231983aa411185",
"assets/assets/robin_2.png": "d97d1afab503d7359142fe8beb231022",
"assets/assets/sparrowhawk_1.png": "11f5ccf4cf8f77c94b297f7bc3d7e66e",
"assets/assets/crow4.png": "4811307e4323d798c150a9ec85d4759e",
"assets/assets/blackbird_close.png": "008e7d70b45611d359abe80d1b9f35d9",
"assets/assets/starling.png": "d8db88207b9dda0ff568f4704ad9903f",
"assets/assets/wagtail1.png": "4ad187007da71994dcb7ef35661ca063",
"assets/assets/pied_flycatcher_1.png": "48f3048c2d5a91e038f9c352d7b039bd",
"assets/assets/wagtail2.png": "1305030faa8606d3e60118816619d601",
"assets/assets/crow3.png": "fe1eb2eab257a17c6eaa25c491f52d40",
"assets/assets/crow2.png": "1647e38e5a5d0794704716f4275a038d",
"assets/assets/woodpecker.png": "729d111e4e0356bac09d10c265ad302d",
"assets/assets/wagtail.png": "c140a770357a15d5c7ac73db2bad4512",
"assets/assets/jackdaw_1.png": "d4387689f56789b81236ef5c6e4a958b",
"assets/assets/goldfinch2.png": "64bcf90f81635287ee83cc4a772c8243",
"assets/assets/wren_4.png": "2c0ff8ab41a993a3bc5d132548e47160",
"assets/assets/bluetit.png": "6d7d21c205e4fc1b4c5c2ac11bbc6ea0",
"assets/assets/bluetit.jpg": "4ac3cec8745923ebc44ec694f7611455",
"assets/assets/robin1.png": "452141d317ea879454eda1cd919a8238",
"assets/assets/pied_flycatcher.png": "7457014272c94562e7d8dc4057118675",
"assets/assets/goldfinch3.png": "a180c37ad4dc12e99e50073043e92117",
"assets/assets/greattit1.png": "53884b520b5b6627896a5f6bd0f48941",
"assets/assets/nuthatch1.png": "8bff28cc1d14455ae7028fca372182d5",
"assets/assets/coaltit.png": "4944885485ab3df7374185fa2650ce9d",
"assets/assets/greattit.png": "78a831d7874edb03e4e4a6cfd9ed94ba",
"assets/assets/owl.png": "c0ca2606448010788f445e580bab23aa",
"assets/assets/goldfinch4.png": "ba03f62066108be686a6f107871502fc",
"assets/assets/nuthatch3.png": "77d28d05d60fa7f8147033e820e7646b",
"assets/assets/magpie.png": "62d13e88494a11b97a240b6704ba523a",
"assets/assets/nuthatch2.png": "511a28893133402527645d7fe7c277ed",
"assets/assets/crow.png": "4842e2f50f19b2a8f99dec51cf24b73c",
"assets/assets/songthrush_close.png": "72e2ce4fdfd1b519e9ec09ad82a8f85a",
"assets/assets/kestrel_1.png": "bfc21115f95c8fdc4e9dc5efbc17e292",
"assets/assets/sparrow.png": "e8172558a854bdb2b75017b8313f4c8b",
"assets/assets/blackbird_3.png": "813823d1c9e918d841fcef76771b0440",
"assets/assets/coaltit1.png": "bb81400169160b2d2189623e28b32f9b",
"assets/assets/kestrel_2.png": "bcec920aa493d1b7fa515e823620b74d",
"assets/assets/bluetit_close.png": "be3499d32d34a17f18ec1c56f6d2ae7c",
"assets/assets/starling2.png": "5b62c49ff623a02d73bad823c30553f1",
"assets/assets/longtailedtit2.png": "46c002113b749f8ffc4e89d2da64f217",
"assets/assets/greenfinch.png": "512fc448078b50c7dc52b9646c0af258",
"assets/assets/jackdaw.png": "a33c3f0907d7fb5547af913669896f82",
"assets/assets/magpie3.png": "73c35d2c6a2066d775f27b35e7154a88",
"assets/assets/wren_close.png": "12312aaccb57f503d0fce220a0e246d8",
"assets/assets/longtailedtit3.png": "579912d23c7542e72dec39dc63a83019",
"assets/assets/blackbird1.png": "86b6bd21f933beca5587d5202186aeed",
"assets/assets/starling5.png": "8f017316c003e6cb0ce9a5037c572446",
"assets/assets/bird_boxes/alicante_open.jpg": "55d254d1a4a80c3c20ae48f426545781",
"assets/assets/bird_boxes/seville.jpg": "ea51014140180fe8c4d1d78ef9cc8050",
"assets/assets/bird_boxes/alicante.jpg": "4fa640eea62ee423fe3667af1b330d34",
"assets/assets/pigeon.png": "e11eafe68e3bbce37f01e5ba7608d34a",
"assets/assets/magpie1.png": "ff8eac982fefc2fc8c7c706ed9fcee5d",
"assets/assets/blackbird2.png": "24e0410f3807997f3283229d07d49fe2",
"assets/assets/starling4.png": "88a0402c7777bf8d6f2fabf6440b7fe6",
"assets/assets/wren3.png": "d75c7053527336a420413773088fe6ad",
"assets/assets/kestrel.png": "87a04d17a649e5d2abfcdd36612a36e0",
"assets/assets/wren2.png": "3b567c228834f2339c1732f9999831c7",
"assets/assets/nuthatch_close.png": "248609bd63bd326e992122cd5b8089c2",
"assets/assets/goldfinch.png": "394766913d9e2fd021c6f177aaba6502",
"assets/assets/bluetit3.png": "1ca3ee8854eebefbde8d6bcceef0f078",
"assets/assets/wren.png": "3ef4a8057a865bd8b251e52019d4b84b",
"assets/assets/sparrow_1.png": "9acdf75b5cdb208a9c21a8f6d220e419",
"assets/assets/dunnock1.png": "224f149c7901b7296915beb287ff87c3",
"assets/assets/dunnock.png": "31b98682ef961ce46e2c88fcdfa0262d",
"assets/assets/longtailedtit.png": "00890a81cbf75f2c38f5901600ce3137",
"assets/assets/sparrow_2.png": "9495dcb428bb9a7d9bfd29cd701b1bc3",
"assets/assets/bluetit4.png": "c3b7f5029059949726c4fc1878c3bc92",
"assets/assets/robin_close.png": "86c2e979f65a4b682e47888a7774ab0e",
"assets/assets/dunnock_close.png": "8cb815d3bc24a08125cb9b2884c81f2d",
"assets/assets/sparrow_3.png": "2988cae8042ea2617b4ff80ba6476ee9",
"assets/assets/jay.png": "25aa1ad8408e3bdb18e19b7ba22cc7c2"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
