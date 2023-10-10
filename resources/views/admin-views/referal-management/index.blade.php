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
            Referral Member List
        </h2>
    </div>
    <!-- End Page Title -->

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header flex-wrap gap-10">
                    <h5 class="mb-0 d-flex gap-2 align-items-center">
                        Referral Member linformantion
                        <span class="badge badge-soft-dark radius-50 fz-12"></span>
                    </h5>
                    <div>
                        <!-- Search -->
                        <form action="{{ url()->current() }}" method="GET">
                            <div class="input-group input-group-merge input-group-custom">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="tio-search"></i>
                                    </div>
                                </div>
                                <input type="search" name="search" class="form-control" placeholder="{{\App\CPU\translate('search_by_name_or_email_or_phone')}}" value="" required>
                                <button type="submit" class="btn btn--primary">{{\App\CPU\translate('search')}}</button>
                            </div>
                        </form>
                        <!-- End Search -->
                    </div>
                    <div class="d-flex justify-content-end">
                        <a href="{{route('admin.supplier.management.create')}}" class="btn btn--primary">
                            <i class="tio-add"></i>
                            <span class="text">{{\App\CPU\translate('Add')}} {{\App\CPU\translate('New')}}</span>
                        </a>
                    </div>
                </div>

                <div class="table-responsive">
                    <table id="datatable" style="text-align: {{Session::get('direction') === " rtl" ? 'right' : 'left' }};" class="table table-hover table-borderless table-thead-bordered table-align-middle card-table w-100">
                        <thead class="thead-light thead-50 text-capitalize table-nowrap">
                            <tr>
                                <th>{{\App\CPU\translate('SL')}}</th>
                                <th>{{\App\CPU\translate('Name')}}</th>
                                <th>{{\App\CPU\translate('Email')}}</th>
                                <th>{{\App\CPU\translate('Phone')}}</th>
                                <th>{{\App\CPU\translate('Address')}}</th>
                                <th class="text-center">{{\App\CPU\translate('action')}}</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($supplierslist as $supplierlist)
                            <tr>
                                <th scope="row">{{ $loop->iteration }}</th>
                                <td class="text-capitalize"> {{ $supplierlist->name }}</td>
                                <td>
                                    {{ $supplierlist->email }}
                                </td>
                                <td>{{ $supplierlist->phone }}</td>
                                <td>{{ $supplierlist->address }}</td>
                                <td>
                                    <div class="d-flex justify-content-center">

                                        <a href="{{route('admin.referral.management.edit', $supplierlist->id)}}" class="btn btn-outline--primary btn-sm square-btn mr-2" title="{{\App\CPU\translate('Edit')}}">
                                            <i class="tio-edit"></i>
                                        </a>

                                        <a href="{{route('admin.referral.management.show', $supplierlist->id)}}" class="btn btn-outline--primary btn-sm square-btn" title="{{\App\CPU\translate('Transaction')}}">
                                            <i class="tio-money"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>

                            @endforeach
                        </tbody>
                    </table>
                </div>

                <div class="table-responsive mt-4">
                    <div class="px-4 d-flex justify-content-lg-end">
                        <!-- Pagination -->
                        {{$supplierslist->links()}}
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