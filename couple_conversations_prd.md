# Couple Conversations --- Product Requirements Document (PRD)

**Document status:** Draft v1.0\
**Product type:** Cross-platform mobile application\
**Primary platform:** iOS and Android\
**Recommended mobile framework:** Flutter\
**Intended audience:** Product owner, AI coding assistants, developers,
designers, and testers

------------------------------------------------------------------------

## 1. Product summary

Couple Conversations is a mobile application that helps couples have
meaningful, difficult, and often postponed conversations about their
relationship. It is designed for couples preparing for marriage as well
as people who are already married or in long-term partnerships.

Each partner answers guided questions independently. Once both have
submitted their responses, the application reveals the answers according
to the session's sharing rules and helps the couple reflect on
similarities, differences, assumptions, and topics that need further
discussion.

The application also maintains a relationship journal: a searchable
history of questions, individual answers, shared reflections,
agreements, commitments, and later follow-ups. Couples can revisit these
records to understand how their views have changed and what they
previously agreed to do.

AI provides structured reflection and conversation support. It must not
diagnose people, decide who is right, promise that a relationship will
succeed, or present itself as a replacement for professional counseling
or crisis support.

### Product vision

Make thoughtful relationship conversations more accessible, practical,
and continuous---without requiring every couple to begin with expensive,
formal counseling.

### Product positioning

A guided conversation and relationship-reflection tool, not a therapist,
marriage counselor, compatibility test, or guarantee of relationship
success.

------------------------------------------------------------------------

## 2. The problem

Couples may avoid difficult conversations about money, children, sex and
intimacy, family boundaries, faith, domestic responsibilities, conflict,
expectations, and long-term plans. They may not know which questions to
ask, may fear disagreement, or may lack access to affordable counseling.

Even when conversations happen, the outcomes are often forgotten.
Partners may later remember the same discussion differently or be unable
to recall what they agreed to do.

The product should help couples: - Start conversations they might
otherwise postpone. - Answer independently before being influenced by
their partner. - Understand each other's perspectives without forcing
agreement. - Record decisions and commitments in their own words. -
Revisit previous conversations and reflect on progress. - Recognize when
a topic is too serious or unsafe to manage with an app alone.

Do not claim that most marriages fail for a particular reason unless
supported by reliable evidence. Product marketing should describe the
problem without unsupported statistics or guarantees.

------------------------------------------------------------------------

## 3. Target users

### Primary users

<<<<<<< HEAD
1. **Engaged couples:** Want to explore expectations and potential
    areas of disagreement before marriage.
2. **Married couples:** Want to communicate better, review
    expectations, and work through everyday decisions.
3. **Long-term partners:** Want a structured way to discuss life plans
=======
1.  **Engaged couples:** Want to explore expectations and potential
    areas of disagreement before marriage.
2.  **Married couples:** Want to communicate better, review
    expectations, and work through everyday decisions.
3.  **Long-term partners:** Want a structured way to discuss life plans
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
    and relationship responsibilities.

### Important user needs

- A safe, understandable onboarding experience.
- Clear control over when their answers are shared.
- Questions that feel relevant rather than generic or judgmental.
- A way to pause and resume sensitive conversations.
- Useful reflection without an AI taking sides.
- Confidence that private responses are not exposed unexpectedly.
- A lasting record that is easy to search and revisit.

### Not the target

The initial product is not intended to provide emergency intervention,
clinical diagnosis, legal advice, domestic-abuse assessment, or
professional couples therapy.

------------------------------------------------------------------------

## 4. Product principles

1. **Equal agency:** Both partners have equal control over their own
    answers.
2. **Consent before sharing:** Explain what will be shared, with whom,
    and when.
3. **No forced disclosure:** Do not require users to answer every
    question or reveal an answer they have not agreed to share.
4. **No partner scoring:** Avoid "good partner/bad partner" labels,
    compatibility scores presented as definitive, or rankings.
5. **Reflect, don't judge:** AI should help users understand
    perspectives, not assign blame.
6. **Privacy by design:** Collect as little data as possible and
    enforce access rules on the server.
7. **Safety first:** Do not encourage a user to confront a partner when
    doing so may put them at risk.
8. **Accessible and inclusive:** Use plain language, readable layouts,
    and culturally adaptable examples.
9. **Longitudinal value:** Treat the journal and follow-up reflections
    as core product features, not an afterthought.
10. **Honest limitations:** State that AI can misunderstand context and
    that its suggestions are not professional care.

------------------------------------------------------------------------

## 5. MVP scope

The MVP should prove the core cycle: create a couple space, invite a
partner, answer a question privately, reveal both answers with consent,
reflect, and save a journal entry.

### Must have (P0)

<<<<<<< HEAD
- Account registration, login, logout, and account recovery.
- Create a couple space.
- Invite a partner using a secure, expiring invitation link or code.
- Accept or decline an invitation.
- Couple membership and clear connection status.
- Question library organized by categories and stages.
- One active question session at a time per couple, initially.
- Each partner can draft and submit their own response.
- Clear submitted/waiting status without revealing the content of an
    unshared answer.
- Both answers become visible only after both partners submit and the
    defined reveal rules are satisfied.
- Ability to skip a question or mark it "not ready to discuss."
- AI-generated reflection prompts after answers are shared.
- Shared reflection or notes, with a clear distinction between private
    notes and shared notes.
- Relationship journal with dated entries.
- Search/filter by category, date, and tags.
- Basic follow-up reminder/commitment with due date and status.
- Data access policies preventing one couple from accessing another
    couple's records.
- In-app privacy explanation, delete-account workflow, and data export
    plan.
- Error, loading, empty, and offline/retry states.
- Automated tests for the central privacy and answer-reveal rules.

### Should have (P1, after core flow works)

- Question plans by relationship stage: dating seriously, engaged,
    newly married, established marriage.
- Follow-up review after a chosen interval.
- User-created questions.
- Optional relationship milestones and memories.
- Gentle reminders with notification privacy controls.
- Question bookmarks and "discuss later" queue.
- Accessibility improvements and localization support.
- A carefully scoped offline draft experience, if secure
=======
-   Account registration, login, logout, and account recovery.
-   Create a couple space.
-   Invite a partner using a secure, expiring invitation link or code.
-   Accept or decline an invitation.
-   Couple membership and clear connection status.
-   Question library organized by categories and stages.
-   One active question session at a time per couple, initially.
-   Each partner can draft and submit their own response.
-   Clear submitted/waiting status without revealing the content of an
    unshared answer.
