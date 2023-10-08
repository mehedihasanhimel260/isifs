@extends('layouts.back-end.app')
@section('title', \App\CPU\translate('Supplier List'))
@push('css_or_js')
<!-- Custom styles for this page -->
<link href="{{asset('public/assets/back-end')}}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
@endpush

@section('content')
<div class="content container-fluid">
	<!-- Page Title -->
	<div class="mb-3">
		<h2 class="h1 mb-0 text-capitalize d-flex align-items-center gap-2">
			<img src="{{asset('/public/assets/back-end/img/employee.png')}}" width="20" alt="">
			Supplier Transaction
		</h2>
	</div>
	<!-- End Page Title -->
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header flex-wrap gap-10">
					<h5 class="mb-0 d-flex gap-2 align-items-center">
						Supplier Name :{{ $supplierslist->name }}
						<span class="badge badge-soft-dark radius-50 fz-12"></span>
					</h5>
				</div>

				<div class="table-responsive">
					<table id="datatable" style="text-align: {{Session::get('direction') === " rtl" ? 'right' : 'left' }};" class="table table-hover table-borderless table-thead-bordered table-align-middle card-table w-100">
						<thead class="thead-light thead-50 text-capitalize table-nowrap">
							<tr>
								<th>{{\App\CPU\translate('Previous Due')}}</th>
								<th>{{\App\CPU\translate('Payable')}}</th>
								<th>{{\App\CPU\translate('Pay')}}</th>
								<th>{{\App\CPU\translate('Action')}}</th>

							</tr>
						</thead>
						<tbody>


							<tr>
								<th>
									{{ $previousDue }}

								</th>
								<td class="text-capitalize">
									{{ $previousDue }}

								</td>
								<form action="{{ route('admin.supplier.management.receptupdate') }}">
									@csrf
									<input type="hidden" value="{{ $supplierslist->id }}" name="supplier_id">
									<input type="hidden" value="0" name="total_purchase">
									<td>
										<div class="col-md-3">
											<input type="text" value="" name="make_pay" class="form-control" placeholder="Ex:6525">
										</div>
									</td>
									<td>
										<div class="col-md-3">
											<button type="submit" class="btn btn-primary">Save</button>
										</div>
									</td>
								</form>
							</tr>

							<thead class="thead-light thead-50 text-capitalize table-nowrap">
								<tr>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
							</thead>
						</tbody>
					</table>
				</div>

				<div class="table-responsive mt-4">
					<div class="px-4 d-flex justify-content-lg-end">
						<!-- Pagination -->
						{{-- {{$supplierTransactionInfo->links()}} --}}
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header flex-wrap gap-10">
					<h5 class="mb-0 d-flex gap-2 align-items-center">
						Supplier Transaction History
						<span class="badge badge-soft-dark radius-50 fz-12"></span>
					</h5>
					<div>
					</div>
				</div>

				<div class="table-responsive">
					<table id="datatable" style="text-align: {{Session::get('direction') === " rtl" ? 'right' : 'left' }};" class="table table-hover table-borderless table-thead-bordered table-align-middle card-table w-100">
						<thead class="thead-light thead-50 text-capitalize table-nowrap">
							<tr>
								<th>{{\App\CPU\translate('SL')}}</th>
								<th>{{\App\CPU\translate('Purchase Amount')}}</th>
								<th>{{\App\CPU\translate('Paid')}}</th>
								<th>{{\App\CPU\translate('Date')}}</th>

							</tr>
						</thead>
						<tbody>
							@php
							$totalPurchase = 0;
							$totalPaid = 0;
							@endphp
							@foreach ($supplierTransactionInfo as $supplierTransaction)
							<tr>
								<th scope="row">{{ $loop->iteration }}</th>
								<td class="text-capitalize"> {{ $supplierTransaction->total_purchase }}</td>
								<td>
									{{ $supplierTransaction->make_pay }}
								</td>
								<td>{{ $supplierTransaction->created_at->format('d-M-Y') }}</td>

							</tr>
							@php
							$totalPurchase += $supplierTransaction->total_purchase;
							$totalPaid += $supplierTransaction->make_pay;
							@endphp
							@endforeach
							<thead class="thead-light thead-50 text-capitalize table-nowrap">
								<tr>
									<th></th>
									<th>Total Purchase :{{ $totalPurchase }}</th>
									<th>Total Paid : {{ $totalPaid }}</th>
									<th>Total Due:{{ $totalPurchase-$totalPaid }} </th>

								</tr>
							</thead>
						</tbody>
					</table>
				</div>

				<div class="table-responsive mt-4">
					<div class="px-4 d-flex justify-content-lg-end">
						<!-- Pagination -->
						{{-- {{$supplierTransactionInfo->links()}} --}}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection

@push('script')
<script>
	$(document).on('change', '.switcher_input', function () {
            let id = $(this).attr("id");

            let status = 0;
            if (jQuery(this).prop("checked") === true) {
                status = 1;
            }

            Swal.fire({
                title: '{{\App\CPU\translate('Are you sure')}}?',
                text: '{{\App\CPU\translate('want_to_change_status')}}',
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                cancelButtonText: 'No',
                confirmButtonText: 'Yes',
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                        }
                    });
                    $.ajax({
                        url: "{{url('/')}}/admin/employee/status/",
                        method: 'POST',
                        data: {
                            id: id,
                            status: status
                        },
                        success: function () {
                            toastr.success('{{\App\CPU\translate('Status updated successfully')}}');
                        }
                    });
                }
            })
        });
</script>
@endpush