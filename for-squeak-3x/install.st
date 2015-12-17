
| filenames result file changeSetName pathnames |
filenames _ #(
	'SqueakAmpModel.9.cs'
	'SqueakAmpGUI.9.cs').
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

