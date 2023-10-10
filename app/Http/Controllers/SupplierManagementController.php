<?php

namespace App\Http\Controllers;

use App\Model\SupplierManagement;
use App\Model\SupplierPurchaseInfo;
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
    public function show(SupplierManagement $supplierManagement, $id)

    {

        $supplierslist = SupplierManagement::find($id);
        $supplierTransactionInfo = SupplierPurchaseInfo::where('supplier_id', $id)->paginate(10);
        $totalPurchase = $supplierTransactionInfo->sum('total_purchase');
        $totalPaid = $supplierTransactionInfo->sum('make_pay');

        $previousDue = $totalPurchase - $totalPaid;
        return view('admin-views.supplier-management.show', compact('supplierTransactionInfo', 'previousDue', 'supplierslist'));
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
    public function getSupplierData(Request $request)
    {
        $id = $request->input('supplier_id');

        // Retrieve data from the database based on $supplierId
        $supplierTransactionInfo = SupplierPurchaseInfo::where('supplier_id', $id)->paginate(10);
        $totalPurchase = $supplierTransactionInfo->sum('total_purchase');
        $totalPaid = $supplierTransactionInfo->sum('make_pay');
        return response()->json([
            'previous_due' =>  $totalPurchase - $totalPaid,
        ]);
    }

    public function recept(Request $request, $id)
    {
        $supplierslist = SupplierManagement::find($id);
        $supplierTransactionInfo = SupplierPurchaseInfo::where('supplier_id', $id)->paginate(10);

        $totalPurchase = $supplierTransactionInfo->sum('total_purchase');
        $totalPaid = $supplierTransactionInfo->sum('make_pay');

        $previousDue = $totalPurchase - $totalPaid;
        return view('admin-views.supplier-management.recept', compact('previousDue', 'supplierslist'));
    }
}
