def second: .[1];
def third: .[2];
def penultimate: .[-2];
def rest: .[1:];
def butlast: .[:-1];
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
