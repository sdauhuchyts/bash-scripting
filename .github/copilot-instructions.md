# Workspace Instructions: Advanced Bash Scripting

## Project Overview

This workspace contains educational bash scripts from "Advanced Bash Scripting by Mendel Cooper." Each script is a **self-contained, runnable example** demonstrating specific bash concepts. Scripts are organized by teaching progression from basic positional parameters through error handling and functions.

**Primary Purpose**: Educational reference and working examples for learning bash fundamentals.

## Quick Start

- **Execute any script**: `bash scriptname.sh` or `./scriptname.sh` (make executable first)
- **Interactive scripts**: Some expect user input (case.sh, select.sh, input.sh, coin.sh)
- **No external dependencies**: Most scripts require only bash; none use complex tool chains
- **Testing**: Each script includes test cases or demo code at the end

## Script Organization & Learning Progression

| Script | Focus Area | Key Concepts |
|--------|-----------|--------------|
| `args.sh` | Basics | Positional parameters, `"$@"` quoting |
| `arglist.sh` | Basics | Multiple arguments handling, error checking |
| `array.sh` | Data structures | Array initialization, safe expansion `"${arr[@]}"` |
| `for-loopcmd.sh` | Control flow | For loops, command substitution |
| `case.sh` | Conditionals | Case statements, POSIX character classes `[[:digit:]]` |
| `break.sh` | Loop control | `break`/`continue` in nested loops |
| `select.sh` | User interaction | Menu-driven `select` loops |
| `isalpha.sh` | Functions | Function definitions, validation, return codes |
| `test.sh` | Error handling | Conditional execution `||`, stderr redirection |
| `nested-loop.sh` | Advanced loops | Complex nested iteration patterns |
| `in-list.sh` | String matching | Array membership checks, regex patterns |
| `input.sh` | Input handling | `read` command, loop condition sequencing |
| `read-novar.sh` | Input handling | `read` command basics, variable capture |
| `check-reboot.sh` | System interaction | `uname`, `readlink`, system checks |
| `address.sh` | Data interaction | Contact database, menu-driven selection |

### Supporting Scripts

- **Utility/Helper**: `copy.sh`, `symlinks.sh` (file operations)
- **Arithmetic/Math**: `float.sh`, `pi.sh`, `semver-compare.sh`, `random-numbers.sh`
- **Specialized**: `good-night.sh`, `good-night.ps1`, `findstring.sh`, `trim_http.sh`, `bin-grep.sh`, `coin.sh`, `four-chocolates.sh`, `spawn.sh`, `userlist.sh`, `userlist-1.sh`

## Script Conventions

### Shebang & Portability
- **Preferred**: `#!/usr/bin/env bash` (portable across systems)
- **Also used**: `#!/bin/bash` (direct path)
- Scripts require **bash 3.0+** (use `[[ ]]`, `$()`, arrays)

### Header Documentation
```bash
#!/usr/bin/env bash
# Brief one-line description

#+  Optional multi-line documentation
#+ with +- prefix for annotations
```

### Error Handling Pattern
```bash
E_SUCCESS=0
E_BADDIR=85
E_BADARG=86

error() {
  printf "$@" >&2  # Always use stderr for errors
  return 1
}

# Conditional error propagation
cd "$dir" || error "Cannot access directory: %s\n" "$dir"
```

### Return Codes
- Functions use explicit `return $SUCCESS` / `return $FAILURE`
- Named constants (not magic numbers) for exit codes
- Success = 0, Failure = non-zero (typically 1)

### Array Handling
- **Always quote expansions**: `"${arr[@]}"` not `$arr` or `$arr[*]`
- **Initialization**: `arr=(value1 value2 value3)` or `arr+=(value4)`

### Conditional Syntax
- **Use `[[ ]]` over `[ ]`** (safer, more portable for this codebase)
- **POSIX character classes** for portability: `[[:digit:]]`, `[[:lower:]]`, `[[:upper:]]`
- Avoid older `[a-z]` patterns (non-portable across locales)

### Function Definitions
```bash
functionname() {
  local varname="$1"  # Use local scope
  # Function body
  return $SUCCESS
}
```

### Quoting Discipline
- Always quote variables: `"$var"`, `"${var[@]}"`
- Especially critical for: file paths, command substitution, array expansion
- Use `set -o nounset` where appropriate to catch unset variables

## Development Workflow

### Running Scripts
```bash
# Direct execution
bash script.sh [arguments]

# Or make executable first
chmod +x script.sh
./script.sh [arguments]

# Interactive scripts
bash select.sh         # Choose from menu
bash coin.sh           # Coin flip simulation
bash case.sh           # Case statement demo
```

### Testing Pattern
Most scripts include self-contained test harness at the end:
```bash
# Function definitions
functionname() { ... }

# Test/demo code (usually runs when script is executed)
functionname "test input"
```

### Modification & Learning
Scripts include "Exercise:" comments suggesting modifications:
- Add new functionality
- Modify parameters
- Extend to new use cases
- Study the output differences

## Common Patterns in This Codebase

### 1. **Command Substitution for Information**
```bash
result=$(command)           # Capture output
for item in $(cmd); do ...; done
```

### 2. **Arithmetic Expansion**
```bash
(( count++ ))              # Increment
(( sum = x + y ))
(( result = x * 2 ))
```

### 3. **Conditional Execution**
```bash
cd "$dir" || { error "Failed"; exit 1; }
[[ -f "$file" ]] && echo "File exists"
```

### 4. **Here Documents for Multi-line Text**
```bash
cat << EOF
Multi-line text here
References $var work
EOF
```

### 5. **Function as Library Pattern**
Define functions, then test them:
```bash
# Library section
validate_input() { ...; }
process_data() { ...; }

# Test/execution section  
validate_input "$arg"
process_data "$result"
```

## Potential Pitfalls

1. **Quoting mistakes**: `$var` vs `"$var"` - always quote unless expansion is intentional
2. **Unset variables**: Enable `set -o nounset` to catch errors early
3. **Array iteration**: Use `"${arr[@]}"` not `$arr` or `$arr[*]`
4. **Exit code checks**: Remember `0 = success`, `1+ = failure` (opposite of most languages)
5. **Word splitting**: Unquoted variables split on IFS - usually not desired
6. **Locale issues**: Character classes `[[:digit:]]` work everywhere; `[0-9]` may not
7. **Subprocess scope**: Variables set in subshells don't persist in parent shell

## Best Practices When Adding Scripts

1. **Use portable shebangs**: `#!/usr/bin/env bash` preferred
2. **Include descriptive headers** with purpose and any special requirements
3. **Follow error handling pattern**: Define return codes, use `||` for propagation
4. **Quote all variable expansions** by default
5. **Use POSIX character classes** for portability
6. **Add inline comments** explaining non-obvious logic
7. **Include test/demo code** that can run the script standalone
8. **Test on bash 3.0+** syntax compatibility

## Resources

- **Inside this repo**: Each script is self-documenting with inline comments
- **External**: "Advanced Bash Scripting Guide" by Mendel Cooper (full book online)
- **Testing**: Standard `bash` command - no special test framework needed

---

**Note**: This is a learning repository. Scripts prioritize clarity and teaching value over production optimization. Some patterns are intentionally verbose to demonstrate concepts.
