<button type="submit" class="btn btn-primary {{$class ?? ''}}" id="{{$id ?? 'submitButton'}}">
    {!!  $icon ?? '<i class="fa fa-save me-2"></i>'!!} {{$label ?? strtoupper('submit')}}
</button>
