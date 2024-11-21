<div class="btn-toolbar demo-inline-spacing" role="toolbar" aria-label="Toolbar with button groups">
  <div class="btn-group btn-group-sm" role="group" aria-label="First group">

    @canany([$permissionUpdate, $permissionValidation])
      <a href="javascript:editForm()" class="btn btn-sm btn-success">
        <i class="fa fa-edit fa-fw"></i>
        <span class="d-none d-sm-inline-block">Ubah</span>
      </a>
    @endcan

    @can($permissionDelete)
      <a href="javascript:_delete()" class="btn btn-sm btn-danger">
        <i class="fa fa-trash fa-fw"></i>
        <span class="d-none d-sm-inline-block">Hapus</span>
      </a>
    @endcan

  </div>
</div>
