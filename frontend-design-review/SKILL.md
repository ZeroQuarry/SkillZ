---
name: frontend-design-review
description:
  Review a user interface — a page, screen, component, mockup, screenshot, or design diff — for concrete design defects: choices that read as templated defaults, weak typography, decoration that encodes nothing, copy that works against the user, and quality-floor failures. Follow the scope named by the user. Use when asked to review, critique, or give feedback on UI or a design. Do not use for building or redesigning UI (that is frontend-design), for implementing motion (that is animate), or for code-correctness review (that is code-review).
license: MIT
---

# Frontend Design Review

Follow the review scope stated by the user: the page, screen, component, route, screenshot, or diff they name. Do not silently expand a request to review one screen into a critique of the whole product. When the scope or comparison base is genuinely ambiguous, inspect the available context and ask only if proceeding would materially change the review.

Inspect the complete requested surface before concluding — rendered output or screenshots where the environment supports them, plus the markup, styles, and copy behind them. Verify each potential issue against what the design is actually for before reporting it.

## Review calibration

- Report only discrete, actionable defects that materially hurt the design: choices that make it read as templated, type or layout that works against comprehension, copy that confuses, accessibility failures. Skip subjective taste.
- Distinguish a default from a choice. The generic treatments below are defects only where the brief leaves the axis free; if the brief, brand, or an existing design system pins the direction, following it is correct and not a finding.
- Apply the genericity test: if the surface would look the same for a different product in a different industry, the choices that do not transfer are the findings.
- State the concrete element, treatment, or copy string that triggers the problem and the resulting impact on comprehension, trust, distinctiveness, or usability.
- Report issues introduced by the change under review when a comparison base (a diff, a before-screenshot) is supplied. Do not report pre-existing conditions as regressions.
- Ignore code style and implementation details unless they produce a visible defect.
- Continue after the first issue and return every qualifying finding. Keep references small: file and line, or element and region.
- Each finding can be a blocker, or a P0-P3.

## What to look for

**Generic defaults.** The tells of a generated page — legitimate for some briefs, but defaults rather than choices, appearing regardless of subject: a warm cream background with a high-contrast serif display and a terracotta accent; a near-black background with a single acid-green or vermilion accent; a broadsheet layout with hairline rules and zero border-radius everywhere; the SaaS-card kit (identical rounded cards, one radius on everything, the same soft shadow under each, gradient washes as decoration); template chrome whatever the subject — tracked-out ALL-CAPS eyebrow labels above every heading, meta strings joined with middle dots, "WORD — fragment" labels, tinted near-black standing in for black, monospace for small data labels, arrows appended to links and buttons.

**Typography.** Default families reached for rather than chosen; one word accented in italic, bold, or color inside a headline; all-caps labels; unnecessary labels above content; line lengths far past ~80 characters; type used as a visual element treated as a neutral delivery vehicle.

**Structure and restraint.** Decoration that encodes nothing — outlines, dividers, eyebrows, numbered markers on content that is not actually a sequence; boldness spent in five places instead of one; ornament that does not serve the brief; no identifiable memorable element.

**Motion.** Non-user-triggered motion scattered instead of spent once: fade-and-slide-up entrances on every section, hover transitions on every card. Motion that answers a user action is welcome. Check the floor: `prefers-reduced-motion` respected, hover gated on pointer capability, functional data left still.

**Copy.** System language where user language belongs ("webhook config" for what a user knows as "notifications"); selling where describing was needed; CTAs that do not say what happens; an action renamed mid-flow (a "Publish" button producing a "Sent!" toast); apologetic or vague errors; empty states that express mood instead of direction.

**Quality floor.** Not responsive down to mobile; no visible keyboard focus; contrast failures; motion or hover applied unconditionally. These are defects regardless of aesthetic direction.

## Review-only behavior

Treat a review request as read-only unless the user also asks for fixes. Do not rewrite copy, restyle elements, or commit changes. If the environment can render or screenshot the UI, review what it renders, not only the source.

## Response

Return the review in normal Markdown unless the host supplies a structured review protocol; when it does, follow that protocol instead. Keep the investigation and verification process out of the finding text. For each finding, write a compact comment: the concrete trigger and resulting impact, plus one minimal remediation direction when it materially helps, with the file and line or the element and region. Rank findings by impact on comprehension and usability before points of taste. If no actionable issues remain, say so directly and briefly.
