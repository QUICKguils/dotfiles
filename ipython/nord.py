""" Nord theme for Pygments.

Pygments theme inspired by the 'nord-vim' color scheme, written by
arcticicestudio (see <https://github.com/arcticicestudio/nord-vim.git>).

Author:    Guilain Ernotte <guilainsjc@gmail.com>
copyright: Copyright 2006-2021 by the Pygments team, see AUTHORS.
license:   BSD, see LICENSE for details.
"""

from pygments.style import Style
from pygments.token import (Comment, Generic, Keyword, Name, Number, Operator,
                            Punctuation, String, Token, Error)


class NordStyle(Style):
    """ Theme inspired by nord-vim."""

    background_color = '#2e3440'
    default_style = ""
    styles = {
        Token: '#d8dee9',

        Punctuation: '#d8dee9',
        Punctuation.Marker: '#d8dee9',

        Keyword: '#81a1c1',
        Keyword.Constant: '#d8dee9',
        Keyword.Declaration: '#81a1c1',
        Keyword.Namespace: '#5e81ac',
        Keyword.Reserved: '#81a1c1',
        Keyword.Type: '#8fbcbb',

        Name: '#d8dee9',
        Name.Attribute: '#d8dee9',
        Name.Builtin: '#81a1c1',
        Name.Class: '#8fbcbb',
        Name.Function: '#88c0d0',
        Name.Function.Magic: '#d08770',
        Name.Other: '#d8dee9',
        Name.Tag: '#81a1c1',
        Name.Decorator: '#d08770',
        Name.Variable.Class: '#8fbcbb',

        String: '#a3be8c',

        Number: '#b48ead',

        Operator: '#81a1c1',

        Comment: '#616e88',

        Error: 'bg:#bf616a #d8dee9',

        Generic: '#d08770'
    }
