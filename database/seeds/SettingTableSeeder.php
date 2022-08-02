<?php

use Illuminate\Database\Seeder;

class SettingTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data=array(
            'description'=>"About Us.",
            'short_des'=>"Footer.",
            'photo'=>"image.jpg",
            'logo'=>'logo.jpg',
            'address'=>"Address",
            'email'=>"doantotnghiepcuathu@gmail.com",
            'phone'=>"0394841200",
        );
        DB::table('settings')->insert($data);
    }
}
