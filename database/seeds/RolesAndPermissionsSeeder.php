<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RolesAndPermissionsSeeder  extends Seeder

{
    public function run()
    {
        // Reset cached roles and permissions
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        // create permissions
        Permission::create(['name' => 'create admin']);
        Permission::create(['name' => 'edit admin']);
        Permission::create(['name' => 'delete admin']);
        Permission::create(['name' => 'create agent']);
        Permission::create(['name' => 'edit agent']);
        Permission::create(['name' => 'delete agent']);
        Permission::create(['name' => 'create customer']);
        Permission::create(['name' => 'edit customer']);
        Permission::create(['name' => 'delete customer']);


        // create roles and assign created permissions
        $role = Role::create(['name' => 'admin']);
        $role->givePermissionTo(Permission::all());

        // create roles and assign created permissions
        $role = Role::create(['name' => 'agent']);
        $role->givePermissionTo(Permission::all());

        // create roles and assign created permissions
        $role = Role::create(['name' => 'customer']);
    }

}