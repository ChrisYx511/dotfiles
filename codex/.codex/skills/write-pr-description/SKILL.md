---
name: write-pr-description
description: Write or simplify a GitHub PR description using plain-language summaries, design decisions, actual test coverage, and concise integration evidence. Use when asked to draft, rewrite, or update a PR description; not for reviewing PR comments or implementing fixes.
---

# Write a PR description

Write for a human reviewer who is unfamiliar with the system. Use sparse, simple prose and explain the final behavior rather than recounting the work. Default to the current branch's PR unless the user names another.

## Establish the facts

- Check the branch, working tree, PR head/base, existing description, and actual diff. Account for local changes or a different remote head; do not attribute results from another version to the published PR.
- Follow repository Git/PR instructions and use its established branch/stack tooling when applicable. Keep the description scoped to this PR, not the entire stack.
- Preserve relevant dependencies, merge prerequisites, and material limitations from the existing description. Verify them where possible. Remove redundant summaries and bot-generated prose that make the requested rewrite dense, while respecting repository-required content.
- Do not modify implementation, restack, push branches, or repair unrelated failures as part of a description-only request.

## Use these four sections

### tl;dr

Use the heading `## tl;dr`. Write **one or two sentences maximum**, understandable without system knowledge. State the practical problem and resulting behavior. Avoid internal class names and unexplained domain terms.

### changes

Use the heading `## changes`. Include only changes that involve a meaningful design decision. For each bullet, explain the choice and why it matters in ordinary terms. Group related decisions; omit file inventories, mechanical edits, and a commit-by-commit account. If there are no meaningful design decisions, keep this section minimal.

### coverage

Use the heading `## coverage`. Generate an **actual, appropriately scoped PR coverage report using the repository's tooling** and established test environment. Inspect the PR diff and the repository's test/coverage configuration before choosing the scope.

- Separate **which tests run** from **which production code is reported**. Run the existing suites relevant to the affected components, their callers, and integration boundaries—not just newly added tests or a few regression cases. Use the full suite when the change is cross-cutting or the repository cannot reliably select affected tests; otherwise avoid unrelated suites merely to inflate coverage.
- Report the changed production files/modules, including relevant unexecuted files when supported. Clearly label any filtering. Prefer changed-line coverage against the PR base when reliable tooling supports it, with file/module coverage as useful context. Do not call whole-module coverage changed-line coverage or imply that a helper's 100% covers the feature.
- State the assessed revision, test selection, reported code scope, and coverage metric (for example, lines or branches). Include the real tool-generated report in a fenced text block, or a compact faithful excerpt with a link to the complete report. Keep the exact reproduction command available, using a collapsed block if long.
- Reuse saved or CI output only when it matches the assessed revision and scope. Otherwise run coverage and retain the output. Do not omit low-coverage affected files or combine incompatible reports into a misleading total.
- If coverage looks sparse, check whether test selection was too narrow before treating it as a missing-test problem. Distinguish untested changed behavior from unrelated methods in a large touched module. Briefly state meaningful remaining gaps; do not add tests solely to raise the percentage during a description-only task.
- If the repository has no applicable coverage tooling, or a run is blocked or fails, state that limitation and its effect on the report. Do not invent numbers, silently install new tooling, present test counts as coverage, or imply a failed run passed. For changes without executable production code, state that coverage is not applicable.

### testing & integration

Use the heading `## testing & integration`. Scale detail to the change. Include:

- What was actually exercised, at which revision, and the observed outcome. Distinguish real database/service integration from mocked dependencies, unit tests, and full UI/end-to-end testing.
- Compact proof: selected verbatim test-runner result lines, or a directly relevant CI run/log link. Describe what those checks demonstrate in plain language. A passing suite label alone is not evidence that a particular integration flow was exercised.
- A practical reviewer rerun command and essential prerequisites. Reuse one command for both tests and coverage where possible; put long commands or output in a collapsed `<details>` block.
- Material failures or untested paths, briefly. Do not claim full-stack integration from this PR's service tests or use older handoff notes as proof. Mention later stack blockers only when they affect the integration claim.

For a small backend change, a few sentences plus the command and output are enough. Do not add speculative manual checklists or unnecessary integration work. Prefer inline code comments or narrowly targeted GitHub review comments for complex local explanations rather than expanding the PR body; posting comments requires authorization for that action.

## Publish and verify

An instruction to update the PR description authorizes editing that PR body; a request to draft one does not imply publication. Once authorized, prepare the complete text and apply it without an extra confirmation step.

With `gh`, write the Markdown to a temporary UTF-8 file and use `gh pr edit <number> --body-file <path>` to preserve newlines and literal code. Read the description back to verify it matches, ignoring trailing-newline differences. On failure, inspect the cause before retrying; do not broaden the mutation. Finish with the PR link and a short statement of what changed, including any important evidence limitation.
