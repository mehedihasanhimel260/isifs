<?php

namespace App\Http\Controllers;

use App\Model\ReferralMember;
use App\Model\ReferralMemberinfo;
use Illuminate\Http\Request;

use Brian2694\Toastr\Facades\Toastr;

class ReferralMemberController extends Controller
{
    public function index()
    {
        $supplierslist = ReferralMember::get()->paginate(10);
        return view('admin-views.referal-management.index', compact('supplierslist'));
    }
    public function edit($id)
    {
        $supplierinfo = ReferralMember::find($id);
        return view('admin-views.referal-management.edit', compact('supplierinfo'));
    }
    public function update(Request $request, $id)
    {
        $supplierinfo = ReferralMember::find($id);
        $supplierinfo->update($request->all());
        return redirect()->route('admin.referral.management.index');
        Toastr::success('referral successfully updated.');
    }
    public function show($id)

    {

        $supplierslist = ReferralMember::find($id);
        $supplierTransactionInfo = ReferralMemberinfo::where('referral_id', $id)->paginate(10);
        return view('admin-views.referal-management.show', compact('supplierTransactionInfo', 'supplierslist'));
    }
}
