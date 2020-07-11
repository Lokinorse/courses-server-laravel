<?php

use Illuminate\Database\Seeder;
use App\ProgramCourse;

class ProgramCourseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        ProgramCourse::create([
            'course_id'           => 11,
            'order'           => 0,
        ]);
    }
}
