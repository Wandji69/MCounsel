<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Profile extends Model
{
    public $incrementing = false;

    protected $keyType = 'string';

    protected $fillable = [
        'id',
        'display_name',
    ];

    public function roles(): BelongsToMany
    {
        return $this->belongsToMany(Role::class, 'profile_role');
    }

    public function canReadOwnProfile(): bool
    {
        return $this->roles()
            ->whereHas('permissions', function ($query): void {
                $query->where('name', 'profiles.read_own');
            })
            ->exists();
    }
}
