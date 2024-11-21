<li class="nav-item dropdown">
  <a class="nav-link dropdown-toggle arrow-none" href="#" id="topnav-pages" role="button">
    <i class="uil-cog me-2"></i>Konfigurasi <div class="arrow-down"></div>
  </a>
  <div class="dropdown-menu" aria-labelledby="topnav-pages">


    @can('users read')
      <a href="{{ url('app/users') }}" class="dropdown-item {{ request()->is('app/users') ? 'active' : '' }}">Pengguna
        Aplikasi</a>
    @endcan
    @can('activity')
      <a href="{{ url('app/activity-log') }}"
        class="dropdown-item {{ request()->is('app/activity-log') ? 'active' : '' }}">Log Aktivitas</a>
    @endcan

    @can('setting app')
      <a href="{{ url('app/settings') }}" class="dropdown-item {{ request()->is('app/settings') ? 'active' : '' }}"">Set
        Aplikasi</a>
    @endcan

    @role('superadmin')
      <a href="{{ url('app/permission') }}"
        class="dropdown-item {{ request()->is('app/permission') ? 'active' : '' }}">Permission</a>
      <a href="{{ url('app/role') }}" class="dropdown-item {{ request()->is('app/role') ? 'active' : '' }}">Role</a>
    @endrole

  </div>
</li>
