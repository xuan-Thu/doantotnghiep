@extends('frontend.layouts.master')
@section('title','Checkout page')
@section('main-content')
    <!-- Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="bread-inner">
                        <ul class="bread-list">
                            <li><a href="{{route('home')}}">Home<i class="ti-arrow-right"></i></a></li>
                            <li class="active"><a href="javascript:void(0)">Checkout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
    <!-- Start Checkout -->
    <section class="shop checkout section">
        <div class="container">
            <form class="form" method="POST" action="{{route('cart.order')}}">
                @csrf
                <div class="row">
                    <div class="col-lg-8 col-12">
                        <div class="checkout-form">
                            <h2>Make Your Checkout Here</h2>
                            <p>Please register in order to checkout more quickly</p>
                            <!-- Form -->
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="form-group">
                                        <label>First Name<span>*</span></label>
                                        <input type="text" name="first_name" placeholder="User" value="User">
                                        @error('first_name')
                                            <span class='text-danger'>{{$message}}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="form-group">
                                        <label>Last Name<span>*</span></label>
                                        <input type="text" name="last_name" placeholder="" value="Test">
                                        @error('last_name')
                                            <span class='text-danger'>{{$message}}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="form-group">
                                        <label>Email Address<span>*</span></label>
                                        <input type="email" name="email" placeholder="" value="user@gmail.com">
                                        @error('email')
                                            <span class='text-danger'>{{$message}}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="form-group">
                                        <label>Phone Number <span>*</span></label>
                                        <input type="number" name="phone" placeholder="" required value="{{old('phone')}}">
                                        @error('phone')
                                            <span class='text-danger'>{{$message}}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="form-group">
                                        <label>Country<span>*</span></label>
                                        <select name="country" id="country">
                                            <option value="">Vui l??ng ch???n m???t khu v???c.</option>
                                            <option value="AnGiang">An Giang</option>
                                            <option value="BaRia_VungTau">B?? R???a - V??ng T??u</option>
                                            <option value="Bac_Giang">TP. B???c Giang</option>
                                            <option value="Bac_Kan">Th??nh ph??? B???c K???n</option>
                                            <option value="Bac_Lieu">B???c Li??u</option>
                                            <option value="Bac_Ninh">Th??nh ph??? B???c Ninh</option>
                                            <option value="Ben_Tre">Th??nh ph??? B???n Tre</option>
                                            <option value="Binh_??inh">B??nh ?????nh</option>
                                            <option value="BinhDuong">B??nh D????ng</option>
                                            <option value="Binh_Phuoc">B??nh Ph?????c</option>
                                            <option value="BinhThuan">B??nh Thu???n</option>
                                            <option value="Ca_Mau">Th??nh ph??? C?? Mau</option>
                                            <option value="Can_Tho">C???n Th??</option>
                                            <option value="Cao_Bang">Cao B???ng</option>
                                            <option value="??a_Nang">???? N???ng</option>
                                            <option value="??ak_Lak">?????k L???k</option>
                                            <option value="??ak_Nong">?????k N??ng</option>
                                            <option value="??ien_Bien">??i???n Bi??n</option>
                                            <option value="??ong_Nai">?????ng Nai</option>
                                            <option value="??ong_Thap">?????ng Th??p</option>
                                            <option value="Gia_Lai">Gia Lai</option>
                                            <option value="Ha_Giang">Th??nh ph??? H?? Giang</option>
                                            <option value="Ha_Nam">H?? Nam</option>
                                            <option value="Ha_Noi">H?? N???i</option>
                                            <option value="Ha_Tinh">H?? T??nh</option>
                                            <option value="HaiDuong">Th??nh ph??? H???i D????ng</option>
                                            <option value="Hai_Phong">H???i Ph??ng</option>
                                            <option value="Ho_Chi_Minh">H??? Ch?? Minh</option>
                                            <option value="Hoa_Binh">H??a B??nh</option>
                                            <option value="Hung_Yen">H??ng Y??n</option>
                                            <option value="Khanh_Hoa">Kh??nh H??a</option>
                                            <option value="Kien_Giang">Ki??n Giang</option>
                                            <option value="Kon_Tum">Kon Tum</option>
                                            <option value="Lai_Chau">Lai Ch??u</option>
                                            <option value="Lam_??ong">L??m ?????ng</option>
                                            <option value="Lang_Son">Th??nh ph??? L???ng S??n</option>
                                            <option value="Lao_Cai">L??o Cai</option>
                                            <option value="Long_An">Long An</option>
                                            <option value="Nam_??inh">Th??nh ph??? Nam ?????nh</option>
                                            <option value="Nghe_An">Ngh??? An</option>
                                            <option value="Ninh_Binh">Th??nh ph??? Ninh B??nh</option>
                                            <option value="Ninh_Thuan">Ninh Thu???n</option>
                                            <option value="Phu_Tho">Ph?? Th???</option>
                                            <option value="Phu_Yen">Ph?? Y??n</option>
                                            <option value="Quang_Binh">Qu???ng B??nh</option>
                                            <option value="Quang_Nam">Qu???ng Nam</option>
                                            <option value="Quang_Ngai">Th??nh ph??? Qu???ng Ng??i</option>
                                            <option value="Quang_Ninh">Qu???ng Ninh</option>
                                            <option value="Quang_Tri">Qu???ng Tr???</option>
                                            <option value="Khanh_Hung">Kh??nh H??ng</option>
                                            <option value="Son_La">S??n La</option>
                                            <option value="Tay_Ninh">T??y Ninh</option>
                                            <option value="Thai_Binh">Th??nh ph??? Th??i B??nh</option>
                                            <option value="Thai_Nguyen">Th??i Nguy??n</option>
                                            <option value="Thanh_Hoa">Thanh H??a</option>
                                            <option value="Thua_Thien_Hue">Th???a Thi??n - Hu???</option>
                                            <option value="Tien_Giang">Ti???n Giang</option>
                                            <option value="Tra_Vinh">Tr?? Vinh</option>
                                            <option value="Tuyen_Quang">Tuy??n Quang</option>
                                            <option value="Vinh_Long">Th??nh ph??? V??nh Long</option>
                                            <option value="Vinh_Phuc">V??nh Ph??c</option>
                                            <option value="Yen_Bai">Th??nh ph??? Y??n B??i</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="form-group">
                                    <label>Address Line<span>*</span></label>
                                        <input type="text" name="address1" placeholder="" value="{{old('address1')}}">
                                        @error('address1')
                                            <span class='text-danger'>{{$message}}</span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <!--/ End Form -->
                        </div>
                    </div>
                    <div class="col-lg-4 col-12">
                        <div class="order-details">
                            <!-- Order Widget -->
                            <div class="single-widget">
                                <h2>CART TOTALS</h2>
                                <div class="content">
                                    <ul>
                                        <li class="order_subtotal" data-price="{{Helper::totalCartPrice()}}">Cart Subtotal<span>${{number_format(Helper::totalCartPrice(),2)}}</span></li>
                                        <li class="shipping">
                                            Shipping Cost
                                            @if(count(Helper::shipping())>0 && Helper::cartCount()>0)
                                                <select name="shipping" class="nice-select">
                                                    <option value="">Select your address</option>
                                                    @foreach(Helper::shipping() as $shipping)
                                                    <option value="{{$shipping->id}}" class="shippingOption" data-price="{{$shipping->price}}">{{$shipping->type}}: ${{$shipping->price}}</option>
                                                    @endforeach
                                                </select>
                                            @else
                                                <span>Free</span>
                                            @endif
                                        </li>
                                        @if(session('coupon'))
                                        <li class="coupon_price" data-price="{{session('coupon')['value']}}">You Save<span>${{number_format(session('coupon')['value'],2)}}</span></li>
                                        @endif
                                        @php
                                            $total_amount=Helper::totalCartPrice();
                                            if(session('coupon')){
                                                $total_amount=$total_amount-session('coupon')['value'];
                                            }
                                        @endphp
                                        @if(session('coupon'))
                                            <li class="last" id="order_total_price">Total<span>${{number_format($total_amount,2)}}</span></li>
                                        @else
                                            <li class="last" id="order_total_price">Total<span>${{number_format($total_amount,2)}}</span></li>
                                        @endif
                                    </ul>
                                </div>
                            </div>
                            <!--/ End Order Widget -->
                            <!-- Order Widget -->
                            <div class="single-widget">
                                <h2>Payments</h2>
                                <div class="content">
                                    <div class="checkbox">
                                        {{-- <label class="checkbox-inline" for="1"><input name="updates" id="1" type="checkbox"> Check Payments</label> --}}
                                        <form-group>
                                            <input name="payment_method" type="radio" value="cod"> <label> Cash On Delivery</label><br>
                                            <input name="payment_method" type="radio" value="cod"> <label> PayPal</label>
                                        </form-group>
                                    </div>
                                </div>
                            </div>
                            <!--/ End Order Widget -->
                            <!-- Payment Method Widget -->
                            <div class="single-widget payement">
                                <div class="content">
                                    <img src="{{('backend/img/payment-method.png')}}" alt="#">
                                </div>
                            </div>
                            <!--/ End Payment Method Widget -->
                            <!-- Button Widget -->
                            <div class="single-widget get-button">
                                <div class="content">
                                    <div class="button">
                                        <button type="submit" class="btn">proceed to checkout</button>
                                    </div>
                                </div>
                            </div>
                            <!--/ End Button Widget -->
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!--/ End Checkout -->
    <!-- Start Shop Services Area  -->
    <section class="shop-services section home">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Service -->
                    <div class="single-service">
                        <i class="ti-rocket"></i>
                        <h4>Free shiping</h4>
                        <p>Orders over $100</p>
                    </div>
                    <!-- End Single Service -->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Service -->
                    <div class="single-service">
                        <i class="ti-reload"></i>
                        <h4>Free Return</h4>
                        <p>Within 30 days returns</p>
                    </div>
                    <!-- End Single Service -->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Service -->
                    <div class="single-service">
                        <i class="ti-lock"></i>
                        <h4>Sucure Payment</h4>
                        <p>100% secure payment</p>
                    </div>
                    <!-- End Single Service -->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Start Single Service -->
                    <div class="single-service">
                        <i class="ti-tag"></i>
                        <h4>Best Price</h4>
                        <p>Guaranteed price</p>
                    </div>
                    <!-- End Single Service -->
                </div>
            </div>
        </div>
    </section>
    <!-- End Shop Services -->

    <!-- Start Shop Newsletter -->
    <section class="shop-newsletter section">
        <div class="container">
            <div class="inner-top">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 col-12">
                        <!-- Start Newsletter Inner -->
                        <div class="inner">
                            <h4>Newsletter</h4>
                            <p> Subscribe to our newsletter and get <span>10%</span> off your first purchase</p>
                            <form action="mail/mail.php" method="get" target="_blank" class="newsletter-inner">
                                <input name="EMAIL" placeholder="Your email address" required="" type="email">
                                <button class="btn">Subscribe</button>
                            </form>
                        </div>
                        <!-- End Newsletter Inner -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Shop Newsletter -->
