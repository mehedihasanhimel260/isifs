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
            Referral Member's Transaction
        </h2>
    </div>
    <!-- End Page Title -->
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header flex-wrap gap-10">
                    <h5 class="mb-0 d-flex gap-2 align-items-center">
                        Referral Member Name :{{ $supplierslist->name }}
                        <span class="badge badge-soft-dark radius-50 fz-12"></span>
                    </h5>
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
                        Referral History
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
                                <th>{{\App\CPU\translate('Order ID')}}</th>
                                <th>{{\App\CPU\translate('Quantity')}}</th>
                                <th>{{\App\CPU\translate('Date')}}</th>

                            </tr>
                        </thead>
                        <tbody>
                            @php
                            $totalPaid = 0;
                            @endphp
                            @foreach ($supplierTransactionInfo as $supplierTransaction)
                            <tr>
                                <th scope="row">{{ $loop->iteration }}</th>
                                <td class="text-capitalize"> {{ $supplierTransaction->order_id }}</td>
                                <td>
                                    {{ $supplierTransaction->quntity }}
                                </td>
                                <td>{{ $supplierTransaction->created_at->format('d-M-Y') }}</td>

                            </tr>
                            @php
                            $totalPaid += $supplierTransaction->quntity;
                            @endphp
                            @endforeach
                            <thead class="thead-light thead-50 text-capitalize table-nowrap">
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th>Total Quantity : {{ $totalPaid }}</th>
                                    <th></th>

                                </tr>
                            </thead>
                        </tbody>
                    </table>
                </div>

                <div class="table-responsive mt-4">
                    <div class="px-4 d-flex justify-content-lg-end">
                        <!-- Pagination -->
                        {{$supplierTransactionInfo->links()}}
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