-   Both answers become visible only after both partners submit and the
    defined reveal rules are satisfied.
-   Ability to skip a question or mark it "not ready to discuss."
-   AI-generated reflection prompts after answers are shared.
-   Shared reflection or notes, with a clear distinction between private
    notes and shared notes.
-   Relationship journal with dated entries.
-   Search/filter by category, date, and tags.
-   Basic follow-up reminder/commitment with due date and status.
-   Data access policies preventing one couple from accessing another
    couple's records.
-   In-app privacy explanation, delete-account workflow, and data export
    plan.
-   Error, loading, empty, and offline/retry states.
-   Automated tests for the central privacy and answer-reveal rules.

### Should have (P1, after core flow works)

-   Question plans by relationship stage: dating seriously, engaged,
    newly married, established marriage.
-   Follow-up review after a chosen interval.
-   User-created questions.
-   Optional relationship milestones and memories.
-   Gentle reminders with notification privacy controls.
-   Question bookmarks and "discuss later" queue.
-   Accessibility improvements and localization support.
-   A carefully scoped offline draft experience, if secure
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
    synchronization can be implemented reliably.

### Later, not in MVP

<<<<<<< HEAD
- Audio/video counseling sessions.
- Community forums or public profiles.
- Social feeds or sharing relationship answers publicly.
- Partner matching or dating functionality.
- Complex compatibility scoring.
- AI-generated therapy plans or diagnoses.
- Family/counselor dashboards with access to private answers.
- Subscription and payment complexity before core retention is
=======
-   Audio/video counseling sessions.
-   Community forums or public profiles.
-   Social feeds or sharing relationship answers publicly.
-   Partner matching or dating functionality.
-   Complex compatibility scoring.
-   AI-generated therapy plans or diagnoses.
-   Family/counselor dashboards with access to private answers.
-   Subscription and payment complexity before core retention is
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
    validated.

------------------------------------------------------------------------

## 6. Main user journeys

### Journey A: Create a couple space

<<<<<<< HEAD
1. User installs the app and creates an account.
2. User sees a plain-language explanation of the product and its
    limitations.
3. User creates a couple space and chooses a display name for it.
4. App generates a secure invitation.
5. User shares the invitation with their partner.
6. Partner signs in or creates an account and reviews the invitation.
7. Partner explicitly accepts.
8. Both users see that the couple space is active.
9. Both can review the privacy and sharing rules before beginning.
=======
1.  User installs the app and creates an account.
2.  User sees a plain-language explanation of the product and its
    limitations.
3.  User creates a couple space and chooses a display name for it.
4.  App generates a secure invitation.
5.  User shares the invitation with their partner.
6.  Partner signs in or creates an account and reviews the invitation.
7.  Partner explicitly accepts.
8.  Both users see that the couple space is active.
9.  Both can review the privacy and sharing rules before beginning.
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e

An invitation must expire, be revocable, and not reveal sensitive
information in its URL or code.

### Journey B: Answer a question

<<<<<<< HEAD
1. Couple selects a category or begins a suggested question.
2. App displays the question, context, and optional conversation
    guidance.
3. Each partner independently writes a response.
4. Each response is saved as a private draft until submitted.
5. The app shows only the other partner's status (for example,
    "submitted" or "not yet submitted"), not their answer.
6. Once both submit, the app presents a clear reveal step.
7. The app reveals the submitted responses according to the agreed
    session rule.
8. Couple can read, pause, reflect, or skip AI assistance.
9. AI offers neutral prompts and identifies topics worth clarifying,
=======
1.  Couple selects a category or begins a suggested question.
2.  App displays the question, context, and optional conversation
    guidance.
3.  Each partner independently writes a response.
4.  Each response is saved as a private draft until submitted.
5.  The app shows only the other partner's status (for example,
    "submitted" or "not yet submitted"), not their answer.
6.  Once both submit, the app presents a clear reveal step.
7.  The app reveals the submitted responses according to the agreed
    session rule.
8.  Couple can read, pause, reflect, or skip AI assistance.
9.  AI offers neutral prompts and identifies topics worth clarifying,
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
    without declaring a winner.
10. Couple records any shared reflection or agreement.
11. The session is saved in the journal with a date and status.

### Journey C: Revisit an earlier agreement

<<<<<<< HEAD
1. User opens the journal.
2. User searches or filters by topic, date, or tag.
3. User opens an earlier question session.
4. The app displays the original question, both shared answers, and any
    recorded agreement.
5. User or couple adds a dated follow-up reflection.
6. The earlier entry remains unchanged; the follow-up is appended as a
    new record.
7. If the couple updates an agreement, the app preserves the prior
=======
1.  User opens the journal.
2.  User searches or filters by topic, date, or tag.
3.  User opens an earlier question session.
4.  The app displays the original question, both shared answers, and any
    recorded agreement.
5.  User or couple adds a dated follow-up reflection.
6.  The earlier entry remains unchanged; the follow-up is appended as a
    new record.
7.  If the couple updates an agreement, the app preserves the prior
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
    version and records the new one.

### Journey D: Leave or disconnect a couple space

<<<<<<< HEAD
1. User opens relationship/privacy settings.
2. App explains what leaving or disconnecting means for shared and
    individual data.
3. User confirms the action.
4. Access is updated server-side immediately.
5. The app clearly explains what happens to historical shared entries,
    private drafts, and any retained records.
6. No partner is allowed to impersonate the other or access their
=======
1.  User opens relationship/privacy settings.
2.  App explains what leaving or disconnecting means for shared and
    individual data.
3.  User confirms the action.
4.  Access is updated server-side immediately.
5.  The app clearly explains what happens to historical shared entries,
    private drafts, and any retained records.
6.  No partner is allowed to impersonate the other or access their
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
    account.

The retention policy for shared history must be decided before launch.
Do not silently delete one partner's records or silently leave sensitive
shared records accessible after a relationship is disconnected.

------------------------------------------------------------------------

