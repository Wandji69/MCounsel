# Privacy and consent

**Status:** Draft product policy for the prototype. This is not a lawyer-reviewed privacy notice for a public launch.

## What this prototype stores

The phase 1 app stores a practice answer in memory until the process ends. Closing the app clears it. The app does not send the answer to a server, an AI provider, analytics, or the other person. The question catalog shipped with the app contains questions only. It contains no sample answers from a partner.

## Consent before sharing

Before a person answers, the app states what this practice build does: the answer stays on the device for the session and is not sent anywhere. A later production build must say, in plain language, what will be shared, with whom, and when, before the person submits.

A person does not join a couple space, and does not reveal an answer, by opening a link alone. Membership requires an explicit acceptance. Reveal requires the session rule below.

## Answer visibility

| State | Author | Partner |
| --- | --- | --- |
| Draft | Can read and edit their own text | Sees no text and no draft status beyond "not yet submitted" |
| Submitted, before reveal | Can read their locked text | Sees "Submitted" only |
| Revealed | Can read both shared answers | Can read both shared answers |
| Skipped or not ready | Can see their own choice | Sees the status only, not a hidden answer |
| Private note | Author only | No access |

The partner must not be able to recover a private response through the API, a database query, search, a notification, a log, or an AI request. The phase 1 app has none of those channels. The waiting screen is still built so it cannot show a second answer, and the catalog has no partner-answer field.

Reveal is allowed only after both people have submitted and a server-side check confirms the session rule. A client-supplied user id, couple id, or "already revealed" flag is not proof. The prototype does not implement that server. It also does not pretend the waiting screen is a real reveal.

## Editing

A draft can be edited by its author. A submitted answer is locked for that session. After a future reveal, a change is a dated amendment. The app keeps the earlier text.

## Private notes and shared notes

Shared reflections exist only after reveal, and both people can read them. Private notes are visually distinct and protected separately. The interface must not imply that a private note is shared. The prototype does not include notes yet.

## AI and analytics

This prototype does not call an AI provider. A later AI feature must:

- run from server-side code, with the provider secret kept off the device
- send only the minimum text needed for that request
- tell the person that an external provider will process the text
- refuse to send a private draft into a joint analysis unless both people have agreed to that specific use
- keep raw answers out of logs, crash reports, and analytics

Relationship answers are not analytics events. Early metrics, when they exist, are counts such as completion and skip rates.

## Export and deletion

Each person can export their information and request account deletion in the production app. The disconnect policy describes what happens to shared history and private drafts. Those flows are documented now and built when accounts exist.

## Authority

The phone UI may hide an answer. Hiding is not the privacy control. Production access rules are enforced in the database and in server-side functions, and they are tested with direct requests that bypass the screen.
