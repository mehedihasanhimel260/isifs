@extends('layouts.back-end.app')
@section('title', \App\CPU\translate('Supplier Edit'))
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
			{{\App\CPU\translate('Supplier info_Update')}}
		</h2>
	</div>
	<!-- End Page Title -->

	<!-- Content Row -->
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h5 class="mb-0">{{\App\CPU\translate('Supplier info')}} {{\App\CPU\translate('Update')}} {{\App\CPU\translate('form')}}</h5>
				</div>
				<div class="card-body">
					<form action="{{route('admin.supplier.management.update',$supplierinfo->id)}}" method="post" enctype="multipart/form-data" style="text-align: {{Session::get('direction') === " rtl" ? 'right' : 'left' }};">
						@csrf
						<div class="form-group">
							<div class="row">
								<div class="col-md-6 form-group">
									<label for="name" class="title-color">{{\App\CPU\translate('Name')}}</label>
									<input type="text" name="name" value="{{ $supplierinfo->name }}" class="form-control" id="name" placeholder="{{\App\CPU\translate('Ex')}} : Jhon Doe">
								</div>
								<div class="col-md-6 form-group">
									<label for="phone" class="title-color">{{\App\CPU\translate('Phone')}}</label>
									<input type="number" value="{{ $supplierinfo->phone }}" required name="phone" class="form-control" id="phone" placeholder="{{\App\CPU\translate('Ex')}} : +88017********">
								</div>
								<div class="col-md-6 form-group">
									<label for="email" class="title-color">{{\App\CPU\translate('Email')}}</label>
									<input type="email" value="{{ $supplierinfo->email }}" name="email" class="form-control" id="email" placeholder="{{\App\CPU\translate('Ex')}} : ex@gmail.com" required>
								</div>
								<div class="col-md-6 form-group">
									<label for="address" class="title-color">{{\App\CPU\translate('Address')}}</label>
									<input type="text" value="{{ $supplierinfo->address }}" name="address" class="form-control" id="address" placeholder="{{\App\CPU\translate('Ex')}} : ex@gmail.com" required>
								</div>
							</div>
						</div>
						<div class="d-flex justify-content-end">
							<button type="submit" class="btn btn--primary px-4">{{\App\CPU\translate('Update')}}</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!--modal-->
	@include('shared-partials.image-process._image-crop-modal',['modal_id'=>'employee-image-modal'])
	<!--modal-->
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

@include('shared-partials.image-process._script',[
'id'=>'employee-image-modal',
'height'=>200,
'width'=>200,
'multi_image'=>false,
'route'=>route('image-upload')
])
@endpush