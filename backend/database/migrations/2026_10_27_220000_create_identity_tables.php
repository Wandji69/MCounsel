<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('roles', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->timestamps();
        });

        Schema::create('permissions', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->timestamps();
        });

        Schema::create('permission_role', function (Blueprint $table) {
            $table->foreignId('permission_id')->constrained()->cascadeOnDelete();
            $table->foreignId('role_id')->constrained()->cascadeOnDelete();
            $table->primary(['permission_id', 'role_id']);
        });

        Schema::create('profiles', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('display_name', 80);
            $table->timestamps();
        });

        Schema::create('profile_role', function (Blueprint $table) {
            $table->uuid('profile_id');
            $table->foreign('profile_id')->references('id')->on('profiles')->cascadeOnDelete();
            $table->foreignId('role_id')->constrained()->cascadeOnDelete();
            $table->primary(['profile_id', 'role_id']);
        });

        $now = now();
        $partnerId = DB::table('roles')->insertGetId([
            'name' => 'partner',
            'created_at' => $now,
            'updated_at' => $now,
        ]);
        DB::table('roles')->insert([
            'name' => 'therapist',
            'created_at' => $now,
            'updated_at' => $now,
        ]);
        $permissionId = DB::table('permissions')->insertGetId([
            'name' => 'profiles.read_own',
            'created_at' => $now,
            'updated_at' => $now,
        ]);
        DB::table('permission_role')->insert([
            'permission_id' => $permissionId,
            'role_id' => $partnerId,
        ]);
    }

    public function down(): void
    {
        Schema::dropIfExists('profile_role');
        Schema::dropIfExists('profiles');
        Schema::dropIfExists('permission_role');
        Schema::dropIfExists('permissions');
        Schema::dropIfExists('roles');
    }
};
