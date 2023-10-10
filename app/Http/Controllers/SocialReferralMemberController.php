<?php

namespace App\Http\Controllers;

use App\Model\SocialReferralMember;
use App\Model\SocialReferralMemberInfo;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;

class SocialReferralMemberController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $supplierslist = SocialReferralMember::get()->paginate(10);
        return view('admin-views.social-referal-management.index', compact('supplierslist'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\SocialReferralMember  $socialReferralMember
     * @return \Illuminate\Http\Response
     */
    public function show(SocialReferralMember $socialReferralMember, $id)
    {
        $supplierslist = SocialReferralMember::find($id);
        $supplierTransactionInfo = SocialReferralMemberInfo::where('referral_id', $id)->paginate(10);
        return view('admin-views.referal-management.show', compact('supplierTransactionInfo', 'supplierslist'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\SocialReferralMember  $socialReferralMember
     * @return \Illuminate\Http\Response
     */
    public function edit(SocialReferralMember $socialReferralMember, $id)
    {
        $supplierinfo = SocialReferralMember::find($id);
        return view('admin-views.social-referal-management.edit', compact('supplierinfo'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\SocialReferralMember  $socialReferralMember
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, SocialReferralMember $socialReferralMember, $id)
    {
        $supplierinfo = SocialReferralMember::find($id);
        $supplierinfo->update($request->all());
        return redirect()->route('admin.referral.management.index');
        Toastr::success('referral successfully updated.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\SocialReferralMember  $socialReferralMember
     * @return \Illuminate\Http\Response
     */
    public function destroy(SocialReferralMember $socialReferralMember)
    {
        //
    }
}
