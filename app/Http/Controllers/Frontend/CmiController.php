<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CmiController extends Controller
{
    const STORE_KEY = 'Rentacs0';


    public function okFail(Request $request)
    {
        $cmi = $this->validate($request, [
            'okUrl' => '',
            'amount' => '',
            'failUrl' => '',
            'TranType' => '',
            'callbackUrl' => '', 
            'shopurl' => '',
            'currency' => '',
            'rnd' => '',
            'storetype' => '',
            'hashAlgorithm' => '',
            'lang' => '',
            'refreshtime' => '', 
            'clientid' => '',
            'email' => '',
            'BillToName' => '',
            'BillToCompany' => '',
            'BillToStreet1' => '',
            'tel' => '',
            'BillToPostalCode' => '',
            'BillToCity' => '',
            'BillToCountry' => '',
            'BillToStateProv' => '',
            'encoding' => '',
            'oid' => '',
            'HASH' => '',
        ]);

        return redirect()->route('home');

        //return view('pages.frontend.cmi.ok-fail', compact('cmi'));
    }

    public function cmiCallback(Request $request)
    {
        $data = $this->validate($request, [
            'okUrl' => '',
            'amount' => '',
            'failUrl' => '',
            'TranType' => '',
            'callbackUrl' => '', 
            'shopurl' => '',
            'currency' => '',
            'rnd' => '',
            'storetype' => '',
            'hashAlgorithm' => '',
            'lang' => '',
            'refreshtime' => '', 
            'clientid' => '',
            'email' => '',
            'BillToName' => '',
            'BillToCompany' => '',
            'BillToStreet1' => '',
            'tel' => '',
            'BillToPostalCode' => '',
            'BillToCity' => '',
            'BillToCountry' => '',
            'BillToStateProv' => '',
            'encoding' => '',
            'oid' => '',
            'HASH' => '',
        ]);

        $actualHash = $this->createHash($data);
        $retrievedHash = $data["HASH"];

        if($retrievedHash == $actualHash) {
            if($request->input('ProcReturnCode') == "00")
                $response = "ACTION=POSTAUTH";
            else
                $response = "APPROVED";

        }else {
            $response = "FAILURE";
        }

        return response($response);
    }

    public function createHash($postParams)
    {
        natcasesort($postParams);		
        $hach = "";
        $hashval = "";					
        foreach ($postParams as $param) {				
            $paramValue = html_entity_decode(preg_replace("/\n$/","",$postParams[$param]), ENT_QUOTES, 'UTF-8'); 
        
            $hach = $hach . "(!".$param."!:!".$postParams[$param]."!)";
            $escapedParamValue = str_replace("|", "\\|", str_replace("\\", "\\\\", $paramValue));	
            
            $lowerParam = strtolower($param);
            if($lowerParam != "hash" && $lowerParam != "encoding" )	{
                $hashval = $hashval . $escapedParamValue . "|";
            }
        }
        
        $calculatedHashValue = hash('sha512', $hashval);  
	    return base64_encode (pack('H*',$calculatedHashValue));
    }
}
