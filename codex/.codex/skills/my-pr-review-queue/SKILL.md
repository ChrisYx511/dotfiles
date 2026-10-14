---
name: my-pr-review-queue
description: List my open, non-draft GitHub PRs in the current repository without an approving review, grouped into needs rereview and to review.
---

# My PR Review Queue

Find PRs authored by the authenticated GitHub user in the current repository only.

## Workflow

1. Use the GitHub CLI or an available GitHub connector to identify the authenticated user and resolve the current repository's `owner/name` from the working directory (for example, `gh repo view --json nameWithOwner --jq .nameWithOwner`). If the current repository cannot be resolved, report the limitation instead of searching across repositories.
2. Retrieve all open, non-draft PRs authored by that user in the resolved repository. Explicitly scope the query to that repository (for example, with `repo:owner/name` in a search query) and paginate results.
3. Fetch all submitted reviews for each PR.
4. Exclude PRs with at least one effective approving review:
   - For each reviewer, use their latest decisive review: APPROVED, CHANGES_REQUESTED, or DISMISSED.
   - Comments and pending reviews do not supersede an approval.
   - Dismissed or superseded approvals do not count.
5. Group the remaining PRs:
   - **needs rereview**: Has at least one submitted review but no effective approval.
   - **to review**: Has no submitted reviews.

Comment-only reviews count as submitted reviews. Pending reviews and ordinary PR conversation comments do not. Do not compare approval commits against the current head.

## Output

Return plain text Markdown using this structure:

## needs rereview

| Repository | PR |
| --- | --- |
| owner/repo | [#123 — PR title](PR_URL) |

## to review

| Repository | PR |
| --- | --- |
| owner/repo | [#456 — PR title](PR_URL) |

Include only repository, PR number, title, and link. Do not add review-status explanations.

Sort each group by repository, then PR number. Write “None.” instead of a table for an empty group.

If authentication, access, pagination, or missing review data prevents complete results, state the limitation. Do not present partial results as complete.

Only read GitHub data. Do not request reviews, post comments, modify PRs, or change branches.
