<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>{{ getSetting("app_name", "Laravel") }} - @yield("title")</title>
<meta name="csrf-token" content="{{ csrf_token() }}">
<link rel="icon" type="image/x-icon" href="{{ getSetting("app_favicon", "favicon.ico") }}">
<link rel="shortcut icon" href="{{ getSetting("app_favicon", "favicon.ico") }}" type="image/x-icon" />
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