## 7. Functional requirements

### Authentication and identity

<<<<<<< HEAD
- Users must have unique account identities.
- Authentication must use a maintained provider/library and secure
    session handling.
- Users can recover access and request account deletion.
- Couple membership must be separate from user identity.
- A user must not join a couple space without explicit acceptance.
- Initial MVP can limit a user to one active couple space to simplify
=======
-   Users must have unique account identities.
-   Authentication must use a maintained provider/library and secure
    session handling.
-   Users can recover access and request account deletion.
-   Couple membership must be separate from user identity.
-   A user must not join a couple space without explicit acceptance.
-   Initial MVP can limit a user to one active couple space to simplify
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
    permissions and user experience.

### Invitations

<<<<<<< HEAD
- Invitations use unpredictable, expiring tokens or codes.
- The creator can revoke an invitation.
- The backend validates invitation status and expiration.
- Invitation acceptance must be transactional to prevent duplicate or
    conflicting membership.
- Do not put names, answers, or other sensitive information in
=======
-   Invitations use unpredictable, expiring tokens or codes.
-   The creator can revoke an invitation.
-   The backend validates invitation status and expiration.
-   Invitation acceptance must be transactional to prevent duplicate or
    conflicting membership.
-   Do not put names, answers, or other sensitive information in
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
    invitation URLs.

### Questions and sessions

Each question should include: - Stable question ID and version. - Title
and question text. - Category and optional subcategory. - Intended
relationship stage. - Sensitivity level. - Optional context or
discussion guidance. - Optional follow-up prompts. - Content review
status. - Language and version metadata.

A session should record which version of a question was asked. If
question text changes later, historical sessions should continue to show
the original text that the couple answered.

### Responses and reveal rules

<<<<<<< HEAD
- A response belongs to one user and one question session.
- Draft responses are visible only to their author and authorized
    server-side processes.
- The other partner must not be able to retrieve a private response
    through the API, database query, search, notifications, logs, or AI
    endpoint.
- Submission status can be visible without exposing response content.
- Revealing answers must be enforced server-side, not merely hidden in
    the mobile UI.
- Define whether a submitted answer can be edited before reveal.
    Recommended initial rule: allow editing while still in draft;
    submitted answers are locked for that session unless the session is
    reset through a transparent, audited action.
- After reveal, edits should create a clearly dated amendment rather
    than silently overwrite the original.
- Users may skip or pause without penalty.
=======
-   A response belongs to one user and one question session.
-   Draft responses are visible only to their author and authorized
    server-side processes.
-   The other partner must not be able to retrieve a private response
    through the API, database query, search, notifications, logs, or AI
    endpoint.
-   Submission status can be visible without exposing response content.
-   Revealing answers must be enforced server-side, not merely hidden in
    the mobile UI.
-   Define whether a submitted answer can be edited before reveal.
    Recommended initial rule: allow editing while still in draft;
    submitted answers are locked for that session unless the session is
    reset through a transparent, audited action.
-   After reveal, edits should create a clearly dated amendment rather
    than silently overwrite the original.
-   Users may skip or pause without penalty.
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e

### AI reflection

AI can: - Summarize shared themes in neutral language. - Suggest
open-ended questions that clarify assumptions. - Help partners
distinguish a preference, concern, boundary, and negotiable decision. -
Suggest practical next steps that both partners can accept, reject, or
edit. - Offer a "what might we be missing?" perspective. - Help convert
a mutual decision into a reviewable action item.

AI must not: - Diagnose a partner or assign a mental-health label. -
Claim to know someone's true intentions. - Declare one partner morally
or psychologically superior. - Guarantee that a couple is compatible or
that a marriage will succeed. - Encourage coercion, surveillance,
manipulation, or forced disclosure. - present itself as a licensed
counselor. - Automatically send private drafts to the other partner. -
Treat a single answer as sufficient evidence to characterize a person.

AI output must be clearly labeled as AI-generated and fallible. Provide
a way to report problematic output. Keep the system prompt and provider
credentials on the server. Apply rate limits, input-size limits, cost
monitoring, and error handling.

### Journal and agreements

A journal entry may contain: - Question and question-version
reference. - Session date and status. - Shared responses after reveal. -
Shared reflection. - Optional private note, accessible only to its
author. - Agreements and action items. - Follow-up dates and outcomes. -
Tags and category. - A record of edits or amendments.

Private notes and shared content must be visually distinct and
independently protected by backend policies. The app must not imply that
private notes are shared.

------------------------------------------------------------------------

## 8. Suggested screens

<<<<<<< HEAD
1. Welcome and product limitations.
2. Sign up / sign in / account recovery.
3. Create couple space.
4. Invite partner / accept invitation.
5. Couple home dashboard.
6. Question categories and suggested next question.
7. Question detail and context.
8. Private answer editor.
9. Waiting-for-partner state.
=======
1.  Welcome and product limitations.
2.  Sign up / sign in / account recovery.
3.  Create couple space.
4.  Invite partner / accept invitation.
5.  Couple home dashboard.
6.  Question categories and suggested next question.
7.  Question detail and context.
8.  Private answer editor.
9.  Waiting-for-partner state.
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
10. Answer reveal.
11. AI reflection and follow-up prompts.
12. Shared reflection and agreement editor.
13. Relationship journal timeline.
14. Journal entry detail.
15. Search and filters.
16. Follow-up reminders and commitments.
17. Couple settings and membership management.
18. Privacy, export, and deletion settings.
19. AI feedback/report screen.
20. Help and safety resources.

Avoid building all screens before the central journey works end to end.
Start with a small vertical slice covering screens 3--12 and a simple
journal view.

------------------------------------------------------------------------

## 9. Question content framework

Questions should be organized as a content library, not generated ad hoc
without review.

Suggested initial categories: - Values and life goals. - Money, debt,
saving, spending, and financial transparency. - Children, parenting,
fertility expectations, and child-free choices. - Work, career,
ambition, and relocation. - Household responsibilities and mental
load. - Extended family, in-laws, and boundaries. - Faith, beliefs,
culture, and traditions. - Communication and conflict. - Trust, privacy,
friendships, and social media. - Affection, intimacy, and sexual
expectations. - Health, caregiving, and major life changes. - Gender
expectations and decision-making. - Personal boundaries and consent. -
Conflict repair, forgiveness, and accountability. - Separation,
reconciliation, and contingency planning.

