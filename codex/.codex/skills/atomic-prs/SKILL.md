---
name: atomic-prs
description: Plan, implement, or split work into small, coherent PRs and maintain dependent PR stacks. Use when organizing changes into reviewable increments, deciding refactoring order, or adjusting stack scope; not for description-only rewrites or ordinary PR reviews.
---

# Atomic PRs

## Small-change principles

Distilled from [Google's Small CLs guidance](https://github.com/google/eng-practices/blob/master/review/developer/small-cls.md):

- Optimize for reviewer comprehension: focused changes receive faster, deeper review and are easier to merge, debug, and revert.
- Make each PR one coherent outcome, complete against its base. Keep the build and application working after every merge; later PRs must not repair an intentionally broken intermediate state.
- Include related tests and necessary context with behavior changes. Tests for existing behavior can land separately before a refactoring. Include real usage with a new API rather than leaving unused scaffolding.
- Sketch boundaries before coding. Split by feature, subsystem, reviewer ownership, or deployment boundary only when each increment remains meaningful. Stacking allows continued work during review.
- Judge size by conceptual complexity and context spread, not a line quota. Whole-file deletions and trustworthy mechanical transformations can have large but simple diffs.
- Separate substantial refactoring from behavior changes; incidental local cleanup can stay.
- If a change remains large, revisit its boundaries and explain the irreducible coupling to reviewers rather than disguising it as arbitrary fragments.

## User preference: build new work upstack

Do not refactor preemptively. Start with the requested working change, reusing existing code. When actual usage demonstrates a need for extraction or broader cleanup, put that refactoring above the working changes in a separate PR. This preference takes precedence over Google's suggestion to prepare a feature with a refactoring PR. Do not create abstractions merely to manufacture PR boundaries.

For test maintenance, a useful stack is:

```text
repair broken fixtures and remove obsolete tests
  → add tests and fixtures for one current UI flow
    → add tests for another independent flow
      → extract a shared helper, only if those usages justify it
```

Group related scenarios where they form one reviewable outcome; do not force one assertion or test into each PR. Keep each scenario's fixtures and documentation with it.

## Maintain and submit the stack

- Follow the user/repository Git instructions. In a git-spice repository, inspect `git-spice log long` before changing branches or PR relationships, then use git-spice for stack operations. Check installed command help rather than guessing flags.
- By default, fix only the selected branch or PR and its downstack (toward trunk). When submitting, restack and submit only that downstack, including the selected branch. Leave upstack branches untouched unless the user explicitly expands the scope. Building new work upstack does not authorize changing existing upstack branches.
- Before every commit or submission, run the repository's applicable lint and formatting checks and fix failures. Check the final revision after any fixes or conflict resolutions; do not rely on checks from an earlier revision.
- Inspect each PR's diff against its immediate parent. Describe that increment and its dependencies; report validation for the assessed revision, distinguishing mocked tests from real integration.
- When requested scope shrinks, remove deferred PRs from the active stack and restack retained work onto the remaining base. Preserve deferred branches unless deletion is requested. Update affected PR bases and descriptions within the authorized scope.
- When submission is authorized, enable git-spice navigation comments and verify the resulting PR order. This skill does not itself authorize publishing, closing PRs, or modifying unrelated branches.

Before finishing, verify that every retained PR has a clear purpose, contains its required supporting changes, and passes appropriate checks relative to its base.

## Worktree cleanup

Always clean up worktrees created for the task when the work is done. Preserve commits on branches before removing their worktrees, and verify that no uncommitted work will be lost. Do not remove pre-existing worktrees or force removal over uncommitted changes; report any cleanup that remains blocked.
