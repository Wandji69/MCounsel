<?php

namespace App\Http\Controllers;

use App\Services\ProfileAccess;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ProfileController extends Controller
{
    public function __construct(private readonly ProfileAccess $profiles) {}

    public function me(Request $request): JsonResponse
    {
        return response()->json($this->profiles->present($this->profiles->own($request)));
    }

    public function show(Request $request, string $profile): JsonResponse
    {
        $this->profiles->assertOwn($request, $profile);

        return response()->json($this->profiles->present($this->profiles->own($request)));
    }
}
