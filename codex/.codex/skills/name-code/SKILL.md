---
name: name-code
description: Choose or improve names for variables, functions, types, and modules when writing code or reviewing naming. Apply language and repository conventions without expanding the task into unrelated renames.
---

# Name code for the reader

Read the declaration, its uses, and neighboring code before choosing a name. Follow the repository's conventions and the target language's idioms; judge the name at the call site, not in isolation.

- Describe the domain concept or role. Prefer `remainingAttempts` to `ra`, and `calculateTax` to `process`. Use the same word for the same concept throughout the changed code.
- Avoid invented abbreviations and single-letter domain names. Keep established terms such as HTTP, conventional type parameters, and short loop indices when their meaning is immediately clear in a small scope. Longer-lived or public names need more context.
- Avoid redundant implementation labels such as `strName`, `userObject`, or `itemsArray`. Preserve distinctions that carry meaning, such as identifiers versus records, encoded versus decoded text, or units.
- Prefer an existing standard duration or quantity type when appropriate. Otherwise make primitive units explicit, such as `timeoutSeconds`; do not invent a wrapper merely to remove a suffix.
- Name a general type for the concept and a specialized type for its specialization, such as `Truck` and `TrailerTruck`, rather than reflexively adding `Base` or `Abstract`. Keep ecosystem conventions such as C# interface names beginning with `I`.
- Treat vague names such as `Utils`, `Helper`, or `Manager` as a prompt to inspect responsibility. Prefer an existing cohesive module or a descriptive domain name. Do not manufacture classes, hierarchies, or a refactor solely to eliminate a word.
- Use predicates that read clearly in conditions. Avoid double negatives and names that hide mutation or other meaningful effects.
- Avoid vague positional language such as "target", "destination", "source", "current", "next". Always specify the role or meaning of the value in context, such as `sourceFilePath` or `nextAvailableId`. Avoid using "current" to mean "the one being processed" or "the one in scope"; prefer `active`, `selected`, or `processing`.

For a rename, inspect callers, imports, tests, serialized keys, reflection, and external API use as relevant. A local rename is different from changing a published contract. Keep compatibility and requested scope intact; verify references and run the relevant existing checks.

## Source and adaptation

Based on the supplied video's transcript: [Naming Things in Code](https://www.youtube.com/watch?v=-J3wNP6u5YU), especially abbreviations (0:22), types and units (2:05), type names (3:36), and utility modules (5:28). Retrieved 2026-09-29 using youtube-transcript-api.

The video argues strongly against abbreviations and demonstrates moving utility functions into classes. This skill deliberately allows established language idioms and existing modules; those examples are not universal requirements to create classes. Compatibility checks and scope limits are implementation safeguards added to the video's naming advice.
