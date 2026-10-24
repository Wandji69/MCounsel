# Disconnect and retention

**Status:** Decided for a later phase. The prototype has no accounts and no couple membership, so it does not enforce this policy yet.

## Rule

When a person disconnects a couple space:

1. Shared entries that were already revealed stay readable by both people.
2. Those entries are not silently edited, rewritten, or deleted.
3. Drafts and other unrevealed responses stay visible only to the person who wrote them. Disconnect does not reveal them.
4. New question sessions in that couple space stop.
5. Each person can export their information, then request deletion of their own private data.

Private data here means that person's account, their unrevealed drafts, and their private notes. Deleting private data does not silently erase the other person's copy of an entry that was already revealed.

## What each person can still open

After disconnect, a person can still open:

- their own unrevealed drafts and private notes
- question text, both shared answers, shared reflections, and agreements that were revealed before the disconnect

They cannot open:

- the other person's unrevealed drafts or private notes
- a new session in the disconnected space
- the other person's account

## History stays stable

A revealed entry remains the record of what was shared. A follow-up, if one is ever added after disconnect, is a new dated record. It does not replace the original. This prototype does not write follow-ups.

## Export and deletion

Export comes before a deletion request so a person can keep their own copy. The production flow must say, before confirmation, what will remain readable and what will be deleted. Account deletion and couple disconnection are separate confirmations.

Operational backups and legal retention, if any, are not defined in this prototype. They must be written down and explained before a public launch. Until then, the app stores no relationship answers on disk.

## What this prototype does

Phase 1 keeps a practice answer in memory and drops it when the process ends. There is no partner, no revealed archive, and no deletion workflow to run. The waiting screen still follows the visibility rule: partner status is visible, partner words are not.
