---
name: code-review
description: Apply evidence-based code-review standards, review workflow, and actionable feedback. Use for every requested code review alongside any other applicable review skills, including specialized or narrowly scoped reviews; preserve their scope and required output format.
---

# Code review

## Compose with other review skills

Use this as the common review standard, not a replacement for security, performance, simplicity, framework, or other specialized review skills. Read applicable skills and repository instructions, then produce one consolidated review with duplicate findings merged. Honor the user's requested scope and output format: a simplicity-only review remains simplicity-only. Do not automatically invoke unrelated specialty reviews or delegate work.

A review request authorizes inspection and appropriate local verification. It does not by itself authorize implementation changes, restacking, posting GitHub comments, submitting approval, or requesting changes on GitHub. Return findings to the user unless publication is explicitly authorized.

## Standard: improve code health

Following [Google's review standard](https://github.com/google/eng-practices/blob/master/review/reviewer/standard.md), favor changes that improve correctness and maintainability even when further polish is possible. Do not require perfection or accept an actual regression merely to move faster.

Use technical evidence and engineering principles over personal preference. Apply the repository's explicit style rules; otherwise respect established conventions and equally sound author choices. Label optional polish and educational observations as nonblocking. Explain the concrete cost of a design concern rather than presenting taste as a defect.

## Establish scope and navigate

Following [Navigating a CL](https://github.com/google/eng-practices/blob/master/review/reviewer/navigate.md), understand the intended outcome and main design first, then inspect the remaining changes in a logical order. Surface fundamental design problems early; do not spend the review polishing code that needs a different approach.

Record the reviewed revision, base, and local modifications. For a stacked PR, compare against its immediate parent, not the trunk. Follow the user's git-spice workflow when applicable. Consult other stack branches only to determine whether a concern is already addressed; do not silently review the entire stack. An upstack fix does not make a broken intermediate PR independently safe to merge.

Read relevant requirements, callers, shared helpers, types, and data flow before asserting a defect. Separate newly introduced issues from unrelated existing debt. If context is unavailable, identify the uncertainty rather than inventing intent.

## Examine the change

Distilled from [What to look for](https://github.com/google/eng-practices/blob/master/review/reviewer/looking-for.md):

- Assess design fit, user-visible behavior, edge cases, concurrency, and unnecessary complexity.
- Inspect every human-written changed line within the assigned scope and enough surrounding code to understand it. Check generated changes through their source and generation process when appropriate.
- Review tests as maintained code: meaningful assertions, relevant failure cases, and whether they would fail for the regression they claim to detect.
- Check names, explanatory comments, documentation, and applicable style rules. Prefer simpler code over prose defending avoidable complexity.
- For UI changes, inspect behavior visually when code alone cannot establish the result. State any unverified interactions.
- Identify specialist knowledge needed for security, accessibility, or other risks rather than implying expertise or verification you do not have.

Lessons from fixture and E2E review:

- Trace the full assertion path. A test must not repair the imported value before checking it or pass while the real API rejects its request.
- Check fixture validity against current contracts, and search consumers before calling a fixture obsolete.
- Distinguish intercepted browser responses from backend integration. An existing but skipped test is not evidence of an exercised flow.
- Use relevant, runnable checks; report what actually ran at the assessed revision. Do not equate test counts with coverage or infer untested behavior from a green suite.

## Report actionable findings

Following [Writing review comments](https://github.com/google/eng-practices/blob/master/review/reviewer/comments.md), discuss the code respectfully, explain why the issue matters, and distinguish required fixes from suggestions. Give enough guidance to resolve the problem without dictating an unnecessary redesign. Important explanations should survive in clearer code or appropriate documentation, not only in a review thread.

For each finding, identify the location, triggering condition, observed or demonstrable consequence, and smallest useful correction. Rank by impact and use the requested severity scheme. Do not manufacture findings to fill a quota. Keep uncertain hypotheses separate from confirmed defects; verify before escalating severity.

Lead with findings. Then state the reviewed scope, validation, and material limitations briefly. If there are no actionable findings, say so without implying that all behavior was tested. Preserve another review skill's required format instead when applicable.

## Re-review and resolve disagreement

Following [Handling pushback](https://github.com/google/eng-practices/blob/master/review/reviewer/pushback.md), reconsider findings when the author supplies evidence and withdraw invalid objections. Maintain justified concerns with clear reasoning. Do not accept a vague promise of later cleanup for a defect introduced by this PR; keep unrelated surrounding debt separate. If disagreement remains, describe the concrete tradeoff for the user or maintainer to decide, without contacting others automatically.

Following [Review speed](https://github.com/google/eng-practices/blob/master/review/reviewer/speed.md), provide useful feedback promptly and avoid additional rounds for optional polish. Recheck fixes and affected interactions on the new revision; do not repeat resolved findings or waive material issues for speed. Clearly distinguish a partial review, a recommendation to approve, and an approval actually submitted.

If splitting or implementing fixes is requested, apply the [atomic-prs skill](../atomic-prs/SKILL.md): build working increments upstack and defer refactoring until concrete usage justifies it.
