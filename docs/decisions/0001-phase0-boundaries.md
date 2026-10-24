# 0001 — Phase 0 boundaries

**Status:** Decided for the prototype. Interviews have not been done. A lawyer and a safety specialist have not reviewed these decisions.

**Date:** 2026-10-24

## Audience

The first question set is for engaged couples preparing for marriage. Married couples and long-term partners can be added later as separate stages on the same question format. A person is limited to one active couple space in the future MVP, and joining that space requires an explicit acceptance.

## Problem this version is testing

Couples often postpone conversations about money, children, family, faith, home, and expectations. When a conversation does happen, the two people may later remember it differently. The prototype tests whether a private answer, a clear waiting state, and a saved question can make that conversation easier to start and easier to revisit.

This decision log does not claim a statistic about why marriages succeed or fail.

## What the product is

Couple Conversations is a guided conversation and relationship-journal tool. Each person answers a question privately. A partner can see whether an answer has been submitted. The words stay hidden until both people have submitted and the reveal rule is satisfied.

## What the product is not

The product is a practice tool with honest limits. It is not:

- a therapist, marriage counselor, or crisis service
- a clinical diagnosis or a mental-health assessment
- a compatibility score, ranking, or "good partner / bad partner" label
- legal, financial, or medical advice
- a dating or partner-matching service
- a place to publish relationship answers

AI, when it is added in a later phase, may offer neutral reflection prompts. It may not decide who is right, promise that a relationship will succeed, or replace professional care.

## Language and geography

The prototype UI and question text are English. A launch country has not been chosen. Safety copy tells a person to contact local emergency services. It does not include a phone number or a local organization, because those must be verified for a specific place before they are shown.

## Core journey the prototype demonstrates

1. Read what the product is and what it refuses to do.
2. Choose a category and a question.
3. Write a private answer, skip the question, or mark it not ready.
4. After submit, see that the answer is locked for the session and that the partner's status is visible without their words.

The prototype keeps answers in memory for the running app only. It does not create an account, invite a partner, call a server, or call an AI provider.

## Sharing rules

- A draft is visible only to the person who wrote it.
- The other person can see a status such as "Not yet submitted" or "Submitted".
- Status is not the answer.
- Both answers become visible only after both people submit and a later server-side reveal check passes.
- The mobile screen is not the authority for that check. Hiding text in the app is not authorization.
- Submitted answers are locked for that session. A later change, once editing exists, is a dated amendment. The original remains.
- A person may skip a question or mark it "not ready" without a penalty.
- Private notes, when they exist, are separate from shared notes and are visible only to their author.

## Disconnect rule

When a couple space is disconnected in a later phase:

- Shared entries that were already revealed stay readable by both people.
- Those entries are not silently edited.
- Drafts that were never revealed stay visible only to their author.
- New sessions stop.
- Each person can export, then request deletion of their own private data.

The full rule is in [disconnect-and-retention.md](../policies/disconnect-and-retention.md). This prototype has no couple membership, so it does not enforce the rule yet.

## Question content

The first catalog is [engaged_questions_v1.json](../../assets/content/engaged_questions_v1.json). Every question is `stage: engaged`, `language: en`, and `reviewStatus: draft`. Draft means the product author wrote it for the prototype. A relationship professional has not reviewed it. Historical sessions in a later phase must keep the question version the couple actually answered.

## Interviews

User interviews are part of the phase 0 exit and have not been done. The script is in [interview-guide.md](../research/interview-guide.md). Do not treat this document as evidence that engaged couples have validated the problem.

## Prototype data rule

The running app tells people not to type real relationship information. Answers are not written to disk, logs, or analytics.
