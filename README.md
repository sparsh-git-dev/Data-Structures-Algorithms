# DSA

Curated LeetCode practice repo with code, notes, and pennote screenshots.

For each problem you typically find:

- `code.dart` — solution
- `sol.md` — approach, complexity, edge cases
- images — pennote / screenshot notes

LeetCode profile: https://leetcode.com/u/CodeWithSparsh/

## Folder structure

```text
<topic>/<pattern>/<difficulty>/<problem-folder>/
  code.dart
  sol.md
  *.png | *.jpg
```

- **topic** — DSA area (`arrays`, `graphs`, `dynamic_programming`, …)
- **pattern** — technique within that topic (`bfs`, `prefix_sum`, `knapsack`, `general`, …)
- **difficulty** — `easy` | `medium` | `hard`
- **problem-folder** — existing problem name (usually `LTC NNN. Title`)

Helpers and topic notes live beside problems, e.g. `trees/helpers/`, `segment_tree/notes/`, `dynamic_programming/notes/`.

### Topics

| Topic | Examples of patterns |
|-------|----------------------|
| `arrays` | `prefix_sum`, `difference_array`, `circular_array`, `min_operations_technique` |
| `two_pointers` | `general` |
| `sliding_window` | `classic`, `general` |
| `binary_search` | `rotated_array`, `answer_on_value`, `general` |
| `strings` | `general` |
| `linked_list` | `helpers` |
| `stack` | `collision`, `general`, `commons` |
| `heap` | `general` |
| `trees` | `construction`, `balanced`, `helpers` |
| `segment_tree` | `general`, `notes` |
| `graphs` | `bfs`, `dfs`, `union_find`, `shortest_path`, `topo_sort`, `cycle_detection`, `state_space` |
| `dynamic_programming` | `knapsack`, `assignment`, `string_transforms`, `general`, `notes` |
| `greedy` | `general` |
| `bit_manipulation` | `and`, `or`, `xor`, `notes` |
| `math` | `general` |
| `recursion` | `general` |
| `simulation` | `grid_traversal`, `robots` |
| `design` | `priority_queue` |
| `probability` | `general` |
| `kadane` / `sorting` / `lexicographical` / `intersection` | `general` (+ `notes` where applicable) |
| `core` | shared helpers |

Root utilities: `coding_ground.dart`, `annotations.dart`.

## Adding a new problem

1. Pick topic + pattern (+ `general` if unsure).
2. Create `topic/pattern/difficulty/LTC NNN. Title/`.
3. Add `code.dart`, `sol.md`, and any screenshots.

Example:

```text
graphs/bfs/hard/LTC 407. Trapping Rain Water II/
```