Each question should be: - Open-ended and understandable. - Specific
enough to prompt a useful answer. - Non-leading and non-shaming. -
Sensitive to cultural differences without assuming all couples share the
same beliefs. - Clear about whether it asks for a preference, boundary,
expectation, or joint decision. - Reviewed for potentially harmful
assumptions.

For high-sensitivity subjects, offer a skip option and a reminder that
users do not owe the app or their partner an immediate answer. Content
about abuse, coercive control, or personal safety must be designed with
expert review and must not prompt unsafe confrontation.

------------------------------------------------------------------------

## 10. AI behavior and prompt requirements

The AI should behave as a neutral reflection facilitator.

### Desired response structure

When appropriate, the AI can return: 1. **What each person appears to be
expressing:** A cautious, nonjudgmental summary. 2. **Where views
align:** Shared values or goals, if evident. 3. **Where clarification
may help:** Differences or ambiguity, without labeling them as failures.
4. **Questions to discuss next:** Two to five open-ended prompts. 5.
**Possible next step:** A small, optional action the couple can agree to
review later. 6. **Uncertainty note:** Acknowledge that the model may
have misunderstood context.

Avoid forcing every response into this template when a shorter response
is more appropriate.

### AI context boundaries

<<<<<<< HEAD
- Send only the minimum information needed for the current task.
- Do not send private drafts to a joint AI analysis unless both users
    have knowingly consented to that specific use.
- Tell users when their text will be processed by an external AI
    provider.
- Do not use couple content for model training unless there is a
    separate, explicit, informed opt-in and a lawful, privacy-reviewed
    basis.
- Avoid placing raw answers in application logs, analytics, crash
    reports, or push notifications.
- Use structured outputs with schema validation where practical.
- Handle provider timeouts, refusal responses, malformed output, and
    rate limits gracefully.
- Treat user-written content as untrusted data, not as instructions to
=======
-   Send only the minimum information needed for the current task.
-   Do not send private drafts to a joint AI analysis unless both users
    have knowingly consented to that specific use.
-   Tell users when their text will be processed by an external AI
    provider.
-   Do not use couple content for model training unless there is a
    separate, explicit, informed opt-in and a lawful, privacy-reviewed
    basis.
-   Avoid placing raw answers in application logs, analytics, crash
    reports, or push notifications.
-   Use structured outputs with schema validation where practical.
-   Handle provider timeouts, refusal responses, malformed output, and
    rate limits gracefully.
-   Treat user-written content as untrusted data, not as instructions to
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
    override system safety rules.

### High-risk situations

If content indicates immediate danger, threats, abuse, coercion, or fear
of retaliation: - Do not encourage a joint confrontation or automatic
disclosure. - Respond empathetically and prioritize the user's immediate
safety. - Encourage contacting trusted local support or emergency
services when appropriate. - Provide locally appropriate resources only
when verified. - Avoid promising confidentiality beyond the actual
product's policies and technical design. - Do not represent the app as a
crisis service.

Because couples tools can create additional risk in abusive
relationships, seek specialist safety and privacy review before public
launch.

------------------------------------------------------------------------

## 11. Technical architecture

<<<<<<< HEAD
### Decided stack

Decided 2026-10-27. The record is
[0002-laravel-and-supabase.md](docs/decisions/0002-laravel-and-supabase.md).

- **Mobile app:** Flutter with Dart.
- **API:** One Laravel application in `backend/`. The Flutter app
    calls this API for every couple, session, journal, and AI action.
- **Database:** PostgreSQL managed by Supabase.
- **Authentication:** Supabase Auth. Laravel validates the Supabase
    access token on each request and maps it to the local user.
- **Authorization:** Laravel roles and policies decide what a response
    may contain. PostgreSQL Row Level Security is a second check on the
    same tables.
- **AI provider:** A pluggable interface called only from Laravel.
- **Push notifications:** Add after core flows and notification
    privacy rules are tested.
- **Source control:** Git and GitHub.
- **CI:** Automated formatting, static analysis, unit tests, and build
    checks for Flutter and Laravel.
- **Testing:** Flutter unit, widget, and integration tests, plus
    Laravel authorization tests and database policy tests.

Keep business logic and the AI provider behind Laravel interfaces.
Supabase may be replaced later as the Postgres host without rewriting
the mobile app.

The Flutter app does not query Supabase tables directly and does not
ship a service-role secret. Supabase Edge Functions are not the
application API.
=======
### Recommended initial stack

-   **Mobile app:** Flutter with Dart.
-   **Backend platform:** Supabase.
-   **Database:** PostgreSQL managed by Supabase.
-   **Authentication:** Supabase Auth, configured with secure session
    handling.
-   **Authorization:** PostgreSQL Row Level Security (RLS) policies,
    plus server-side validation for sensitive operations.
-   **Server-side operations:** Supabase Edge Functions or a separate
    small backend service if requirements outgrow the initial platform.
-   **AI provider:** Pluggable provider interface called only from
    trusted server-side code.
-   **Push notifications:** Add after core flows and notification
    privacy rules are tested.
-   **Source control:** Git and GitHub.
-   **CI:** Automated formatting, static analysis, unit tests, and build
    checks.
-   **Testing:** Flutter unit, widget, and integration tests, plus
    backend authorization tests.

This is a recommended starting point, not a commitment to a specific
vendor forever. Keep business logic and AI provider integration behind
interfaces to reduce lock-in.
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e

### Architecture overview

``` text
Flutter mobile app
    |
<<<<<<< HEAD
    | HTTPS, Supabase access token
    v
Laravel API (backend/)
    |
    +-- Roles and permissions
    +-- Couple membership and invitations
    +-- Question sessions and reveal rules
    +-- Journal, agreements, and private notes
    +-- Minimized AI context, provider call, and limits
    |
    | server credentials, least privilege
    v
Supabase Auth + PostgreSQL + RLS
```

The mobile client must never be trusted to enforce privacy rules by
itself. UI hiding is not authorization. Laravel is the authority for a
response. Row Level Security still rejects a query that Laravel should
have refused.

