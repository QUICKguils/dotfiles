" Configuration de la barre de statut
let g:lightline = {
\	'colorscheme':'onedark',
\	'active': {
\		'left': [
\			['mode', 'paste'],
\			['fugitive', 'filename', 'readonly', 'mymodified']
\		],
\		'right': [['lineinfo'], ['filetype'], ['fileencoding']]
\	},
\	'inactive': {
\		'left': [['filename', 'readonly', 'mymodified']],
\		'right': [['lineinfo']]
\	},
\	'component': {'lineinfo': "%P \u2022 %L"},
\	'component_function': {
\		'readonly':   'LightlineReadonly',
\		'fugitive':   'LightlineFugitive',
\		'mymodified': 'LightlineModified'
\	},
\	'separator': {'left': "", 'right': ""},
\	'subseparator': {'left': "│", 'right': "│"}
\}

" Barre de statut : afficher le verrou  si fichier 'read only'
function! LightlineReadonly()
	return &readonly ? "\ue0a2" : ''
endfunction

" Barre de statut : afficher la branche  si git est activé pour le dossier
function! LightlineFugitive()
	if exists('*FugitiveHead')
		let branch = FugitiveHead()
		return branch !=# '' ? "\ue0a0 ".branch : ''
	endif
	return ''
endfunction

" Barre de statut : afficher '+' seulement si le fichier est modifié
function! LightlineModified()
	return &modifiable && &modified ? '+': ''
endfunction
