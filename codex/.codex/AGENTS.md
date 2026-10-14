# Git and PR workflow

- Use the git-spice CLI for branch navigation and PR-stack management whenever working in a git-spice-managed repository. Inspect the current branch and stack with `git-spice log long` (or `--json`) before making branch or PR changes.
- The executable may be named `git-spice` or `gs`; verify that `gs` is git-spice before using it. Use the installed CLI's help for command syntax.
- Prefer git-spice for creating/tracking branches, navigating the stack, restacking dependent branches, and submitting PR updates. Ordinary `git` commands remain appropriate for status, diffs, reading revisions, staging, and commits; use `gh` to read GitHub comments and checks.
- Keep operations scoped to the requested branch or PR. For a current-PR review, consult other stack branches only to determine whether a reported concern is addressed there. Do not turn it into a review or submission of the whole stack.
- Preserve stack relationships when changing commits. Inspect affected descendants and restack when necessary within the authorized scope; do not rewrite or publish unrelated branches automatically.
- If git-spice is unavailable or the repository is not initialized for it, state that briefly and use ordinary Git where appropriate. Do not initialize or install it without task authorization.

## Atomic PRs

Use the [atomic-prs skill](skills/atomic-prs/SKILL.md) when planning, implementing, or splitting work into PRs and when adjusting a PR stack. It contains the small-change principles and the preference to build upstack without preemptive refactoring.

## Code review

Use the [code-review skill](skills/code-review/SKILL.md) for every requested code review, alongside any other applicable review skills. Preserve the requested scope and output format, and consolidate overlapping findings into one review.

## Code style and language idioms

- Before coding, identify every language being changed, its supported version, and the repository's conventions. Perform a focused online research pass using official language/standard-library/framework documentation and, where needed, an established style guide. Read the relevant pages and briefly cite the sources and choices affecting the task. Reuse applicable research already read in this task; disclose unavailable sources rather than implying verification.
- Use the [write-readable-code skill](skills/write-readable-code/SKILL.md) for implementation and readability refactoring, and the [name-code skill](skills/name-code/SKILL.md) when choosing or improving names. In reviews, apply their guidance within the requested scope and the code-review skill's reporting standards.
- Follow repository conventions and configured formatters over outside preferences. Use idioms appropriate to the language and supported version; do not translate another language's style mechanically.
- Name concepts and intent clearly. Avoid invented abbreviations, redundant type labels, and vague utility names; retain established language conventions and meaningful unit distinctions.
- Prefer shallow control flow and a clear main path. Extract meaningful operations and genuinely shared behavior when doing so improves comprehension. Preserve distinct errors, evaluation order, side effects, and cleanup.
- Keep changes focused. Do not introduce abstractions, classes, public API breaks, or unrelated renames merely to satisfy a style preference. Verify behavior and run relevant existing checks.

## Unit tests

- Use the [unit-testing skill](skills/unit-testing/SKILL.md) when writing, updating, or reviewing unit tests or choosing their boundaries. Preserve the requested review scope.
- Test observable behavior through supported entry points. Avoid testing function implementation as much as possible: tests should survive correct refactors without depending on private state, helper calls, internal call order, or a particular algorithm.
- Avoid mocks as much as possible, especially mocking, patching, or spying on function internals or the function under test. Prefer real collaborators and assertions on results or observable effects. Use a minimal double at an external boundary only for a concrete need; verify interactions only when they are part of the contract.
- Do not introduce production abstractions or expose private code solely to support internal mocking. Do not reproduce the implementation to calculate expected results.
- Keep tests readable, focused, repeatable, and independent, with meaningful inputs and clear expected outcomes. Follow existing test conventions and run relevant checks.
- Infrastructure dependencies are allowed when appropriate for the project. Do not force mocks or reject tests solely because they use real databases, filesystems, or services; provide repeatable setup and cleanup.
