<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {

        // $this->call(RolesTableSeeder::class);
        // $this->call(UsersTableSeeder::class);
        // $this->call(ProfilesTableSeeder::class);
        // $this->call(AirlinesTableSeeder::class);
        // $this->call(AirportsTableSeeder::class);
        // $this->call(VatsTableSeeder::class);
        // $this->call(BanksTableSeeder::class);
        // $this->call(BankDetailsTableSeeder::class);
        // $this->call(MarkdownsTableSeeder::class);
        // $this->call(MarkupsTableSeeder::class);
        // $this->call(VoucherTableSeeder::class);
        // $this->call(MarkupTypesTableSeeder::class);
        // $this->call(MarkupValueTypesTableSeeder::class);
        // $this->call(FlightBookingsTableSeeder::class);
        // $this->call(WalletLogTableSeeder::class);
        // $this->call(PackageCategoryTableSeeder::class);
        // $this->call(PackageTypeTableSeeder::class);
        // $this->call(CabinTypesSeeder::class);
        $this->call(PermissionTableSeeder::class);
        $this->call(RolesAndPermissionsSeeder::class);
    }
}