### Roles

Start with one role, `partner`. A partner belongs to one active couple
space and can read their own drafts and records that the reveal rule
has already shared.

Later roles, including `therapist`, are additional permission sets on
the same API. A therapist sees only records a couple has explicitly
shared with that role. A therapist role does not reveal drafts, does
not join the couple space as a partner, and does not make the product a
clinical service. Build the permission tables in the backend foundation
so a later role is a new row, not a new app.

### Database entities (initial conceptual model)

- `profiles`: user-facing profile fields that are safe to share.
- `roles` and `permissions`: named access levels. `partner` is the
    first role. Later roles, such as `therapist`, start with no access
    to couple records.
- `couples`: couple space and lifecycle status.
- `couple_members`: user-to-couple membership and status.
- `invitations`: hashed token/code, creator, expiration, status, and
    acceptance metadata.
- `question_categories`: category metadata.
- `questions`: stable question metadata.
- `question_versions`: immutable question text and content metadata.
- `question_sessions`: couple, question version, state, timestamps,
    and reveal status.
- `responses`: author, session, private response content, submission
    status, and timestamps.
- `shared_reflections`: shared notes created after reveal.
- `private_notes`: user-only notes with strict access policies.
- `agreements`: shared decisions or commitments.
- `agreement_updates`: dated status changes and follow-up outcomes.
- `journal_tags` and `journal_entry_tags`: optional organization.
- `ai_requests` or `ai_usage_events`: minimal operational metadata;
    avoid storing raw sensitive prompts unnecessarily.
- `safety_reports`: limited, access-controlled reports, with a
=======
    | authenticated requests
    v
Supabase Auth + PostgreSQL + RLS
    |
    +-- Couple membership and invitations
    +-- Question library and sessions
    +-- Private responses and shared reflections
    +-- Journal entries and commitments
    |
    v
Trusted server-side functions
    |
    +-- Validate membership and reveal rules
    +-- Prepare minimized AI context
    +-- Call AI provider securely
    +-- Validate response and enforce limits
    +-- Record safe audit events
```

The mobile client must never be trusted to enforce privacy rules by
itself. UI hiding is not authorization.

### Database entities (initial conceptual model)

-   `profiles`: user-facing profile fields that are safe to share.
-   `couples`: couple space and lifecycle status.
-   `couple_members`: user-to-couple membership and status.
-   `invitations`: hashed token/code, creator, expiration, status, and
    acceptance metadata.
-   `question_categories`: category metadata.
-   `questions`: stable question metadata.
-   `question_versions`: immutable question text and content metadata.
-   `question_sessions`: couple, question version, state, timestamps,
    and reveal status.
-   `responses`: author, session, private response content, submission
    status, and timestamps.
-   `shared_reflections`: shared notes created after reveal.
-   `private_notes`: user-only notes with strict access policies.
-   `agreements`: shared decisions or commitments.
-   `agreement_updates`: dated status changes and follow-up outcomes.
-   `journal_tags` and `journal_entry_tags`: optional organization.
-   `ai_requests` or `ai_usage_events`: minimal operational metadata;
    avoid storing raw sensitive prompts unnecessarily.
-   `safety_reports`: limited, access-controlled reports, with a
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
    carefully designed retention policy.

This is a conceptual model. Final tables, constraints, indexes, and
policies should be designed and reviewed before implementation.

### Critical authorization requirements

<<<<<<< HEAD
- A user can access their own profile and permitted couple-space
    records only.
- Membership checks must be performed against trusted database state.
- One couple must never be able to query another couple's sessions or
    journal.
- A response author can read their own draft.
- The partner cannot read a draft response.
- A partner can read a response only after the session's
    server-validated reveal condition is satisfied.
- Private notes are visible only to their author.
- AI functions must independently validate who is calling and what
    content they are permitted to submit.
- Never rely on a client-supplied `user_id`, `couple_id`, or
    `is_revealed` value without verifying authorization and state
    server-side.
- Use least-privilege service credentials. Never ship a service-role
    secret in the app.
- Test unauthorized access explicitly, including direct API requests
=======
-   A user can access their own profile and permitted couple-space
    records only.
-   Membership checks must be performed against trusted database state.
-   One couple must never be able to query another couple's sessions or
    journal.
-   A response author can read their own draft.
-   The partner cannot read a draft response.
-   A partner can read a response only after the session's
    server-validated reveal condition is satisfied.
-   Private notes are visible only to their author.
-   AI functions must independently validate who is calling and what
    content they are permitted to submit.
-   Never rely on a client-supplied `user_id`, `couple_id`, or
    `is_revealed` value without verifying authorization and state
    server-side.
-   Use least-privilege service credentials. Never ship a service-role
    secret in the app.
-   Test unauthorized access explicitly, including direct API requests
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
    that bypass the UI.

### Data protection

<<<<<<< HEAD
- Use TLS for network traffic and platform/provider encryption at
    rest.
- Evaluate whether additional field-level encryption is needed for
    particularly sensitive content and understand its search/recovery
    trade-offs.
- Avoid logging answer text or sensitive AI prompts.
- Keep secrets in server-side environment/secrets management.
- Define retention, backup, export, and deletion behavior before
    launch.
- Document what data the AI provider receives and its
    retention/training policies.
- Use minimal analytics and do not send sensitive answer content to
    analytics tools.
- Treat account deletion and couple disconnection as explicit product
=======
-   Use TLS for network traffic and platform/provider encryption at
    rest.
-   Evaluate whether additional field-level encryption is needed for
    particularly sensitive content and understand its search/recovery
    trade-offs.
-   Avoid logging answer text or sensitive AI prompts.
-   Keep secrets in server-side environment/secrets management.
-   Define retention, backup, export, and deletion behavior before
    launch.
-   Document what data the AI provider receives and its
    retention/training policies.
-   Use minimal analytics and do not send sensitive answer content to
    analytics tools.
-   Treat account deletion and couple disconnection as explicit product
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
    flows with clear consequences.

------------------------------------------------------------------------

## 12. Flutter development approach for a React Native developer

The developer knows React Native concepts but is new to Flutter. Use a
learn-by-building workflow. Do not attempt to learn every Flutter
package before starting the product.

### Initial technical choices

<<<<<<< HEAD
- Learn Dart fundamentals first: types, null safety, collections,
    classes, async/await, Futures, and error handling.
- Learn Flutter's widget composition, layout constraints, navigation,
    forms, and lifecycle.
- Start with Flutter's built-in capabilities before adding
    dependencies.
- Choose one routing approach and one state-management approach after
    a small prototype. Avoid adding libraries for problems the MVP does
    not yet have.
- Keep UI, domain logic, data access, and backend integration
    separated.
- Use dependency versions compatible with the current stable Flutter
=======
-   Learn Dart fundamentals first: types, null safety, collections,
    classes, async/await, Futures, and error handling.
-   Learn Flutter's widget composition, layout constraints, navigation,
    forms, and lifecycle.
-   Start with Flutter's built-in capabilities before adding
    dependencies.
-   Choose one routing approach and one state-management approach after
    a small prototype. Avoid adding libraries for problems the MVP does
    not yet have.
-   Keep UI, domain logic, data access, and backend integration
    separated.
-   Use dependency versions compatible with the current stable Flutter
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
    SDK and verify package maintenance before adding packages.

### Suggested project structure

``` text
lib/
  app/
    app.dart
    router.dart
    theme/
  core/
    errors/
    networking/
    security/
    utilities/
    widgets/
  features/
    auth/
      data/
      domain/
      presentation/
    couple/
      data/
      domain/
      presentation/
    invitations/
      data/
      domain/
      presentation/
    questions/
      data/
      domain/
      presentation/
    sessions/
      data/
      domain/
      presentation/
    journal/
      data/
      domain/
      presentation/
    ai_reflection/
      data/
      domain/
      presentation/
  main.dart

