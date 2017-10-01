# hacky script to fuzzily find an entry from a list of monsters and print found entry
import re
import sys

with open('/home/alec/dotfiles/scripts/fuzzymon/monsters.txt') as f:
    monsters = f.readlines()
monsters = [x.strip() for x in monsters]

def fuzzyfinder(user_input, collection):
    suggestions = []
    pattern = '.*?'.join(user_input)
    regex = re.compile(pattern)
    for item in collection:
        match = regex.search(item)
        if match:
            suggestions.append((len(match.group()), match.start(), item))
    return [x for _, _, x in sorted(suggestions)]

print(fuzzyfinder(sys.argv[1:],monsters)[0])
