<?php

namespace App\Http\Middleware;

use App\Support\InvalidSupabaseToken;
use App\Support\SupabaseJwt;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class AuthenticateSupabaseJwt
{
    public function __construct(private readonly SupabaseJwt $jwt) {}

    public function handle(Request $request, Closure $next): Response
    {
        $header = $request->header('Authorization', '');
        if (! is_string($header) || ! str_starts_with($header, 'Bearer ')) {
            return response()->json(['message' => 'Authentication is required.'], 401);
        }

        try {
            $claims = $this->jwt->claims(trim(substr($header, 7)));
        } catch (InvalidSupabaseToken) {
            return response()->json(['message' => 'Authentication is required.'], 401);
        }

        $request->attributes->set('auth_user_id', $claims['sub']);
        $request->attributes->set('auth_display_name', $this->displayName($claims));

        return $next($request);
    }

    /**
     * @param  array<string, mixed>  $claims
     */
    private function displayName(array $claims): ?string
    {
        $metadata = $claims['user_metadata'] ?? null;
        if (! is_array($metadata)) {
            return null;
        }

        $name = $metadata['display_name'] ?? null;

        return is_string($name) ? $name : null;
    }
}