test/
integration_test/
<<<<<<< HEAD

backend/
  Laravel application. One API, with modules for identity, couples,
  sessions, journal, and AI. Add a second deployable service only when
  a module has its own scaling or security boundary.

supabase/
  Row Level Security policies and local Supabase config. Laravel
  migrations own the table definitions.
=======
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
```

This is a starting convention, not a rule that every folder must exist
on day one. Add structure as features grow.

### Working rules

<<<<<<< HEAD
- Use small, reviewable Git commits.
- Keep a working app at the end of every phase.
- Run formatter, static analysis, and relevant tests before
    committing.
- Do not accept generated code without understanding the authorization
    and data-flow implications.
- Do not combine unrelated refactors with feature changes.
- Keep a short decision log for important architecture choices.
- Maintain a `README.md`, `.env.example` without secrets, setup
    instructions, and database migration history.
- Use development and production environments separately.
- Never test privacy rules only through the happy-path mobile UI.
=======
-   Use small, reviewable Git commits.
-   Keep a working app at the end of every phase.
-   Run formatter, static analysis, and relevant tests before
    committing.
-   Do not accept generated code without understanding the authorization
    and data-flow implications.
-   Do not combine unrelated refactors with feature changes.
-   Keep a short decision log for important architecture choices.
-   Maintain a `README.md`, `.env.example` without secrets, setup
    instructions, and database migration history.
-   Use development and production environments separately.
-   Never test privacy rules only through the happy-path mobile UI.
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e

------------------------------------------------------------------------

## 13. Phased implementation plan

### Phase 0 --- Validate the product and safety boundaries

<<<<<<< HEAD
**Status:** Written boundaries are in `docs/`. Interviews have not been
done. Launch geography is still open. Those two items stay open and do
not block the next build.

=======
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
Deliverables: - Confirm intended audience and first launch geography. -
Interview a small, diverse set of potential users. - Validate the main
problem and whether users would return to a relationship journal. -
Define what the product does not do. - Draft privacy, consent, content
moderation, and high-risk-topic policies. - Decide how shared history
behaves when a couple disconnects. - Create an initial set of reviewed
questions.

Exit criteria: The MVP problem, core journey, sharing rules, and safety
boundaries are documented.

### Phase 1 --- Learn Flutter through a tiny prototype

<<<<<<< HEAD
**Status:** The mock screens, question catalog, and widget tests are
written. `flutter analyze` and the widget tests passed on this machine.
The Android project exists locally and is not on GitHub yet. The Pixel 9
emulator booted, and the debug build did not finish, so the phone-screen
check is still open.

=======
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
Build: - App shell and theme. - A few screens with navigation. -
Question list. - Question detail. - Response form with local mock
data. - Basic widget tests.

Learn: - Dart fundamentals. - Widgets and layout. - Form validation. -
Navigation. - Async state and error states. - Flutter testing basics.

Exit criteria: The app runs on at least one emulator/device, and the
developer can explain the code they wrote.

<<<<<<< HEAD
Finish this phase by running the existing app on the Pixel 9 emulator
and committing the Flutter project files. Do not add accounts or API
calls in that pass.

### Phase 2 --- Backend foundation and authentication

**Status:** Next build after the Pixel 9 check.

Build: - Laravel application in `backend/`. - Supabase development
project, used as hosted Postgres and Auth. - Laravel migrations for
users, profiles, roles, and permissions, with `partner` as the only
assigned role. - Deny-by-default RLS policies in `supabase/`. - Sign-up
and sign-in screens that obtain a Supabase session and call Laravel
with that access token. - A profile request that Laravel accepts only
for the token's user. - Automated tests that call the API directly and
prove one user cannot read another user's profile.

Exit criteria: Two registered users can sign in. A direct API request
from one user cannot read the other user's protected profile. The
Flutter app contains no database password and no service-role secret.
=======
### Phase 2 --- Backend foundation and authentication

Build: - Supabase development project. - Database migrations. -
Authentication screens and session handling. - Profile creation. -
Initial RLS policies. - Automated authorization tests.

Exit criteria: Users can register and sign in, and a user cannot access
another user's protected data.
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e

### Phase 3 --- Couple spaces and invitations

Build: - Create couple space. - Generate/revoke/expire invitation. -
Accept invitation. - Membership management. - Waiting and error
states. - Tests for expired, revoked, repeated, and unauthorized
invitation use.

Exit criteria: Two separate accounts can join the same couple space
through explicit consent, with no unauthorized membership access.

### Phase 4 --- Question sessions and private answers

Build: - Question categories and versions. - Start a session. - Save
private drafts. - Submit and lock an answer. - Waiting status. -
Server-controlled reveal rule. - Tests that try to access the other
partner's draft through direct API/database access.

Exit criteria: Each partner can answer independently, and no draft leaks
before the reveal condition is satisfied.

### Phase 5 --- Reveal, reflection, and journal

Build: - Reveal screen. - Shared reflection editor. - Journal timeline
and detail view. - Private notes separated from shared notes. -
Agreements and follow-up records. - Historical version preservation.

Exit criteria: A couple can complete a question session and revisit it
later without historical answers being silently overwritten.

### Phase 6 --- AI integration

<<<<<<< HEAD
Build: - Laravel AI endpoint. - Provider abstraction. -
=======
Build: - Server-side AI function. - Provider abstraction. -
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
Minimal-context assembly. - Structured output validation. - Rate limits,
timeouts, usage monitoring, and error states. - User
feedback/reporting. - Safety tests for coercion, abuse indicators, and
harmful advice.

<<<<<<< HEAD
Exit criteria: No AI secret is present in the client. Laravel validates
the caller and the reveal rule before any provider call. AI output is
clearly labeled and does not bypass response privacy rules.
=======
Exit criteria: No AI secret is present in the client; the server
validates access; AI output is clearly labeled and does not bypass
response privacy rules.
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e

### Phase 7 --- Hardening and private beta

Complete: - End-to-end tests. - Accessibility review. - Device and
screen-size testing. - Security review of RLS and server functions. -
Privacy review of logs, notifications, AI provider data handling,
backups, exports, and deletion. - Content review by qualified
relationship/safety professionals where possible. - Test with a small,
consent-based group of couples. - Collect feedback without exposing
private answers to analytics.

Exit criteria: No known critical privacy/access-control issue remains;
key user journeys work reliably; users understand the product's
limitations.

### Phase 8 --- Launch and learn

<<<<<<< HEAD
- Release a limited initial version.
- Measure onboarding completion, invitation acceptance, first
    completed session, repeat sessions, journal revisits, and question
    skip rates.
- Collect qualitative feedback.
- Avoid treating more answered questions as inherently better;
    quality, comfort, and repeat voluntary use matter.
- Prioritize improvements based on observed user needs and safety.
=======
-   Release a limited initial version.
-   Measure onboarding completion, invitation acceptance, first
    completed session, repeat sessions, journal revisits, and question
    skip rates.
-   Collect qualitative feedback.
-   Avoid treating more answered questions as inherently better;
    quality, comfort, and repeat voluntary use matter.
-   Prioritize improvements based on observed user needs and safety.
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e

------------------------------------------------------------------------

## 14. Testing strategy

### Unit tests

<<<<<<< HEAD
- Question/session state transitions.
- Input validation.
- Domain logic for submission and reveal eligibility.
- Agreement status transitions.
- AI response parsing and fallback handling.

### Widget tests

- Sign-in and form validation.
- Draft editing and submit confirmation.
- Waiting-for-partner state.
- Reveal state.
- Journal search/filter behavior.
- Accessibility labels and keyboard behavior.

### Integration tests

- Registration and login.
- Invitation acceptance.
- Two users completing a question.
- Draft privacy before reveal.
- Reveal after both submit.
- Journal retrieval.
- Couple disconnection and access revocation.
- AI function authorization and error handling.

### Security/privacy tests

- User A cannot query User B's private notes.
- Partner A cannot read Partner B's draft response.
- A modified client request cannot force a reveal.
- A user from Couple A cannot query Couple B's data.
- An AI endpoint cannot retrieve arbitrary records by supplied IDs.
- Revoked membership removes access immediately.
- Notifications do not expose sensitive answers.
- Logs and analytics do not contain raw relationship responses.
- Deleted accounts and disconnected couples follow documented
=======
-   Question/session state transitions.
-   Input validation.
-   Domain logic for submission and reveal eligibility.
-   Agreement status transitions.
-   AI response parsing and fallback handling.

### Widget tests

-   Sign-in and form validation.
-   Draft editing and submit confirmation.
-   Waiting-for-partner state.
-   Reveal state.
-   Journal search/filter behavior.
-   Accessibility labels and keyboard behavior.

### Integration tests

-   Registration and login.
-   Invitation acceptance.
-   Two users completing a question.
-   Draft privacy before reveal.
-   Reveal after both submit.
-   Journal retrieval.
-   Couple disconnection and access revocation.
-   AI function authorization and error handling.

### Security/privacy tests

-   User A cannot query User B's private notes.
-   Partner A cannot read Partner B's draft response.
-   A modified client request cannot force a reveal.
-   A user from Couple A cannot query Couple B's data.
-   An AI endpoint cannot retrieve arbitrary records by supplied IDs.
-   Revoked membership removes access immediately.
-   Notifications do not expose sensitive answers.
-   Logs and analytics do not contain raw relationship responses.
-   Deleted accounts and disconnected couples follow documented
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
    retention rules.

------------------------------------------------------------------------

## 15. Non-functional requirements

<<<<<<< HEAD
- **Security:** Server-side authorization, least privilege, secure
    secrets, tested RLS, and safe session handling.
- **Privacy:** Data minimization, transparent AI processing, clear
    sharing states, and deletion/export policies.
- **Reliability:** Graceful handling of network failures and retryable
    requests.
- **Performance:** Common screens should feel responsive on mid-range
    devices and ordinary mobile networks.
- **Accessibility:** Readable typography, semantic labels, keyboard
    support, and screen-reader-compatible controls.
- **Maintainability:** Feature-oriented code organization, documented
    decisions, automated checks, and limited dependencies.
- **Portability:** Avoid unnecessary coupling to one AI provider or
    backend implementation.
- **Localization:** Keep question content separate from UI strings so
    localization can be added later.
- **Auditability:** Record important state changes without storing
=======
-   **Security:** Server-side authorization, least privilege, secure
    secrets, tested RLS, and safe session handling.
-   **Privacy:** Data minimization, transparent AI processing, clear
    sharing states, and deletion/export policies.
-   **Reliability:** Graceful handling of network failures and retryable
    requests.
-   **Performance:** Common screens should feel responsive on mid-range
    devices and ordinary mobile networks.
-   **Accessibility:** Readable typography, semantic labels, keyboard
    support, and screen-reader-compatible controls.
-   **Maintainability:** Feature-oriented code organization, documented
    decisions, automated checks, and limited dependencies.
-   **Portability:** Avoid unnecessary coupling to one AI provider or
    backend implementation.
-   **Localization:** Keep question content separate from UI strings so
    localization can be added later.
-   **Auditability:** Record important state changes without storing
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
    unnecessary sensitive content.

Set measurable performance and availability targets after a prototype
and expected usage are better understood.

------------------------------------------------------------------------

## 16. Initial success metrics

Measure whether the product is useful and trusted, not simply how much
content users submit.

Suggested early metrics: - Percentage of users who finish onboarding. -
Invitation acceptance rate. - Percentage of connected couples who
complete their first shared question. - Percentage who return for a
second session. - Journal revisit rate. - Percentage of agreements with
a voluntary follow-up reflection. - User-reported helpfulness of AI
prompts. - Question skip rate and qualitative reasons for skipping. -
Privacy concerns, unwanted disclosures, and safety reports. - Account
deletion and disconnection completion reliability.

Metrics should be aggregated and privacy-preserving. Never use private
relationship content as analytics data.

------------------------------------------------------------------------

## 17. Monetization considerations

Do not make monetization a prerequisite for validating the core
experience. Consider a free core experience and optional paid features
only after users demonstrate recurring value.

Potential later options: - Expanded reviewed question packs. -
Personalized conversation journeys. - Advanced journal organization and
exports. - Optional reminders and reflection plans.

Avoid charging for emergency resources, exploiting fear about
relationship failure, or using manipulative streaks and guilt-based
retention. Clearly disclose whether AI features incur limits or fees.

------------------------------------------------------------------------

## 18. Risks and open decisions

Resolve these before a public launch:

<<<<<<< HEAD
1. **Privacy model:** Which data is private, shared, or visible only
    after reveal?
2. **Shared history after separation:** What remains accessible to each
    partner after disconnection?
3. **AI data handling:** Which provider, retention policy, region, and
    contractual protections are acceptable?
4. **Safety policy:** How will the app respond to abuse, coercion,
    threats, or imminent danger?
5. **Question quality:** Who reviews sensitive questions and localized
    wording?
6. **Initial audience:** Premarital couples, married couples, or both
    in the first release?
7. **Offline behavior:** Can drafts be stored locally, and what
    protections are needed on shared devices?
8. **Data deletion/export:** What is deleted, what is retained for
    legal/operational reasons, and how is this explained?
9. **Notifications:** How can reminders avoid revealing sensitive
=======
1.  **Privacy model:** Which data is private, shared, or visible only
    after reveal?
2.  **Shared history after separation:** What remains accessible to each
    partner after disconnection?
3.  **AI data handling:** Which provider, retention policy, region, and
    contractual protections are acceptable?
4.  **Safety policy:** How will the app respond to abuse, coercion,
    threats, or imminent danger?
5.  **Question quality:** Who reviews sensitive questions and localized
    wording?
6.  **Initial audience:** Premarital couples, married couples, or both
    in the first release?
7.  **Offline behavior:** Can drafts be stored locally, and what
    protections are needed on shared devices?
8.  **Data deletion/export:** What is deleted, what is retained for
    legal/operational reasons, and how is this explained?
9.  **Notifications:** How can reminders avoid revealing sensitive
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
    topics on a lock screen?
10. **Professional review:** What relationship, privacy, and safety
    expertise is available before launch?

Do not launch with unresolved critical access-control or partner-safety
risks.

------------------------------------------------------------------------

## 19. Instructions for an AI coding assistant

Use this PRD as the product baseline. Do not attempt to generate the
entire application in one response or one code change.

Work in small, verifiable phases.

For each task: 1. State the goal and acceptance criteria. 2. Identify
what will be created or modified. 3. Explain any new Flutter/Dart
concepts in beginner-friendly terms. 4. Propose the smallest
implementation that satisfies the requirements. 5. Provide complete,
consistent code for the files being changed. 6. Explain how to run it
and how to verify it. 7. Add or update tests. 8. Call out security,
privacy, and data-migration implications. 9. Wait for the developer to
run the work and report results before proceeding to a dependent phase.

Do not: - Invent package APIs or use obsolete dependencies without
checking current compatibility. - Put secrets in Flutter code. - rely on
the UI to enforce authorization. - expose private partner responses to
AI or the other partner without the defined consent/reveal rules. -
silently overwrite historical answers or agreements. - make broad
unrelated changes. - skip tests because the feature appears simple. -
claim that an implementation is secure without explaining what was
tested.

If a requirement is ambiguous, ask a focused question or document a
conservative assumption before implementing it.

------------------------------------------------------------------------

<<<<<<< HEAD
## 20. Current implementation task

Phase 0 boundaries and the Phase 1 mock screens are written. Continue
with the unfinished Phase 1 check, then Phase 2.

1. Run the existing Flutter app on the Pixel 9 emulator and commit the
    project files that make that run reproducible.
2. Create the Laravel application in `backend/` and connect it to a
    Supabase Postgres database.
3. Add Supabase Auth, the `partner` role, deny-by-default RLS, and one
    API test that blocks cross-user profile reads.

Do not call an AI provider in this task. Do not let the Flutter app
query couple tables through Supabase. Privacy and reveal rules in
`docs/policies/` remain the rules for every later phase.
=======
## 20. First implementation task

Begin with **Phase 0 planning**, then implement only **Phase 1: a
Flutter prototype using mock data**.

First, provide: - A concise implementation plan. - A list of the
prerequisites to install on the developer's current operating system. -
The exact commands to create and run a Flutter project. - A short
explanation of Dart concepts needed for the first feature. - A proposed
initial screen flow and minimal file structure. - Acceptance criteria
for the prototype.

Do not connect a real backend or AI provider until the prototype and
privacy/reveal rules have been reviewed.

The first prototype should include a home screen, question categories,
question detail, and a response editor using mock data. It should
demonstrate the intended user experience without storing real sensitive
relationship information.
>>>>>>> f83242cc76ac13b9c0249d774db8ba19a7431f8e
