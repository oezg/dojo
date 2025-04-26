[$ARGS.positional[] | .[:-1] | tonumber] as $xs
| [$xs[1:], $xs[:-1]] 
| transpose
| map((first - last) * 3600 / $s | floor)
| max
