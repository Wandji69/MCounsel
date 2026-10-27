# 0002 — Laravel API and Supabase Postgres

**Status:** Decided  
**Date:** 2026-10-27

## Decision

Use both Laravel and Supabase.

- Supabase hosts PostgreSQL and Auth.
- One Laravel application in `backend/` is the only API the Flutter app calls.
- Laravel checks roles and permissions, then reads and writes Postgres.
- PostgreSQL Row Level Security is a second check on those tables.
- The AI provider is called only from Laravel, in a later phase.
- The Flutter app does not query Supabase tables for couple, session, or journal data.
- The Supabase service-role secret stays on the Laravel server.

## Why this split

Supabase removes database hosting, backups, and login infrastructure from the first deployment. Laravel is where partner permissions, a later therapist role, invitation transactions, and the reveal rule can live in tested PHP. The phone cannot bypass those rules by talking to the database itself.

## Roles

`partner` is the only role assigned in the first backend build. Permission tables exist so a later role, including `therapist`, is another permission set. A therapist sees only records a couple has explicitly shared with that role. That role is not part of the current build, and it does not turn the product into a clinical service.

## What stays the same

The sharing, disconnect, and safety rules in `docs/policies/` are unchanged. Drafts stay with their author. Reveal happens only after both partners submit and Laravel confirms the session rule.

## Deployment shape

Supabase has a development project and a production project. Laravel has a development environment and a production environment, each with its own database credentials. `.env.example` lists the variable names and contains no secrets.
