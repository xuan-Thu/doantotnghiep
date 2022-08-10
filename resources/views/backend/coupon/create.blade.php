@extends('backend.layouts.master')

@section('main-content')

<div class="card">
  <h5 class="card-header">Add Coupon</h5>
  <div class="card-body">
    <form method="post" action="{{route('coupon.store')}}">
      {{csrf_field()}}
      <div class="form-group">
        <label for="inputTitle" class="col-form-label">Coupon Code <span class="text-danger">*</span></label>
        <input id="inputTitle" type="text" name="code" placeholder="Enter Coupon Code"  value="{{old('code')}}" class="form-control">
        @error('code')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group">
        <label for="type" class="col-form-label">Type <span class="text-danger">*</span></label>
        <select name="type" class="form-control">
          <option value="fixed">Fixed</option>
          <option value="percent">Percent</option>
        </select>
        @error('type')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group">
        <label for="inputTitle" class="col-form-label">Value <span class="text-danger">*</span></label>
        <input id="inputTitle" type="number" name="value" placeholder="Enter Coupon value"  value="{{old('value')}}" class="form-control">
        @error('value')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group">
        <label for="inputTitle" class="col-form-label">Slug <span class="text-danger">*</span></label>
        <input id="inputTitle" type="number" name="slug" placeholder="Enter Coupon Slug"  value="{{old('value')}}" class="form-control">
        @error('slug')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group">
        <label for="inputTitle" class="col-form-label">Start <span class="text-danger">*</span></label>
        <input id="inputTitle" type="date" name="start" placeholder="Enter Coupon Start"  value="{{old('value')}}" class="form-control">
        @error('start')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group">
        <label for="inputTitle" class="col-form-label">End1 <span class="text-danger">*</span></label>
        <input id="inputTitle" type="date" name="end1" placeholder="Enter Coupon End1"  value="{{old('value')}}" class="form-control">
        @error('end1')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group">
        <label for="inputTitle" class="col-form-label">End2 <span class="text-danger">*</span></label>
        <input id="inputTitle" type="date" name="end2" placeholder="Enter Coupon End2"  value="{{old('value')}}" class="form-control">
        @error('end2')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group">
        <label for="status" class="col-form-label">Status <span class="text-danger">*</span></label>
        <select name="status" class="form-control">
          <option value="active">Active</option>
          <option value="inactive">Inactive</option>
        </select>
        @error('status')
        <span class="text-danger">{{$message}}</span>
        @enderror
      </div>
      <div class="form-group mb-3">
        <button type="reset" class="btn btn-warning">Reset</button>
        <button class="btn btn-success" type="submit">Submit</button>
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