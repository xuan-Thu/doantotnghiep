@extends('backend.layouts.master')

@section('main-content')

<div class="card">
  <h5 class="card-header">Edit Coupon</h5>
  <div class="card-body">
    <form method="post" action="{{route('coupon.update',$coupon->id)}}">
      @csrf 
      @method('PATCH')
      <div class="form-group">
        <label for="inputTitle" class="col-form-label">Coupon Code <span class="text-danger">*</span></label>
        <input id="inputTitle" type="text" name="code" placeholder="Enter Coupon Code"  value="{{$coupon->code}}" class="form-control">
        @error('code')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group">
        <label for="type" class="col-form-label">Type <span class="text-danger">*</span></label>
        <select name="type" class="form-control">
          <option value="fixed" {{(($coupon->type=='fixed') ? 'selected' : '')}}>Fixed</option>
          <option value="percent" {{(($coupon->type=='percent') ? 'selected' : '')}}>Percent</option>
        </select>
        @error('type')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group">
        <label for="inputTitle" class="col-form-label">Value <span class="text-danger">*</span></label>
        <input id="inputTitle" type="number" name="value" placeholder="Enter Coupon value"  value="{{$coupon->value}}" class="form-control">
        @error('value')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group">
        <label for="inputTitle" class="col-form-label">Slug <span class="text-danger">*</span></label>
        <input id="inputTitle" type="number" name="slug" placeholder="Enter Coupon Slug"  value="{{$coupon->slug}}" class="form-control">
        @error('slug')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group">
        <label for="inputTitle" class="col-form-label">Start <span class="text-danger">*</span></label>
        <input id="inputTitle" type="date" name="start" placeholder="Enter Coupon Start"  value="{{$coupon->start}}" class="form-control">
        @error('start')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group">
        <label for="inputTitle" class="col-form-label">End1 <span class="text-danger">*</span></label>
        <input id="inputTitle" type="date" name="end1" placeholder="Enter Coupon End1"  value="{{$coupon->end1}}" class="form-control">
        @error('end1')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group">
        <label for="inputTitle" class="col-form-label">End2 <span class="text-danger">*</span></label>
        <input id="inputTitle" type="date" name="end2" placeholder="Enter Coupon End2"  value="{{$coupon->end2}}" class="form-control">
        @error('end2')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group">
        <label for="status" class="col-form-label">Status <span class="text-danger">*</span></label>
        <select name="status" class="form-control">
          <option value="active" {{(($coupon->status=='active') ? 'selected' : '')}}>Active</option>
          <option value="inactive" {{(($coupon->status=='inactive') ? 'selected' : '')}}>Inactive</option>
        </select>
        @error('status')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group mb-3">
        <button class="btn btn-success" type="submit">Update</button>
      </div>
    </form>
  </div>
</div>

@endsection

@push('styles')
<link rel="stylesheet" href="{{asset('backend/summernote/summernote.min.css')}}">
@endpush
@push('scripts')
<script src="/vendor/laravel-filemanager/js/stand-alone-button.js"></script>
<script src="{{asset('backend/summernote/summernote.min.js')}}"></script>
<script>
  $('#lfm').filemanager('image');
  $(document).ready(function() {
  $('#description').summernote({
    placeholder: "Write short description.....",
    tabsize: 2,
    height: 150
  });
  });
</script>
@endpush