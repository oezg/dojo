def second: .[1];
def third: .[2];
def penultimate: .[-2];
def rest: .[1:];
def butlast: .[:-1];
def mean: add / length;

def find_index(predicate):
    def _find:
        if . == [] then
            null
        elif first.value | predicate then
            first.key
        else
            rest | _find
        end;
    to_entries | _find;

def partition(filter):
    def _partition:
        if .array == [] then
            [.left, .right]
        else
            (.array | first) as $head
            | if $head | filter then
                .left += [$head]
            else
                .right += [$head]
            end
            | .array |= rest
            | _partition
        end;

    {array: ., left: [], right: []} | _partition;