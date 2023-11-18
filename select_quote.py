#!/usr/bin/env python3

import tomllib
import random
import textwrap

from argparse import ArgumentParser


def wrap_text(input_text, max_width):
    wrapped_text = textwrap.fill(input_text, width=max_width)
    return wrapped_text

if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("source")
    parser.add_argument("max_width")
    args = parser.parse_args()

    with open(args.source, "rb") as file:
        quotes = tomllib.load(file)["quotes"]
    selected_quote = quotes[int(random.random() * len(quotes))]
    quote, author = selected_quote["text"], selected_quote["author"]
    author = "-"+author
    max_width = min([int(args.max_width), len(quote)])
    print(f"{wrap_text(quote, max_width)}\n{author:>{max_width}}")



