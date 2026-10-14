# Language idioms: research starting points

These sources were consulted on 2026-09-29. Open the relevant source for the language and task, check version applicability, and follow the repository's conventions. This is a starting list, not a claim to cover every language or framework. Google and MDN guides describe their authors' conventions, not universal language standards.

| Language | Source | Useful distinctions to check |
| --- | --- | --- |
| Python | [PEP 8](https://peps.python.org/pep-0008/) | snake_case functions/variables, CapWords classes; local consistency and backward compatibility take priority over stylistic cleanup. Check standard-library documentation for the operation at hand. |
| JavaScript | [MDN JavaScript code guidelines](https://developer.mozilla.org/en-US/docs/MDN/Writing_guidelines/Code_style_guide/JavaScript) | Descriptive camelCase bindings, const for bindings not reassigned, readable standard constructs. This guide targets MDN examples; the project's JS and framework conventions control. |
| TypeScript | [Google TypeScript style guide](https://google.github.io/styleguide/tsguide.html) | UpperCamelCase types and lowerCamelCase values; no decorative interface `I` prefix. Check the project's type modeling and TypeScript version before adopting a pattern. |
| Go | [Effective Go](https://go.dev/doc/effective_go) | gofmt, package-aware names that avoid repetition, conventional short receivers, explicit error handling. The document notes that it is not a complete guide to modern Go; consult current documentation for newer features. |
| Rust | [Rust API naming guidelines](https://rust-lang.github.io/api-guidelines/naming.html) | snake_case functions/modules and UpperCamelCase types; conventional conversion method names. Research ownership and error handling in official documentation for the operation involved. |
| C# | [.NET type naming guidelines](https://learn.microsoft.com/en-us/dotnet/standard/design-guidelines/names-of-classes-structs-and-interfaces) | PascalCase type names and the conventional `I` prefix for interfaces. This page draws on an older book; confirm relevant modern C# features separately. |
| Java | [Google Java style guide](https://google.github.io/styleguide/javaguide.html) | UpperCamelCase classes, lowerCamelCase methods and fields; consistency in layout and import structure. Apply when compatible with the project's own guide. |
| Kotlin | [Official coding conventions](https://kotlinlang.org/docs/coding-conventions.html) | camelCase functions/properties, appropriate expression bodies, idiomatic properties and control flow; avoid importing Java boilerplate mechanically. |
| Swift | [Official API design guidelines](https://www.swift.org/documentation/api-design-guidelines/) | Clarity at the point of use, meaningful argument labels, and names that communicate roles rather than redundant types. Brevity is secondary to clarity. |
| C++ | [C++ Core Guidelines](https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines) | Names sized to scope, consistent naming, RAII and explicit ownership. Check the supported C++ standard; do not apply C++ advice wholesale to C. |

For other languages, locate the official style/API guide and standard-library documentation before editing. For a framework-specific task, also check that framework's official guidance and the installed version. Research only the languages and decisions involved in the task, not this entire table.
