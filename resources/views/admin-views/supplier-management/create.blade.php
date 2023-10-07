@extends('layouts.back-end.app')
@section('title', \App\CPU\translate('Supplier Add'))
@push('css_or_js')
<link href="{{asset('public/assets/back-end')}}/css/select2.min.css" rel="stylesheet" />
<meta name="csrf-token" content="{{ csrf_token() }}">
@endpush

@section('content')
<div class="content container-fluid">
	<!-- Page Title -->
	<div class="mb-3">
		<h2 class="h1 mb-0 text-capitalize d-flex align-items-center gap-2">
			<img src="{{asset('/public/assets/back-end/img/add-new-employee.png')}}" alt="">
			{{\App\CPU\translate('Add new supplier')}}
		</h2>
	</div>
	<!-- End Page Title -->

	<!-- Content Row -->
	<div class="row">
		<div class="col-md-12">
			<form action="{{route('admin.supplier.management.store')}}" method="post" enctype="multipart/form-data" style="text-align: {{Session::get('direction') === " rtl" ? 'right' : 'left' }};">
				@csrf
				<div class="card">
					<div class="card-body">
						<h5 class="mb-0 page-header-title d-flex align-items-center gap-2 border-bottom pb-3 mb-3">
							<i class="tio-user"></i>
							{{\App\CPU\translate('General_Information')}}
						</h5>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="name" class="title-color">{{\App\CPU\translate('Full Name')}}</label>
									<input type="text" name="name" class="form-control" id="name" placeholder="{{\App\CPU\translate('Ex')}} : Jhon Doe" value="{{old('name')}}" required>
								</div>
								<div class="form-group">
									<label for="phone" class="title-color">{{\App\CPU\translate('Phone')}}</label>
									<input type="number" name="phone" value="{{old('phone')}}" class="form-control" id="phone" placeholder="{{\App\CPU\translate('Ex')}} : +88017********" required>
								</div>
								<div class="form-group">
									<label for="email" class="title-color">{{\App\CPU\translate('Email')}}</label>
									<input type="email" name="email" value="{{old('email')}}" class="form-control" id="email" placeholder="{{\App\CPU\translate('Ex')}} : ac*****@mail.com" required>
								</div>
								<div class="form-group">
									<label for="address" class="title-color">{{\App\CPU\translate('Address')}}</label>
									<input type="text" name="address" value="{{old('address')}}" class="form-control" id="address" placeholder="{{\App\CPU\translate('Ex')}} : jamuna,Dhaka" required>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card mt-3">
					<div class="card-body">

						<div class="d-flex justify-content-end gap-3">
							<button type="reset" id="reset" class="btn btn-secondary px-4">{{\App\CPU\translate('reset')}}</button>
							<button type="submit" class="btn btn--primary px-4">{{\App\CPU\translate('submit')}}</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
@endsection

@push('script')
<script src="{{asset('public/assets/back-end')}}/js/select2.min.js"></script>
<script>
	function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#viewer').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#customFileUpload").change(function () {
            readURL(this);
        });

        $(".js-example-theme-single").select2({
            theme: "classic"
        });

        $(".js-example-responsive").select2({
            width: 'resolve'
        });
</script>

<script src="{{asset('public/assets/back-end/js/spartan-multi-image-picker.js')}}"></script>
<script type="text/javascript">
	$(function () {
            $("#coba").spartanMultiImagePicker({
                fieldName: 'identity_image[]',
                maxCount: 5,
                rowHeight: 'auto',
                groupClassName: 'col-6 col-lg-4',
                maxFileSize: '',
                placeholderImage: {
                    image: '{{asset('public/assets/back-end/img/400x400/img2.jpg')}}',
                    width: '100%'
                },
                dropFileLabel: "Drop Here",
                onAddRow: function (index, file) {

                },
                onRenderedPreview: function (index) {

                },
                onRemoveRow: function (index) {

                },
                onExtensionErr: function (index, file) {
                    toastr.error('Please only input png or jpg type file', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                },
                onSizeErr: function (index, file) {
                    toastr.error('File size too big', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });
        });
</script>
@endpush