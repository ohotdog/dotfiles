# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

atom.commands.add '.tree-view', 'tree-view:preview', ->
    for panel in atom.workspace.getLeftPanels()
        if panel.item.constructor.name == "TreeView"
            entry = panel.item.selectedEntry()
            if entry.classList[0] == "directory"
              entry.toggleExpansion()
              return
            else
              atom.workspace.open(entry.getPath(), pending: true, activatePane: false)
              return
