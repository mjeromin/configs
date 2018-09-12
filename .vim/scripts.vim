if did_filetype()
    finish
endif
if getline(2) =~ '.*syntax=python.*'
    setfiletype python
endif
