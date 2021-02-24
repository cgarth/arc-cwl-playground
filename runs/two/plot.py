#!/usr/bin/env python3

import pandas as pd, plotly.express as px, sys

data = pd.read_csv( sys.argv[1],
    header=None,
    names=['count', 'word'],
    delimiter=' '
)

title="Occurence of words in the Lutheran bible"

fig = px.bar(data, x='word', y='count', title=title)
fig.write_image('test.pdf')