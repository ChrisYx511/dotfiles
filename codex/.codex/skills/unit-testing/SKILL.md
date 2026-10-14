---
name: unit-testing
description: Write, update, or review unit tests that verify observable behavior and resist implementation coupling, with a strong preference for real collaborators over mocks. Apply when working on unit tests or choosing test boundaries; preserve the scope of requested reviews.
---

# Unit testing

## Test behavior, avoid implementation coupling

- Start from the contract callers rely on: inputs, outputs, observable state changes, errors, and externally meaningful effects. Exercise the supported entry point with the real implementation.
- Avoid testing function implementation as much as possible. Do not assert private state, helper selection, internal call order or counts, intermediate representations, or a particular algorithm unless that detail is itself an explicit contract.
- Test private helpers through the behavior that exposes their effects. Do not expose internals solely for tests or use reflection to reach private methods.
- Ask: could a correct refactor change these internals without changing behavior? If so, the test should continue to pass unchanged.

## Avoid mocks as much as possible

- Default to real collaborators. A unit of behavior can span several functions or objects; do not isolate every function by replacing everything it calls.
- Especially avoid mocking, patching, spying on, or partially replacing the function under test or its internal helpers. Such tests can bypass the very behavior they claim to verify.
- Avoid mocks in general, including elaborate hand-written substitutes. Renaming a mock to a fake does not remove coupling.
- Use a test double only for a concrete obstacle, such as an uncontrollable clock, an unavailable external service, or an unsafe side effect. Prefer explicit inputs, existing platform controls, or a small boundary stub over a mocking framework. Explain the need briefly when it is not apparent.
- Place necessary doubles at an actual external boundary, not inside the computation. Assert results or observable effects rather than collaborator choreography. Verify an interaction only when that interaction is the contract, such as delivering a required external notification.
- Do not add interfaces, dependency injection layers, or production hooks solely to enable internal mocking. Reuse existing boundaries; make only justified changes needed for controllable behavior.

## Keep tests clear and trustworthy

- Name the behavior, scenario, and expected result using repository conventions.
- Separate preparation, execution, and assertions. Keep one behavioral scenario per test; related assertions may establish the same outcome.
- Use minimal, meaningful inputs. Explain non-obvious values. Prefer explicit expected results and parameterized cases to branching or recreating the production algorithm.
- Keep setup visible, using small helpers where useful. Avoid shared mutable state and order dependence; retain necessary resource cleanup.
- Control nondeterminism. Prefer useful regression cases to coverage quotas. Run relevant checks and report any execution limits.

## Infrastructure is a project decision

Real databases, filesystems, services, and other infrastructure are allowed when appropriate. Do not reject a useful test or force mocks merely to preserve a strict unit/integration label. Follow project conventions for test placement and execution, with repeatable setup and cleanup for resources used.

## Source and adaptation

Distilled from [Microsoft's unit testing best practices](https://learn.microsoft.com/en-us/dotnet/core/testing/unit-testing-best-practices). The stronger preference against implementation testing and mocks is the user's policy, not a claim that Microsoft prohibits mocks. The article's infrastructure-avoidance recommendation is intentionally omitted. Apply the guidance across languages using the repository's existing tools.