@endsection
@push('styles')
	<style>
		li.shipping{
			display: inline-flex;
			width: 100%;
			font-size: 14px;
		}
		li.shipping .input-group-icon {
			width: 100%;
			margin-left: 10px;
		}
		.input-group-icon .icon {
			position: absolute;
			left: 20px;
			top: 0;
			line-height: 40px;
			z-index: 3;
		}
		.form-select {
			height: 30px;
			width: 100%;
		}
		.form-select .nice-select {
			border: none;
			border-radius: 0px;
			height: 40px;
			background: #f6f6f6 !important;
			padding-left: 45px;
			padding-right: 40px;
			width: 100%;
		}
		.list li{
			margin-bottom:0 !important;
		}
		.list li:hover{
			background:#F7941D !important;
			color:white !important;
		}
		.form-select .nice-select::after {
			top: 14px;
		}
	</style>
@endpush
@push('scripts')
	<script src="{{asset('frontend/js/nice-select/js/jquery.nice-select.min.js')}}"></script>
	<script src="{{asset('frontend/js/select2/js/select2.min.js')}}"></script>
	<script>
		$(document).ready(function() { $("select.select2").select2(); });
  		$('select.nice-select').niceSelect();
	</script>
	<script>
		function showMe(box){
			var checkbox=document.getElementById('shipping').style.display;
			// alert(checkbox);
			var vis= 'none';
			if(checkbox=="none"){
				vis='block';
			}
			if(checkbox=="block"){
				vis="none";
			}
			document.getElementById(box).style.display=vis;
		}
	</script>
	<script>
		$(document).ready(function(){
			$('.shipping select[name=shipping]').change(function(){
				let cost = parseFloat( $(this).find('option:selected').data('price') ) || 0;
				let subtotal = parseFloat( $('.order_subtotal').data('price') );
				let coupon = parseFloat( $('.coupon_price').data('price') ) || 0;
				// alert(coupon);
				$('#order_total_price span').text('$'+(subtotal + cost-coupon).toFixed(2));
			});
		});
	</script>
@endpush
