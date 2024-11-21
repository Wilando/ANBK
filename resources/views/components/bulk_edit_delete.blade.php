<div class="btn-toolbar demo-inline-spacing" role="toolbar" aria-label="Toolbar with button groups">
  <div class="btn-group btn-group-sm" role="group" aria-label="First group">

    @can($permissionUpdate)
      <a href="javascript:editForm()" class="btn btn-sm btn-success">
        <i class="fa fa-edit fa-fw"></i>
        <span class="d-none d-sm-inline-block">UBAH</span>
      </a>
    @else
      @can($permissionValidation)
        <a href="javascript:editForm()" class="btn btn-sm btn-success">
          <i class="fa fa-edit fa-fw"></i>
          <span class="d-none d-sm-inline-block">Validasi Status</span>
        </a>
      @endcan
    @endcan

    @can($permissionDelete)
      <a href="javascript:_delete()" class="btn btn-sm btn-danger">
        <i class="fa fa-trash fa-fw"></i>
        <span class="d-none d-sm-inline-block">HAPUS</span>
      </a>
    @endcan

  </div>
</div>
