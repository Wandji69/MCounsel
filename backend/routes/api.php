<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

Route::middleware('supabase.jwt')->group(function (): void {
    Route::get('/me', [ProfileController::class, 'me']);
    Route::get('/profiles/{profile}', [ProfileController::class, 'show'])->whereUuid('profile');
});
