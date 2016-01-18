#!/usr/bin/python3
from __future__ import print_function
import sys
from itertools import takewhile, chain

try:
    import colorama
    from colorama import Fore, Style
    HAS_COLORAMA = True
except ImportError:
    HAS_COLORAMA = False

def is_command(line):
    """test if text line has any text that is not comment and whitespace"""
    line = line.strip()
    return line and not line.startswith('#')


def enumerate_if(cond, sequence, start=0):
    """conditional version of std library enumerate"""
    count = start
    for elem in sequence:
        if cond(elem):
            yield count, elem
            count += 1
        else:
            yield None, elem


def number_line(num, line):
    """reformat line if there is additional sequence number"""
    if num is not None:
        if HAS_COLORAMA:
            return '{COLOR}({NUM}){RESET} {LINE}'.format(COLOR=Fore.GREEN,
                                                         NUM=num,
                                                         RESET=Style.RESET_ALL,
                                                         LINE=line)
        else:
            return '({NUM}) {LINE}'.format(NUM=num, LINE=line)

    return line


def parse_range(text):
    """parse text in page printer like algorithm to generate int ranges"""
    res = set()
    if not text:
        return res

    for item in text.split(','):
        beg, _, end = item.partition('-')
        if beg.isdigit():
            if end.isdigit():
                res = res.union(range(int(beg), int(end)+1))
            else:
                res.add(int(beg))
    return res


def partition(iterable, value):
    """ Split list into a two elem tuple. With elements prior to a given value
    in the first bucket and values after in the second.
    The value itself is dropped"""
    iterator = iter(iterable)
    return (list(takewhile(lambda x: x != value, iterator)), list(iterator))


def chain_files(path_list):
    """chain file contents as an iterator"""
    for path in path_list:
        with open(path, 'r') as handle:
            for line in handle:
                yield line


def main():
    "application entrypoint"

    if HAS_COLORAMA:
        colorama.init()

    inputs = sys.argv[1:]
    filters, files = partition(inputs, '--')

    filter_set = set()
    for in_text in filters:
        filter_set = filter_set.union(parse_range(in_text))

    in_handles = iter([])
    if not sys.stdin.isatty():
        in_handles = chain(in_handles, sys.stdin)

    if files:
        in_handles = chain(in_handles, chain_files(files))

    pairs = enumerate_if(is_command, in_handles)

    if not filter_set:
        for pair in pairs:
            print(number_line(*pair), end="")
    else:
        out = [line for num, line in pairs if num in filter_set]
        print("".join(out), end="")


if __name__ == "__main__":
    main()
