---
name: docs-review
description:
  Review technical writing — READMEs, guides, tutorials, API references, runbooks, changelogs, design docs, or docs diffs — for concrete defects: claims that do not match the code, steps a reader cannot follow, stale references, contradictions, and terminology drift. Follow the scope and comparison base named by the user. Use when asked to review, critique, or fact-check documentation. Do not use for writing new documentation from scratch, for code review (that is code-review), or for UI copy and design critique (that is frontend-design-review).
license: MIT
---

# Docs Review

Follow the review scope and comparison base stated by the user: the file, section, doc set, or diff they name. Do not silently expand a request to review one guide into an audit of the whole documentation tree. When the scope is genuinely ambiguous, inspect the available context and ask only if proceeding would materially change the review.

Inspect the complete requested document before concluding. Verify each claim against the code it describes — commands, flags, API names, parameters, defaults, file paths, examples — rather than against plausibility. Run or trace what can be run or traced.

## Review calibration

- Report only discrete, actionable defects: somewhere a reader following this document hits an error, a wrong mental model, a dead end, or a contradiction. Skip style preferences.
- State the concrete claim, step, or sentence that triggers the problem and the resulting impact: what the reader does, and what breaks or misleads.
- Report issues introduced by the change under review when a comparison base (a diff, a previous version) is supplied. Do not report pre-existing gaps in untouched sections as regressions.
- Judge the document against its stated audience and type. A tutorial may skip reference detail; a reference may skip narrative. Do not flag a reference for not being a tutorial.
- Ignore formatting, spelling, and lint unless they cause real misunderstanding or break a command.
- Continue after the first issue and return every qualifying finding. Keep referenced line ranges small.

## What to look for

**Accuracy.** Claims that do not match the current code: renamed or missing commands, flags, parameters, events; wrong defaults; examples whose output the current version no longer produces; version or platform requirements stated nowhere or stated wrong. Verify that links resolve and that file paths exist.

**Followability.** A reader can execute the steps top to bottom in order: prerequisites stated before use; every value in a command defined or obviously a placeholder; no step silently assuming setup from an unstated page; no "simply" or "just" papering over a real step.

**Completeness within scope.** The task the document promises — by its title and intro — is actually completed by it. Failure states a reader will hit are covered, or the document says where to turn when it does not cover them.

**Structure.** Content in the order the reader needs it: task before explanation, decision points surfaced where they arise; headings that describe their content; a document not doing two jobs at once where the mixing misleads.

**Terminology and voice.** The same thing called the same name throughout (a "project" here is not a "workspace" three sections later); active voice and plain verbs; user-perspective naming; text describing what a thing does rather than selling it. Marketing adjectives in technical docs are a finding when they substitute for a fact.

## Review-only behavior

Treat a review request as read-only unless the user also asks for fixes. Do not edit files, commit, or open pull requests. If the host supplies a structured review protocol, follow it instead of the response format below.

## Response

Return the review in normal Markdown. For each finding, write a compact comment: the location (file and line, or heading), the concrete trigger, and the resulting reader impact, plus the minimal correction when it materially helps — the corrected command, the accurate claim, the missing prerequisite. Number findings across the whole report so the user can act on them individually ("fix 2 and 5"). If no actionable issues remain, say so directly and briefly.
