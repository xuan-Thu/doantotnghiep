<!DOCTYPE html>
<html lang="en">
<head>
  @include('backend.layouts.head')
</head>
<body>
    <div class="container-fluid">
        <div class="row" style="margin-top:10%">
            <!-- 404 Error Text -->
            <div class="col-md-12">
                <div class="text-center">
                    <div class="error mx-auto" data-text="404">404</div>
                    <p class="lead text-gray">Trang này giống như tình cảm của crush dành cho bạn vậy</p>
                    <p class="text-danger">Nó không tồn tại!! ( ´･･)ﾉ(._.`)</p>
                    {{-- {{dd(auth()->user())}}; --}}
                    <a href="{{route('home')}}">&larr; Back to Home</a>
                </div>
            </div>
        </div>
    </div>
    @include('backend.layouts.footer')
</body>
</html>
