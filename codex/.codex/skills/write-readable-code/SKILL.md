---
name: write-readable-code
description: Write or simplify code for readable control flow, cohesive shared behavior, and language-idiomatic structure. Use during implementation and requested readability refactoring; during review, preserve the review's scope and reporting standards.
---

# Write readable, idiomatic code

## Before coding

Identify each language being changed and its supported version. Read applicable repository instructions, nearby implementations, formatter/linter configuration, and relevant callers first.

Perform a focused online research pass for each language involved before writing code. Start with official language, standard-library, and framework documentation; use a clearly identified established style guide where official style guidance is absent. Read the relevant material, not just search snippets. Consult [language-sources.md](references/language-sources.md) for starting points, and research unlisted languages in the same way.

Confirm the task-relevant naming, control-flow, error/resource handling, and standard-library idioms. Record the source links and a brief note about choices affecting this task in the work update. Reuse research already read in this task when its version and context still apply; do not repeat a general survey for every edit. If browsing fails, disclose the gap and use repository conventions and available documentation without claiming online verification.

Repository requirements, compatibility, and configured tools take precedence over outside style preferences. Do not transplant one language's idioms into another or introduce unsupported syntax.

## Shape the code

- Reduce unnecessary nesting with guard clauses, early returns, or loop `continue` when they make the main path easier to follow. Preserve evaluation order, side effects, cleanup, and distinct failure behavior.
- Merge related conditions only when their outcomes really are equivalent. Do not collapse authentication and authorization checks if that changes errors, logging, or security behavior.
- Give a complex predicate or coherent operation a meaningful name when that removes mental work. Extract into a function when it improves understanding or shares a real responsibility; keep simple local expressions inline. Do not impose arbitrary line-count limits or split code into tiny forwarding helpers.
- Share duplicated behavior that represents the same rule and should change together. Search for an existing implementation first. Similar-looking code with different reasons to change does not require a common abstraction; avoid flag-driven helpers introduced just to eliminate a few lines.
- Make the main flow understandable from top to bottom. Keep related operations together, use whitespace for logical groups, and let the configured formatter handle layout.
- Use meaningful names and the target language's normal constructs. Favor clarity over compressed one-liners. Explain non-obvious reasons and constraints in comments rather than narrating syntax.

## Check the result

Read the changed code as a caller would. Check that reduced nesting or extraction preserved success, failure, cleanup, and side-effect behavior. Run the repository's relevant formatter, linter, type checks, and tests as appropriate to the change. For a nontrivial control-flow change, add or retain a focused runnable regression check covering the affected behavior. Avoid unrelated formatting or refactoring.

## Source and adaptation

Based on the supplied video's transcript: [The 3 Laws of Writing Readable Code](https://www.youtube.com/watch?v=-AzSRHiV9Cc): reduce nesting (0:00), inversion (0:37), extraction (2:02), avoid duplicated behavior (3:17), and meaningful names (4:36). Retrieved 2026-09-29 using youtube-transcript-api.

The online research workflow is the user's additional requirement. Limits on extraction and deduplication, preservation of error semantics, and verification are practical safeguards added to the video guidance. The video is about readability and maintenance, not merely visual formatting.
