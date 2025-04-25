def target:
    . as $days
    | "2016-01-01"
    | strptime("%Y-%m-%d")
    | mktime + 60*60*24*$days
    | strftime("%Y-%m-%d");

def cumterest:
    if .target <= .balance then
        .days
    else
        .days += 1
        | .balance *= (1 + .rate)
        | cumterest
    end;

{
    days: 0, 
    balance: $ARGS.positional[0], 
    target: $ARGS.positional[1], 
    rate: ($ARGS.positional[2] / 36000)
}
| cumterest
| target