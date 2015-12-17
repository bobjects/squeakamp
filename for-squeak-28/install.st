
| filenames result file changeSetName pathnames |
filenames _ #('MPEGPlayerJMM.10.cs'
	'MPEGPlayerMorph.10.cs'
	'MPEGPlayerMorphicFixJMM.1.cs'
	'MPEGPlayerFixBadParmsJMM.2.cs'
	'SqueakAmpModel.9.cs'
	'SqueakAmpGUI.8.cs').
filenames do:
	[:filename | | allDirectoryFilenames |
	((FileDirectory default) fileExists: filename) 
		ifFalse: 
			[PopUpMenu inform:filename, ' does not exist.'.]
		ifTrue:
			[ | matchingFilenames fileinFilename|
			changeSetName _ (filename findTokens:'.') first.
			file _ FileStream readOnlyFileNamed: filename.
			[
			ChangeSorter newChangesFromStream: file named: changeSetName.
			] ensure: [file close.].
			].
	].

