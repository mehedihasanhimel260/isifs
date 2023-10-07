<?php

namespace App\Http\Controllers;

use App\Model\SupplierManagement;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;

class SupplierManagementController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $supplierslist = SupplierManagement::get()->paginate(10);
        return view('admin-views.supplier-management.index', compact('supplierslist'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin-views.supplier-management.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        SupplierManagement::create($request->all());
        return redirect()->route('admin.supplier.management.index');
        Toastr::success('Supplier successfully added.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\SupplierManagement  $supplierManagement
     * @return \Illuminate\Http\Response
     */
    public function show(SupplierManagement $supplierManagement)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\SupplierManagement  $supplierManagement
     * @return \Illuminate\Http\Response
     */
    public function edit(SupplierManagement $supplierManagement, $id)
    {
        $supplierinfo = SupplierManagement::find($id);
        return view('admin-views.supplier-management.edit', compact('supplierinfo'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\SupplierManagement  $supplierManagement
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, SupplierManagement $supplierManagement, $id)
    {
        $supplierinfo = SupplierManagement::find($id);
        $supplierinfo->update($request->all());
        return redirect()->route('admin.supplier.management.index');
        Toastr::success('Supplier successfully updated.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\SupplierManagement  $supplierManagement
     * @return \Illuminate\Http\Response
     */
    public function destroy(SupplierManagement $supplierManagement)
    {
        //
    }
}
