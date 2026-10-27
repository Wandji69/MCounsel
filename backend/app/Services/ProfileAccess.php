<?php

namespace App\Services;

use App\Models\Profile;
use App\Models\Role;
use Illuminate\Http\Request;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;

class ProfileAccess
{
    public function own(Request $request): Profile
    {
        $userId = $this->userId($request);
        $profile = Profile::query()->find($userId);

        if ($profile === null) {
            $profile = Profile::query()->create([
                'id' => $userId,
                'display_name' => $this->cleanName($request->attributes->get('auth_display_name')),
            ]);
            $partner = Role::query()->where('name', 'partner')->firstOrFail();
            $profile->roles()->attach($partner->id);
        }

        if (! $profile->canReadOwnProfile()) {
            throw new AccessDeniedHttpException('This account cannot open a profile.');
        }

        return $profile->load('roles');
    }

    public function assertOwn(Request $request, string $profileId): void
    {
        if ($profileId !== $this->userId($request)) {
            throw new AccessDeniedHttpException('You cannot view this profile.');
        }
    }

    /**
     * @return array{id: string, display_name: string, role: string}
     */
    public function present(Profile $profile): array
    {
        return [
            'id' => $profile->id,
            'display_name' => $profile->display_name,
            'role' => 'partner',
        ];
    }

    private function userId(Request $request): string
    {
        $userId = $request->attributes->get('auth_user_id');
        if (! is_string($userId) || $userId === '') {
            throw new AccessDeniedHttpException('Authentication is required.');
        }

        return $userId;
    }

    private function cleanName(mixed $value): string
    {
        if (! is_string($value)) {
            return 'Partner';
        }

        $name = trim(strip_tags($value));
        if ($name === '') {
            return 'Partner';
        }

        return mb_substr($name, 0, 80);
    }
}
