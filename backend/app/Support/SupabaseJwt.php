<?php

namespace App\Support;

class SupabaseJwt
{
    /**
     * @return array<string, mixed>
     */
    public function claims(string $token): array
    {
        $secret = config('services.supabase.jwt_secret');
        if (! is_string($secret) || $secret === '') {
            throw new InvalidSupabaseToken('The JWT secret is not configured.');
        }

        $parts = explode('.', $token);
        if (count($parts) !== 3) {
            throw new InvalidSupabaseToken('The token is malformed.');
        }

        [$headerPart, $payloadPart, $signaturePart] = $parts;
        $header = json_decode($this->base64UrlDecode($headerPart), true);
        if (! is_array($header) || ($header['alg'] ?? null) !== 'HS256') {
            throw new InvalidSupabaseToken('The token algorithm is not accepted.');
        }

        $expected = $this->base64UrlEncode(
            hash_hmac('sha256', $headerPart.'.'.$payloadPart, $secret, true)
        );
        $provided = rtrim(strtr($signaturePart, '+/', '-_'), '=');
        if (! hash_equals($expected, $provided)) {
            throw new InvalidSupabaseToken('The token signature is not valid.');
        }

        $payload = json_decode($this->base64UrlDecode($payloadPart), true);
        if (! is_array($payload)) {
            throw new InvalidSupabaseToken('The token payload is not valid.');
        }

        $expires = $payload['exp'] ?? null;
        if (! is_numeric($expires) || (int) $expires < time()) {
            throw new InvalidSupabaseToken('The token has expired.');
        }

        $subject = $payload['sub'] ?? null;
        if (! is_string($subject) || ! $this->isUuid($subject)) {
            throw new InvalidSupabaseToken('The token has no account id.');
        }

        return $payload;
    }

    private function isUuid(string $value): bool
    {
        return preg_match(
            '/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i',
            $value
        ) === 1;
    }

    private function base64UrlDecode(string $value): string
    {
        $remainder = strlen($value) % 4;
        if ($remainder > 0) {
            $value .= str_repeat('=', 4 - $remainder);
        }

        $decoded = base64_decode(strtr($value, '-_', '+/'), true);
        if ($decoded === false) {
            throw new InvalidSupabaseToken('The token encoding is not valid.');
        }

        return $decoded;
    }

    private function base64UrlEncode(string $value): string
    {
        return rtrim(strtr(base64_encode($value), '+/', '-_'), '=');
    }
}
