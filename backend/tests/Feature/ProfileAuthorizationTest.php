<?php

namespace Tests\Feature;

use App\Models\Profile;
use App\Models\Role;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ProfileAuthorizationTest extends TestCase
{
    use RefreshDatabase;

    private const ADA = '11111111-1111-4111-8111-111111111111';

    private const BEA = '22222222-2222-4222-8222-222222222222';

    public function test_a_partner_receives_only_their_own_profile(): void
    {
        $response = $this->withToken($this->token(self::ADA, 'Ada'))
            ->getJson('/api/me?user_id='.self::BEA);

        $response->assertOk()
            ->assertExactJson([
                'id' => self::ADA,
                'display_name' => 'Ada',
                'role' => 'partner',
            ]);
    }

    public function test_a_partner_cannot_read_another_profile_by_id(): void
    {
        Profile::query()->create([
            'id' => self::BEA,
            'display_name' => 'Bea',
        ]);

        $response = $this->withToken($this->token(self::ADA, 'Ada'))
            ->getJson('/api/profiles/'.self::BEA);

        $response->assertForbidden();
        $this->assertStringNotContainsString('Bea', $response->getContent());
    }

    public function test_a_therapist_role_cannot_read_a_profile(): void
    {
        $profile = Profile::query()->create([
            'id' => self::BEA,
            'display_name' => 'Bea',
        ]);
        $profile->roles()->attach(Role::query()->where('name', 'therapist')->firstOrFail());

        Profile::query()->create([
            'id' => self::ADA,
            'display_name' => 'Ada',
        ])->roles()->attach(Role::query()->where('name', 'partner')->firstOrFail());

        $own = $this->withToken($this->token(self::BEA, 'Bea'))->getJson('/api/me');
        $other = $this->withToken($this->token(self::BEA, 'Bea'))
            ->getJson('/api/profiles/'.self::ADA);

        $own->assertForbidden();
        $other->assertForbidden();
        $this->assertStringNotContainsString('Ada', $other->getContent());
    }

    public function test_missing_and_forged_tokens_are_rejected(): void
    {
        $this->getJson('/api/me')->assertUnauthorized();

        $this->withToken($this->token(self::ADA, 'Ada', 'wrong-secret'))
            ->getJson('/api/me')
            ->assertUnauthorized();
    }

    private function token(string $subject, string $displayName, ?string $secret = null): string
    {
        $secret ??= 'test-jwt-secret-with-enough-length';
        $header = $this->base64Url(json_encode(['alg' => 'HS256', 'typ' => 'JWT'], JSON_THROW_ON_ERROR));
        $payload = $this->base64Url(json_encode([
            'sub' => $subject,
            'exp' => time() + 3600,
            'user_metadata' => ['display_name' => $displayName],
        ], JSON_THROW_ON_ERROR));
        $signature = $this->base64Url(hash_hmac('sha256', $header.'.'.$payload, $secret, true));

        return $header.'.'.$payload.'.'.$signature;
    }

    private function base64Url(string $value): string
    {
        return rtrim(strtr(base64_encode($value), '+/', '-_'), '=');
    }
}
