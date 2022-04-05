<?php

namespace App\Services\Soap;

use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Http;
use SimpleXMLElement;
use Mtownsend\XmlToArray\XmlToArray;

class SoapService
{
    // Hold the class instance.
    private static $instance = null;

    private static $body = null;

    private static $contentType = 'text/xml';

    private static $service = null;

    private static $response = null;

    private static $url = null;

    private static $agencyCode = null;

    private static $brandCode = null;

    private static $pointOfSaleId = null;

    private static $defaultLang = null;

    // The constructor is private
    // to prevent initiation with outer code.
    private function __construct()
    {
        self::$url = config('soap.url');

        self::$agencyCode = config('soap.agence_code');

        self::$brandCode = config('soap.brand_code');

        self::$pointOfSaleId = config('soap.point_of_sale_id');

        self::$defaultLang = config('soap.xtravel_default_language');

        // The expensive process (e.g.,db connection) goes here.
    }

    // The object is created from within the class itself
    // only if the class has no instance.
    public static function getInstance()
    {
        if (self::$instance == null) {
            self::$instance = new SoapService();
        }

        return self::$instance;
    }


    public static function setService($service)
    {
        self::getInstance();

        self::$service = $service;

        return self::$instance;
    }

    public function setBody(string $method, string $rq1MethodName, bool $hasHeader = false, array $params = [], string $typOrTns = 'typ', bool $isEnv = false, array $afterLangParams = [])
    {
        self::getInstance();

        $bodyParams = "<agencyCode>" . self::$agencyCode . "</agencyCode><brandCode>" . self::$brandCode . "</brandCode><pointOfSaleId>" . self::$pointOfSaleId . "</pointOfSaleId>";

        foreach ($params as $key => $value) {
            $bodyParams = $bodyParams . "<" . $key . ">" . $value . "</" . $key . ">";
        }

        $bodyParams = $bodyParams . "<language>" . self::$defaultLang . "</language>";

        foreach ($afterLangParams as $key => $value) {
            $bodyParams = $bodyParams . "<" . $key . ">" . $value . "</" . $key . ">";
        }

        $methodEnvlope = "<soap" . ($isEnv ? "env" : "") . ":Body><" . $typOrTns . ":" . $method . "><" . $rq1MethodName . ">";
        $methodEnvlope = $methodEnvlope . $bodyParams;
        $methodEnvlope = $methodEnvlope . "</" . $rq1MethodName . "></" . $typOrTns . ":" . $method . "></soap" . ($isEnv ? "env" : "") . ":Body></soap" . ($isEnv ? "env" : "") . ":Envelope>";

        $body = '<?xml version="1.0" encoding="UTF-8"?> <soap' . ($isEnv ? "env" : "") . ':Envelope xmlns:soap' . ($isEnv ? "env" : "") . '="http://schemas.xmlsoap.org/soap/envelope/" xmlns:' . $typOrTns . '="http://xtravelsystem.com/v1_0rc1/hotel/types" xmlns:xs="http://www.w3.org/2001/XMLSchema">';
        $body = $body .  ($hasHeader ? "<soapenv:Header/>" : "");
        $body = $body . $methodEnvlope;
        self::$body = $body;
        return self::$instance;
    }

    public function call()
    {
        $this::getInstance();

        $url = $this::$url . $this::$service . '?WSDL';

        $this::$response = Http::withBody($this::$body, $this::$contentType)->post($url);

        return $this;
    }

    public function rawResponse()
    {
        self::getInstance();

        return self::$response->body();
    }

    public function response()
    {
        self::getInstance();

        dump(self::$response);
        dump(self::$response->body());
        $array = XmlToArray::convert(self::$response->body());
        $resultArray = collect($array)->flatten(2)[0];

        if (is_array($resultArray[array_key_first($resultArray)])) {
            $result = Arr::isAssoc($resultArray[array_key_first($resultArray)]) ? json_decode(json_encode($resultArray[array_key_first($resultArray)]), FALSE) : collect($resultArray[array_key_first($resultArray)]);
        } else {
            $result = Arr::isAssoc($resultArray) ? json_decode(json_encode($resultArray), FALSE) : collect($resultArray);
        }

        return $result;
    }
}
