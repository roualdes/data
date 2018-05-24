# https://nbconvert.readthedocs.org/en/latest/nbconvert_library.html
import glob
from pathlib import Path

import nbformat
from nbconvert import MarkdownExporter
from traitlets.config import Config

c = Config()
c.MarkdownExporter.preprocessors = [
    'nbconvert.preprocessors.ExtractOutputPreprocessor'
]
md_exporter = MarkdownExporter(congif=c)


NOTEBOOK_MD_DIR = Path('chapters/')

def convert_notebooks_to_md(notebooks):
    """Convert notebooks to Markdown and store in NOTEBOOK_MD_DIR."""

    for notebook in notebooks:
        name = Path(notebook).name.split('.')[0]
        nb_raw = nbformat.read(notebook, 4)
        (body, resources) = md_exporter.from_notebook_node(nb_raw)
        output_file = NOTEBOOK_MD_DIR/name/(name+'.md')
        if not output_file.parent.exists():
            output_file.parent.mkdir()
        with open(output_file, 'w') as outfile:
            outfile.write(body)

        for path, figure in resources['outputs'].items():
            output_fig = NOTEBOOK_MD_DIR/name/path
            with open(output_fig, 'wb') as outfig:
                outfig.write(figure)


if __name__ == '__main__':
    notebooks = glob.glob('notebooks/*.ipynb')
    convert_notebooks_to_md(notebooks)
