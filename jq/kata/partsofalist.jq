($s / " ") as $w
| [range(1; $w | length)
| [$w[:.], $w[.:]]
| map(join(" "))
| "(\(first),\(last))"]
| add
