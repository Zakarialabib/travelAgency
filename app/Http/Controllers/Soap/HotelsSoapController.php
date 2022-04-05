<?php

namespace App\Http\Controllers\Soap;

use App\Services\Soap\SoapService;

class HotelsSoapController
{
    public static function getEstablishmentCategories()
    {
        return SoapService::setService('hotelBookingHandler')->setBody('getEstablishmentCategories', 'GetEstablishmentCategoriesRQ_1', false, [], 'tns')->call()->response();
    }

    public static function getEstablishmentCategoryGroup()
    {
        return SoapService::setService('hotelBookingHandler')->setBody('getEstablishmentCategoryGroup', 'GetEstablishmentCategoryGroupRQ_1', false, [], 'tns')->call()->response();
    }

    public static function getEstablishmentTypes()
    {
        return SoapService::setService('hotelBookingHandler')->setBody('getEstablishmentTypes', 'GetEstablishmentTypesRQ_1', false, [], 'tns')->call()->response();
    }

    public static function getEstablishment($establishmentId, $onlySelectedLanguage = false)
    {
        return SoapService::setService('hotelBookingHandler')->setBody('getEstablishmentDataExtends', 'EstablishmentDataRQ_1', true, ['establishmentId' => $establishmentId], 'typ', true)->call()->response();
    }

    public static function getEstablishmentByName($name, $fromRow = 0, $numRows = 1)
    {
        return SoapService::setService('hotelBookingHandler')->setBody('getEstablishmentsByNameV22', 'GetEstablishmentsByNameRQV22_1', false, ['fromRow' => $fromRow], 'tns', false, ['numRows' => $numRows, "searchName" => $name])->call()->response();
    }
}
