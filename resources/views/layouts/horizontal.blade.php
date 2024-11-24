<header class="is-fixed" id="page-topbar">
  <div class="navbar-header">
    <div class="d-flex">
      <div class="navbar-brand-box">
        <a href="{{ url('app') }}" class="logo logo-dark">
          <span class="logo-sm">
            <img src="{{ getSetting('app_logo', 'logo.svg') }}" alt="" width="50">
          </span>
          <span class="logo-lg">
            <img src="{{ getSetting('app_logo', 'logo.svg') }}" alt="" width="40">
          </span>
        </a>

        <a href="{{ url('app') }}" class="logo logo-light">
          <span class="logo-sm">
            <img src="{{ getSetting('app_logo', 'logo.svg') }}" alt="" width="50">
          </span>
          <span class="logo-lg">
            <img src="{{ getSetting('app_logo', 'logo.svg') }}" alt="" height="40">
          </span>
        </a>
      </div>

      <div class="app-search d-none d-lg-block">
        <div class="position-relative">
          {{-- <input type="text" class="form-control" readonly placeholder="Role" value="{{ implode(', ', auth()->user()->getRoleNames()->toArray()) }}"> --}}
          <input type="text" class="form-control" readonly placeholder="Role" value="{{ getSetting('app_name') }}">
          <span class="uil-check-circle"></span>
        </div>
      </div>

      <button type="button" class="btn btn-sm px-3 font-size-16 d-lg-none header-item waves-effect waves-light"
        data-bs-toggle="collapse" data-bs-target="#topnav-menu-content">
        <i class="fa fa-fw fa-bars"></i>
      </button>

    </div>

    <div class="d-flex">

      <div class="dropdown d-none d-lg-inline-block ms-1">
        <button type="button" class="btn header-item noti-icon waves-effect" data-bs-toggle="fullscreen">
          <i class="uil-minus-path"></i>
        </button>
      </div>

      <div class="dropdown d-inline-block">
        <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown"
          data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <img class="rounded-circle header-profile-user" src="{{ auth()->user()->link_avatar }}" alt="Header Avatar">
          <span class="d-none d-xl-inline-block ms-1 fw-medium font-size-15">
            {{ auth()->user()->name }}</span>
          <i class="uil-angle-down d-none d-xl-inline-block font-size-15"></i>
        </button>

        <div class="dropdown-menu dropdown-menu-end">
          <a class="dropdown-item text-center">
            <span class="align-middle badge bg-danger text-uppercase">
              <small>{{ implode(', ', auth()->user()->getRoleNames()->toArray()) }}</small>
            </span>
          </a>

          <div class="dropdown-divider"></div>

          <a class="dropdown-item" href="{{ url('app/account') }}">
            <i class="uil uil-user-circle font-size-18 align-middle text-muted me-1"></i>
            <span class="align-middle">AkunPengguna</span>
          </a>

          <a class="dropdown-item" href="{{ url('app/my-activity') }}">
            <i class="uil uil-wallet font-size-18 align-middle me-1 text-muted"></i>
            <span class="align-middle">Aktivitas Saya</span>
          </a>

          <a class="dropdown-item d-block" href="{{ url('app/change-password') }}">
            <i class="uil uil-cog font-size-18 align-middle me-1 text-muted"></i>
            <span class="align-middle">Ubah Kata Sandi</span>
          </a>

          <div class="dropdown-divider"></div>

          <a class="dropdown-item" href="{{ url('app/logout') }}">
            <i class="uil uil-sign-out-alt font-size-18 align-middle me-1 text-muted"></i>
            <span class="align-middle">Keluar</span>
          </a>
        </div>
      </div>

      <div class="dropdown d-inline-block">
        <button type="button" class="btn header-item noti-icon right-bar-toggle waves-effect">
          <i class="uil-cog"></i>
        </button>
      </div>

    </div>
  </div>

  <div class="container-fluid">
    <div class="topnav">
      <nav class="navbar navbar-light navbar-expand-lg topnav-menu">
        <div class="collapse navbar-collapse" id="topnav-menu-content">
          <ul class="navbar-nav">

            <li class="nav-item">
              <a class="nav-link {{ request()->is('app') ? 'active' : '' }}" href="{{ url('app') }}">
                <i class="uil-home-alt me-2"></i> Dashboard </a>
            </li>

            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle arrow-none" href="#" id="topnav-pages" role="button">
                <i class="uil-apps me-2"></i>Management Soal<div class="arrow-down"></div>
              </a>
              <div class="dropdown-menu" aria-labelledby="topnav-pages">

                @can('topic read')
                  <a href="{{ url('app/misi-pemda') }}"
                    class="dropdown-item {{ request()->is('app/misi-pemda') ? 'active' : '' }}">
                    Topic
                  </a>
                @endcan
                @can('soal read')
                  <a href="{{ url('app/soal') }}"
                    class="dropdown-item {{ request()->is('app/soal') ? 'active' : '' }}">
                    Bank Soal
                  </a>
                @endcan
              </div>
            </li>
            @include('layouts.ekstra')

          </ul>
        </div>
      </nav>
    </div>
  </div>
</header>
