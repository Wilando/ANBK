<meta name="msapplication-TileColor" content="" />
<meta name="theme-color" content="" />
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="mobile-web-app-capable" content="yes" />
<meta name="HandheldFriendly" content="True" />
<meta name="MobileOptimized" content="320" />
<meta name="description" content="{{ getSetting("app_description", "Deskripsi") }}">
<meta name="keywords" content="{{ getSetting("app_keyword", "Keywords") }}">
<meta name="author" content="{{ getSetting("app_author", "Author") }}">
<meta name="canonical" content="{{ url()->current() }}">
<meta name="twitter:image:src" content="{{ getSetting("app_logo", "logo.png") }}">
<meta name="twitter:site" content="{{ getSetting("app_author", "Author") }}">
<meta name="twitter:card" content="summary">
<meta name="twitter:title" content="{{ getSetting("app_name", "Laravel") }} - @yield("title")">
<meta name="twitter:description" content="{{ getSetting("app_description", "Deskripsi") }}">
<meta property="og:image" content="{{ getSetting("app_logo", "logo.png") }}">
<meta property="og:image:width" content="1280">
<meta property="og:image:height" content="640">
<meta property="og:site_name" content="Tabler">
<meta property="og:type" content="object">
<meta property="og:title" content="{{ getSetting("app_name", "Laravel") }} - @yield("title")">
<meta property="og:url" content="{{ getSetting("app_logo", "logo.png") }}">
<meta property="og:description" content="{{ getSetting("app_description", "Deskripsi") }}">
